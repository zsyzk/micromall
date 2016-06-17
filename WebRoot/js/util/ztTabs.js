
function ztTabs(){
	var tabs = $("#tabs");
	this.init = function(){
		tabs.tabs({
			fit:true,
			border:true,
			tabHeight:37,
			tools:'#tabTool',
			toolPosition:'right'
		});
		
		tabs.tabs({
			onAdd:function (title){
				/*	if(-1!=title.indexOf(":")){
					var newTitle = title.substring(0,title.indexOf(":"));
					var sTab = tabs.tabs('getTab',title);
					sTab.title = newTitle;
					tabs.tabs('update',{
						tab:sTab,
						options : {
							title :	sTabsTab
						}
					});
				}*/
			},
			onBeforeClose: function(title,index){
				var target = this;
				var data = getDocumentDataGrid(title);
				if(null !=data){
					if(data.getEditDataArray().length>0){
			        	$.messager.confirm("Confirm","该页存在未保存数据,是否保存?",function(r)
			    	    {
			    	      if(r){
			    	    	  data.saveEditHandle(data.getSaveEditMethodQ());
			    	       }
			    	      	var opts = $(target).tabs('options');
			  				var bc = opts.onBeforeClose;
			  				opts.onBeforeClose = function(){};  // 允许现在关闭
			  				$(target).tabs('close',index);
			  				opts.onBeforeClose = bc;
			    	   });
			        	return false;
					}
				}
				
			}
		});
		
		//首页
		this.addTab(getHome());
		
	};
	
	var getHome = function(){
		var home = new tab();
		home.setClosable(false);
		home.setHref(getRootPath()+"home/preloadMain.shtm");
		home.setSelected(true);
		home.setTitle("首页");
		return home;
	};
	
	this.selectTab = function(href,title){
		var sTab = tabs.tabs('getTab',title);
		if(null == sTab){
			sTab = new tab();
			sTab.setClosable(true);
			sTab.setHref(href);
			sTab.setSelected(true);
			sTab.setTitle(title);
			this.addTab(sTab);
		}else{
			tabs.tabs('select',title);
		}
	};
	this.openTabByHref =  function(href,title){
		var existTab = this.getTabByHref(href);
		if(existTab){
			var tabIndex = tabs.tabs('getTabIndex',existTab);
			tabs.tabs('select',tabIndex);
		}else{
			var sTab = new tab();
			sTab.setClosable(true);
			sTab.setHref(href);
			sTab.setSelected(true);
			sTab.setTitle(title);
			this.addTab(sTab);
		}
	}
	this.getTabByHref = function(href){
		var hTab = null;
		var Hreftabs = tabs.tabs('tabs');
		for(var t in Hreftabs){
			if(isNotNull(href)){
				var tHref = Hreftabs[t].panel('options').href;
				if(tHref.split("infoType")[0]+"" == href.split("infoType")[0]+""){
					hTab = Hreftabs[t];
					break;
				}
			}
		}
		return hTab;
	}
	this.addTab = function(tab){
		tabs.tabs('add',{
			title:tab.getTitle(),
			selected:tab.getSelected(),
			href:tab.getHref(),
			closable:tab.getClosable()
		});
	};
	this.refreshTab = function(href){
		var current_tab = tabs.tabs('getSelected');
		tabs.tabs('update',{
		     tab:current_tab,
		     options : {
		          href : href
		     }
		});
	}
}

function tab(){
	var title = "";
	var href = "";
	var closable = false;
	var selected = false;
	
	this.getTitle = function(){
		return title;
	};
	
	this.setTitle = function(fTitle){
		title = fTitle;
		return this;
	};
	
	this.getHref = function(){
		return href;
	};
	
	this.setHref = function(fHref){
		href = fHref;
		return this;
	};
	
	this.getClosable = function(){
		return closable;
	};
	
	this.setClosable = function(fClosable){
		closable = fClosable;
		return this;
	};
	
	this.getSelected = function(){
		return selected;
	};
	
	this.setSelected = function(fSelected){
		selected = fSelected;
		return this;
	};
	
}