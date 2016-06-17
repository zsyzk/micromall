
(function() {
	// 创建GCanvas构造方法的闭包和全局引用
	var GCanvas = window.GCanvas = function(id, w, h) {
		return new Canvas(id, w, h);
	}
	var getElementsByName1 = function(tag, name){
       	var returns = document.getElementsByName(name);
      	if(returns.length > 0) return returns;
      	returns = new Array();
      	var e = document.getElementsByTagName(tag);
     	for(var i = 0; i < e.length; i++){
      		if(e[i].getAttribute("name") == name){
      		returns[returns.length] = e[i];
      		}
      	}
      	return returns;
       }
	/**
	 * 用指定的id, 长和宽构造一个画板
	 * 
	 * @param id html元素的id
	 * @param w 指定的画板宽度
	 * @param h 指定的画板高度
	 */
	var Canvas = function(id, w, h) {
		if(id != null){

			
			// 只想Canvas实例,以修正this指针的引用错误.
			var self = this;
			
			// 缓冲器
			var cache = [];
			
			// 画板绑定到的html元素的引用
			var canvas = document.getElementById(id);
			
			// 画板底色, 默认为浅灰色
			var bgColor = "lightgray";

			// 笔刷的颜色, 默认为黑色
			var fgColor = "black";

			// 原点坐标, 初始为(0, 0)
			var oX = 0, oY = 0;

			// 是否允许点画到画板边界以外
			var allowOutside = false;

			// 渲染html元素
			canvas.onselectstart = function() {return false;}
			canvas.style.overflow = "hidden";
			canvas.style.background = "lightblue";
			canvas.style.width = (w ? w : 400) + "px";
			canvas.style.height = (h ? h : 400) + "px";
			

			/**
			 * 获取画板左上角的在文档中的绝对坐标
			 *
			 * @return 形如{x, y}的坐标
			 */
			this.pos = function() {
				//alert("Test canvas");
				var rect = canvas.getClientRects()[0];
				return {
					x: rect.left,
					y: rect.top
				};
			}

			/**
			 * 清空画板
			 */
			this.clear = function() {
				cache = [];
				canvas.innerHTML = "";
			}
			/**
			 * 清空直线
			 */
			this.clearPoint = function() {
				//alert(canvas.innerHTML)
				var p2 = getElementsByName1("span","pointxxx");
						  
				//alert(p2.length)
				for(var i=0;i<p2.length;i++)
					canvas.removeChild(p2[i]); 
			
			}

			/**
			 * 设置或取得画板的大小, 如果缓存不为空,则设置无效
			 *
			 * @param w 新的宽度
			 * @param h 新的高度
			 * @return 形如{width, height}的尺寸
			 */
			 this.size = function(w, h) {
				if (w && h) {
					if (cache.length != 0) return;
					canvas.style.width = w + "px";
					canvas.style.height = h + "px";
				} else {
					return {
						width: parseInt(canvas.style.width),
						height: parseInt(canvas.style.width)
					};
				}
			}

			/**
			 * 设置或取得是否允许点显示到画板边界以外
			 *
			 * @param flag true为允许显示,false为不允许,其它为不做改变
			 * @return 是否允许显示
			 */
			this.allowOutside = function(flag) {
				if (flag == true || flag == false)
					allowOutside = flag;
				return allowOutside;
			}

			/**
			 * 设置或取得笔刷颜色
			 * 颜色的格式为:
			 * rgb(r, g, b) 其中r, g, b为0-255的整数
			 * #000000 ~ #FFFFFF
			 * 字符串描述 如: red, blue, black, lightblue
			 *
			 * @param color 新的笔刷颜色
			 * @return 当前笔刷颜色
			 */
			this.fgColor = function(color) {
				fgColor = (color ? color: fgColor);
				return fgColor;
			}

			/**
			 * 设置或取得画布颜色
			 * 颜色的格式为:
			 * rgb(r, g, b) 其中r, g, b为0-255的整数
			 * #000000 ~ #FFFFFF
			 * 字符串描述 如: red, blue, black, lightblue
			 *
			 * @param color 新的画布颜色
			 * @return 当前画布颜色
			 */
			this.bgColor = function(color) {
				bgColor = (color ? color: bgColor);
				canvas.style.background = bgColor;
				return bgColor;
			}
			
			/**
			 * 在给定的坐标出画点
			 *
			 * @param x x坐标
			 * @param y y坐标
			 */
			this.point = function(x, y,spanWidth,spanHeight) {
				var pos = self.pos();
				var size = self.size();
				x = pos.x + oX + x;
				y = pos.y + oY + y;
				
				// 如果不允许在边界外显示点,则不讲该点推入缓存
	/*			if (!allowOutside 
					&& !((x >= pos.x+25 && x <= pos.x + size.width-spanWidth)
					&& (y >= pos.y+25 && y <= pos.y + size.height-spanHeight))){
					x = pos.x + size.width-25;
					
				}*/
				if(x <pos.x+spanWidth){
					x = pos.x;
				}else if(x>pos.x + size.width-spanWidth){
					x = pos.x + size.width-spanWidth;
				}
				
				if(y <pos.y+spanHeight){
					y = pos.y;
				}else if(y>pos.y + size.height-spanHeight){
					y = pos.y + size.height-spanHeight;
				}
				
				cache.push("<span  name= 'pointxxx' style='width:"+spanWidth+"px;height:"+spanHeight+"px;position:absolute;left:" + x +"px;top:" + y + "px;background-color:" + fgColor + ";font-size:0px;z-index:999;'></span>");
			}
			
			/**
			 * 数值微分法画直线
			 *
			 * @param x0 起点x坐标
			 * @param y0 起点y坐标
			 * @param x1 终点x坐标
			 * @param y1 终点y坐标
			 */
			function line_DDA(x0, y0, x1, y1) {
				var px = x0, py = y0;
				var dx = x1 - x0;
				var dy = y1 - y0;
				var incX = 0, incY = 0;
				var epsl = Math.abs(dx) > Math.abs(dy) ? Math.abs(dx) : Math.abs(dy);
				incX = dx / epsl;
				incY = dy / epsl;
				for (var i = 0; i < epsl; i++) {
					self.point(parseInt(px + 0.5), parseInt(py + 0.5));
					px += incX;
					py += incY;
				}
			}
			
			/**
			 * 用给定的起点和终点坐标画直线
			 *
			 * @param x0 起点x坐标
			 * @param y0 起点y坐标
			 * @param x1 终点x坐标
			 * @param y1 终点y坐标
			 */
			this.line = function(x0, y0, x1, y1) {
				line_DDA(x0, y0, x1, y1);
			}
			
			/**
			 * 用中点Bresenham法画圆
			 *
			 * @param x 圆心x坐标
			 * @param y 圆心y坐标
			 * @param r 圆的半径
			 */
			function circle_MidBresenham(x, y, r) {
				var px, py, d;
				px = 0; py = r; d = 1 - r;
				while (px < py) {
					self.point(x + px, y + py);
					self.point(x + py, y + px);
					self.point(x - px, y + py);
					self.point(x + py, y - px);
					self.point(x + px, y - py);
					self.point(x - py, y + px);
					self.point(x - px, y - py);
					self.point(x - py, y - px);
					if (d < 0) d += 2 * px + 3;
					else {
						d += 2 * (px - py) + 5;
						py--;
					}
					px++;
				}
			}
			
			/**
			 * 用给定的圆心坐标和半径画圆
			 *
			 * @param x 圆心x坐标
			 * @param y 圆心y坐标
			 * @param r 圆的半径
			 */
			this.circle = function(x, y, r) {
				circle_MidBresenham(x, y, r);
			}
			
			/**
			 * 用中点Bresenham法画椭圆
			 *
			 * @param x 圆心x坐标
			 * @param y 圆心y坐标
			 * @param a 长半轴长度
			 * @param b 短半轴长度
			 */
			function MidBresenhamEllipse(x, y, a, b) {
				var px, py;
				var d1, d2;
				px = 0;
				py = b;
				d1 = b * b + a * a * (-b + 0.25);
				self.point(x + px, y + py);
				self.point(x - px, y - py);
				self.point(x - px, y + py);
				self.point(x + px, y - py);
				while (b * b * (px + 1) < a * a * (py - 0.5)) {
					if (d1 <= 0) {
						d1 += b * b * (2 * px + 3);
						px++;
					} else {
						d1 += b * b * (2 * px + 3) + a * a * (-2 * py + 2);
						px++;
						py--;
					}
					self.point(x + px, y + py);
					self.point(x - px, y - py);
					self.point(x - px, y + py);
					self.point(x + px, y - py);
				}
				d2 = b * b * (px + 0.5) * (px + 0.5) + a * a * (py - 1) * (py - 1) - a * a * b * b;
				while (py > 0) {
					if (d2 <= 0) {
						d2 += b * b * (2 * px + 2) + a * a * (-2 * py + 3);
						px++;
						py--;
					} else {
						d2 += a * a * (-2 * py + 3);
						py--;
					}
					self.point(x + px, y + py);
					self.point(x - px, y - py);
					self.point(x - px, y + py);
					self.point(x + px, y - py);
				}
			}

			/**
			 * 用给定的圆心坐标和长短半轴画椭圆
			 *
			 * @param x 圆心x坐标
			 * @param y 圆心y坐标
			 * @param a 长半轴长度
			 * @param b 短半轴长度
			 */
			this.ellipse = function(x, y, a, b) {
				MidBresenhamEllipse(x, y, a, b);
			}


			/**
			 * 将缓存中的图像显示到画板上,并清空缓存
			 */
			this.paint = function() {
				canvas.innerHTML += cache.join("");;
				cache = [];
				
			}
		
		}
	}
})();