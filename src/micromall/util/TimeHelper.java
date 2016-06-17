package micromall.util;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
/**
 * 
 * @ClassName:     TimeHelper.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:18:56
 */
public class TimeHelper implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static SimpleDateFormat monthFormatter = new SimpleDateFormat(
			"yyyy-MM");

	private static SimpleDateFormat dateFormatter = new SimpleDateFormat(
			"yyyy-MM-dd");

	private static SimpleDateFormat noSecondFormatter = new SimpleDateFormat(
	"yyyy-MM-dd HH:mm");
	
	private static SimpleDateFormat timeFormatter = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	public static final String oneDayHHMMSS = " 23:59:59";
	public static final String timeZero = " 00:00:00";

	/**
	 * 根据给定日期返回�?
	 * @param date
	 * @return
	 */
	public static int getDay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_MONTH);
	}
	
	/**
	 * 根据给定日期返回�?
	 * @param date
	 * @return
	 */
	public static int getMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.MONTH);
	} 
	
	/**
	 * 根据给定日期返回�?
	 * @param date
	 * @return
	 */
	public static int getYear(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.YEAR);
	}
	
	/**
	 * 返回当前小时数，范围0~23
	 * 
	 * @return
	 */
	public static int getCurrentHour() {
		Calendar cal = new GregorianCalendar();
		return cal.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * 返回当前�?
	 * 
	 * @return
	 */
	public static int getCurrentDay() {
		Calendar cal = new GregorianCalendar();
		return cal.get(Calendar.DAY_OF_MONTH);
	}	

	/**
	 * 返回当前月份，范围：0~11;
	 * 
	 * @return
	 */
	public static int getCurrentMonth() {
		Calendar cal = new GregorianCalendar();
		return cal.get(Calendar.MONTH);
	}

	/**
	 * 返回当前年份;
	 * 
	 * @return
	 */
	public static int getCurrentYear() {
		Calendar cal = new GregorianCalendar();
		return cal.get(Calendar.YEAR);
	}

	/**
	 * 根据偏移量返回月份，范围�?~11 如当前为3月，offerset取�?�?1，则返回2
	 * 
	 * @return
	 */
	public static int getMonthByOfferset(int offerset) {
		Calendar cal = new GregorianCalendar();
		cal.add(Calendar.MONTH, offerset);
		return cal.get(Calendar.MONTH);
	}

	/**
	 * 返回当前系统日期（不含时间），以字符串的形式返回，格�?yyyy-MM-dd"
	 * 
	 * @return
	 */
	public static String getCurrentDateString() {

		return dateFormatter.format(new Date());
	}

	public static Date getCurrentDateWithoutSecond(){
		java.util.Date date = null;
		try {
			date = dateFormatter.parse(noSecondFormatter.format(new Date()));
		} catch (ParseException ex) {
		}
		return date;
	}
	
	/**
	 * 返回当前系统日期（时间为"00:00:00"�?
	 * 
	 * @return
	 */
	public static java.util.Date getCurrentDate() {
		java.util.Date date = null;
		try {
			date = dateFormatter.parse(dateFormatter.format(new Date()));
		} catch (ParseException ex) {
		}
		return date;
	}
	
	/**
	 * 格式化时间格式为日期类型（时间为"00:00:00"�?
	 * @param time
	 * @return
	 */
	public static java.util.Date formatDate(Date time){
		java.util.Date date = null;
		try {
			Calendar cal =Calendar.getInstance();
			cal.setTime(time);
			date = dateFormatter.parse(dateFormatter.format(cal.getTime()));
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 根据日期偏移�?dayOffset)取得系统日期（时间为"00:00:00"�?
	 * 如dayOffset=-1，则返回昨天日期，dayOffset=1，则返回明天日期
	 * 
	 * @param dayOffset
	 *            日期偏移�?
	 * @return
	 */
	public static java.util.Date getDateByDayOffset(int dayOffset) {
		java.util.Date date = null;
		try {
			Calendar cal = new GregorianCalendar();
			cal.add(Calendar.DAY_OF_MONTH, dayOffset);
			date = dateFormatter.parse(dateFormatter.format(cal.getTime()));
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 根据日期偏移�?dayOffset)取得给定日期（时间为"00:00:00"�?
	 * 如dayOffset=-1，则返回昨天日期，dayOffset=1，则返回明天日期
	 * 
	 * @param dayOffset
	 *            日期偏移�?
	 * @return
	 */
	public static java.util.Date getDateByDayOffset(java.util.Date date,
			int dayOffset) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DAY_OF_MONTH, dayOffset);
			date = dateFormatter.parse(dateFormatter.format(cal.getTime()));
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 根据小时偏移�?monthOffset)取得给定日期（时间为"00:00:00"�?
	 * 如monthOffset=-1，则返回上个小时日期，monthOffset=1，则返回下个小时日期
	 * 
	 * @param hourOffset
	 *            小时偏移�?
	 * @return
	 */
	public static java.util.Date getDateByHourOffset(java.util.Date date,
			int hourOffset) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.HOUR_OF_DAY, hourOffset);
			date = dateFormatter.parse(dateFormatter.format(cal.getTime()));
		} catch (ParseException ex) {
		}
		return date;
	}
	
	/**
	 * 根据月份偏移�?monthOffset)取得给定日期（时间为"00:00:00"�?
	 * 如monthOffset=-1，则返回上个月日期，monthOffset=1，则返回下个月日�?
	 * 
	 * @param monthOffset
	 *            月份偏移�?
	 * @return
	 */
	public static java.util.Date getDateByMonthOffset(java.util.Date date,
			int monthOffset) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.MONTH, monthOffset);
			date = dateFormatter.parse(dateFormatter.format(cal.getTime()));
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 根据日期偏移�?dayOffset)取得系统日期，以字符串的形式返回，格�?yyyy-MM-dd"
	 * 如dayOffset=-1，则返回昨天日期，dayOffset=1，则返回明天日期
	 * 
	 * @param dayOffset
	 *            日期偏移�?
	 * @return String 根据日期偏移量计算出来的日期字符串，不含时间
	 */
	public static String getDateStringByDayOffset(int dayOffset) {
		Calendar cal = new GregorianCalendar();
		cal.add(Calendar.DAY_OF_MONTH, dayOffset);
		return dateFormatter.format(cal.getTime());
	}

	/**
	 * 取得当前系统日期时间，以字符串的形式返回（包括时间），格�?yyyy-MM-dd HH:mm:ss"
	 * 
	 * @return String 当前日期字符串（包括时间�?
	 */
	public static String getCurrentTimeString() {
		return timeFormatter.format(new Date());
	}

	/**
	 * 取得当前系统日期时间
	 * 
	 * @return Date 当前系统日期
	 */
	public static java.util.Date getCurrentTime() {
		return new Date();
	}
	
	  /**   
	  * 判断给定日期是不是润�?  
	  * @param p_date 给定日期    
	  * @return boolean 如果给定的年份为闰年，则返回 true；否则返�?false�?  
	  * @Date: 2006-10-31   
	  */   
	     public static boolean isLeapYear(Date p_date) {    
	       int l_year = getYear( p_date );    
	       GregorianCalendar l_calendar = new GregorianCalendar();    
	       return l_calendar.isLeapYear( l_year );    
	     }    

	/**
	 * 将字符串转换成java.utile.Date类型，格�?yyyy-MM-dd"
	 * 
	 * @param sDate
	 *            字符串日�?
	 * @return Date
	 */
	public static java.util.Date StringToDate(String sDate) {
		java.util.Date date = null;
		try {
			date = dateFormatter.parse(sDate);
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 将字符串转换成java.utile.Date类型，格�?yyyy-MM"
	 * 
	 * @param sMonth
	 *            字符串月�?
	 * @return Date
	 */
	public static java.util.Date StringMonthToDate(String sMonth) {
		java.util.Date date = null;
		try {
			date = monthFormatter.parse(sMonth);
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 将字符串转换成java.utile.Date类型，格�?yyyy-MM-dd HH:mm:ss"
	 * 
	 * @param sDate
	 *            字符串日�?
	 * @return Date
	 */
	public static java.util.Date stringToTime(String sDate) {
		java.util.Date date = null;
		try {
			date = timeFormatter.parse(sDate);
		} catch (ParseException ex) {
		}
		return date;
	}
	
	public static java.util.Date stringToNoSecondTime(String sDate) {
		java.util.Date date = null;
		try {
			date = noSecondFormatter.parse(sDate);
		} catch (ParseException ex) {
		}
		return date;
	}
	
	

	/**
	 * 将java.utile.Date类型转换成字符串，格�?yyyy-MM-dd"
	 * 
	 * @param date
	 *            日期时间
	 * @return String
	 */
	public static String dateToString(java.util.Date date) {
		if(date==null){
			return "";
		}
		return dateFormatter.format(date);
	}

	/**
	 * 将java.utile.Date类型转换成字符串，格�?yyyy-MM-dd"
	 * 
	 * @param date
	 *            日期时间
	 * @return String
	 */
	public static String dateToString(java.util.Date date,String formate) {
		SimpleDateFormat dateFormatters = new SimpleDateFormat(formate);
		return dateFormatters.format(date);
	}
	
	/**
	 * 将java.utile.Date类型转换成字符串，格�?yyyy-MM-dd HH:mm:ss"
	 * 
	 * @param date
	 *            日期时间
	 * @return String
	 */
	public static String timeToString(java.util.Date date) {
		if (date == null) {
			return null;
		}
		return timeFormatter.format(date);
	}

	/**
	 * 将java.utile.Date类型转换成指定格式的字符�?
	 * 
	 * @param date
	 *            日期时间
	 * @param pattern
	 *            格式字符�?
	 * @return String
	 */
	public static String timeToString(java.util.Date date, String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
	}

	/**
	 * 将字符串转换成java.utile.Date类型
	 * 
	 * @param sDate
	 *            字符串日�?
	 * @param pattern
	 *            格式字符�?
	 * @return Date
	 */
	public static java.util.Date stringToTime(String sDate, String pattern) {
		java.util.Date date = null;
		try {
			SimpleDateFormat dateFormatter = new SimpleDateFormat(pattern);
			date = dateFormatter.parse(sDate);
		} catch (ParseException ex) {
		}
		return date;
	}

	/**
	 * 将日期时间字符串转换成毫�?
	 * 
	 * @param timeStr
	 *            字符串时间，格式"yyyy-MM-dd HH:mm:ss"
	 * @return
	 */
	public static long stringToMillis(String timeStr) {
		return stringToTime(timeStr).getTime();
	}

	/**
	 * 功能：得到当前日期减去天数（有效期）后的以前某个日期
	 * 
	 * @param days
	 *            传入的天�?
	 * @return 以前某个日期 以字符方式返�?"YYYY-MM-DD"
	 */
	public static String getSubtractDaysDate(int days) {
		long everyDateMillSecond = 24 * 60 * 60 * 1000;
		long totalMillSecond = everyDateMillSecond * days;
		Date nowDate = new Date();
		long currentMillSecond = nowDate.getTime();
		long resultMillSecond = currentMillSecond - totalMillSecond;
		Date resultDate = new Date(resultMillSecond);
		String strDate = dateToString(resultDate);
		return strDate;
	}

	/**
	 * 功能：得到当前日期减去天数（有效期）后的以前某个日期时间
	 * 
	 * @param days
	 *            传入的天�?
	 * @return 以前某个日期 以字符方式返�?"YYYY-MM-DD HH:mm:ss"
	 */
	public static String getSubtractDaysTime(int days) {
		long everyDateMillSecond = 24 * 60 * 60 * 1000;
		long totalMillSecond = everyDateMillSecond * days;
		Date nowDate = new Date();
		long currentMillSecond = nowDate.getTime();
		long resultMillSecond = currentMillSecond - totalMillSecond;
		Date resultDate = new Date(resultMillSecond);
		String strDate = timeToString(resultDate);
		return strDate;
	}

	/**
	 * 计算两个日期之间相差多少�?lateDate-earlyDate)
	 * 
	 * @param laterDate
	 *            较晚时间
	 * @param earlyDate
	 *            较早时间
	 * @return 天数
	 */
	public static long daysBetweenDate(Date lateDate, Date earlyDate) {
		long everyDateMillSecond = 24 * 60 * 60 * 1000;
		long lateMillSecond = lateDate.getTime();
		long earlyMillSecond = earlyDate.getTime();
		long MillSeond = lateMillSecond - earlyMillSecond + everyDateMillSecond;
		long days = MillSeond / everyDateMillSecond;
		return days;
	}
	
	
	/**
	 * 计算第三个日期是否在两个日期之间(lateDate-earlyDate)
	 * 
	 * @param laterDate
	 *            较晚时间
	 * @param earlyDate
	 *            较早时间
	 * @param nowDate
	 *            比较的时�?
	 * @return 天数
	 */
	public static Boolean daysBetween(Date lateDate, Date earlyDate, Date nowDate) {
	     long l_lateDate = lateDate.getTime();    
	     long l_earlyDate = earlyDate.getTime();    
	     long l_nowDate = nowDate.getTime();
		if((l_nowDate>=l_earlyDate) &&(l_nowDate<=l_lateDate) ){
			return true;
		}
		else{
			return false;
		}
	}
	
	/**
	 * 计算两个日期之间相差的工作日�?lateDate-earlyDate)
	 * 
	 * @param laterDate
	 *            较晚时间
	 * @param earlyDate
	 *            较早时间
	 * @return 天数
	 */
	public static long daysBetweenWorkDate(Date lateDate, Date earlyDate) {
		long everyDateMillSecond = 24 * 60 * 60 * 1000;
		long lateMillSecond = lateDate.getTime();
		long earlyMillSecond = earlyDate.getTime();
		long MillSeond = lateMillSecond - earlyMillSecond + everyDateMillSecond;
		long days = MillSeond / everyDateMillSecond;
		return days;
	}
	
	/**
	 * 计算两个日期之间相差多少�?lateDate-earlyDate)
	 * 
	 * @param laterDate
	 *            较晚时间
	 * @param earlyDate
	 *            较早时间
	 * @return 天数
	 */
	public static long daysBetweenWeek(Date lateDate, Date earlyDate) {
		int maxWeek = 0;
		if(daysBetweenDate(lateDate, earlyDate)%7==0) maxWeek = (int) (daysBetweenDate(lateDate, earlyDate)/7);
		else maxWeek = (int) (daysBetweenDate(lateDate, earlyDate)/7+1);
		return maxWeek;
	}

	
	/**
	 * 得到传入日期�?�?,比如"2007-08-31 12:15:18" 那么返回的就�?007
	 * 
	 * @param date
	 * @return
	 */
	public static String getYearFromDate(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		String year = String.valueOf(calendar.get(Calendar.YEAR));
		return year;
	}

	/**
	 * 得到传入日期�?�?,比如"2007-08-31 12:15:18" 那么返回的就�?8
	 * 
	 * @param date
	 * @return
	 */
	public static String getMonthFromDate(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		String month = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		if (month.length() < 2) {
			month = "0" + month;
		}
		return month;
	}

	/**
	 * 得到传入日期�?�?,比如"2007-08-31 12:15:18" 那么返回的就�?1
	 * 
	 * @param date
	 * @return
	 */
	public static String getDayFromDate(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		String day = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		if (day.length() < 2) {
			day = "0" + day;
		}
		return day;
	}
	
	/**
	 * 得到传入日期的小�?
	 * @param date
	 * @return
	 */
	public static String getHourFromDate(Date date){
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		String hour = String.valueOf(calendar.get(Calendar.HOUR_OF_DAY));		
		return hour;
	}

	/**
	 * 得到传入日期�?年月�?,比如"2007-08-31 12:15:18" 那么返回的就�?0070831
	 * 
	 * @param date
	 * @return
	 */
	public static String getYearMonthDayFromDate(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		String year = String.valueOf(calendar.get(Calendar.YEAR));
		String month = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		if (month.length() < 2) {
			month = "0".concat(month);
		}
		String day = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		if (day.length() < 2) {
			day = "0".concat(day);
		}
		return year.concat(month).concat(day);
	}

	/**
	 * 得到传入日期�?年月",比如"2007-08-31 12:15:18" 那么返回的就�?00708
	 * 
	 * @param date
	 * @return
	 */
	public static String getYearMonthFromDate(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		String year = String.valueOf(calendar.get(Calendar.YEAR));
		String month = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		if (month.length() < 2) {
			month = "0".concat(month);
		}
		return year.concat(month);
	}

	/**
	 * 返回给定日期当月的最大天�?
	 * @param year
	 * @param month
	 * @return
	 */
	public static int getMaxDayNum(int year,int month) {
		int maxDay = 0;

		Calendar cal = Calendar.getInstance();
		
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONDAY, month);
		maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		return maxDay;
	}
	
	/**
	 * 返回给定日期当月的最大天�?
	 * @param year
	 * @param month
	 * @return
	 */
	public static int getMaxDayNum(Date date) {
		int maxDay = 0;

		Calendar cal = Calendar.getInstance();
		
		cal.setTime(date);
		maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		return maxDay;
	}

	/**
	 * 返回给定日期当月的工作天�?
	 * @param year
	 * @param month
	 * @return
	 */
	public static int getMaxWorkDayNum(Date date) {
		int maxDay = 0;

		Calendar cal = Calendar.getInstance();
		
		cal.setTime(date);
		maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		maxDay = maxDay - (maxDay*2)/7;
		int month = getMonth(date)+1;
		switch (month){
		case 1:
			maxDay=maxDay-1;
		break;
		case 4:
			maxDay=maxDay-1;
			break;
		case 5:
			maxDay=maxDay-2;
			break;
		case 8:
			maxDay=maxDay-1;
			break;
		case 10:
			maxDay=maxDay-3;
			break;
		}
		//----------------------------------------------------------------------
		//没有计算春节和周�?
		//----------------------------------------------------------------------
		
		return maxDay;
	}
	
	/**
	 * 返回给定日期当月的周�?
	 * @param year
	 * @param month
	 * @return
	 */
	public static int getMaxWeekNum(Date date) {
		int maxWeek = 0;
		if(getMaxDayNum(date)%7==0) maxWeek = getMaxDayNum(date)/7;
		else maxWeek = getMaxDayNum(date)/7+1;
		return maxWeek;
	}
	
	
	
	//格式化报表日期的方法
	
	/**
	 * 格式化日报表日期
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDayReportDate(java.util.Date date){
		String str="";
		str=TimeHelper.timeToString(date, "yyyy-MM-dd");
		return str;
	}
	
	/**
	 * 格式化月报表日期
	 * 
	 * @param date
	 * @return
	 */
	public static String formatMonthReportDate(java.util.Date date){
		String str="";
		str=TimeHelper.timeToString(date, "yyyy-MM");
		return str;
	}
	
	/**
	 * 格式化月报表日期（增减表�?
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static String formatMonthReportDate(java.util.Date date1,java.util.Date date2){
		String str="";
		str=formatMonthReportDate(date1)+":"+formatMonthReportDate(date2);
		return str;
	}
	
	/**
	 * 格式化季度报表日�?
	 * 
	 * @param date
	 * @param quarterType
	 * @return
	 */
	public static String formatQuarterReportDate(java.util.Date date,int quarterType){
		String str="";
		str=TimeHelper.timeToString(date, "yyyy")+"-"+quarterType;
		return str;
	}
	
	/**
	 * 格式化季度报表日期（增减表）
	 * 
	 * @param date1
	 * @param quarterType1
	 * @param date2
	 * @param quarterType2
	 * @return
	 */
	public static String formatQuarterReportDate(java.util.Date date1,int quarterType1,java.util.Date date2,int quarterType2){
		String str="";
		str=formatQuarterReportDate(date1,quarterType1)+":"+formatQuarterReportDate(date2,quarterType2);
		return str;
	}
	
	/**
	 * 格式化年报表日期
	 * 
	 * @param date
	 * @param yearType
	 * @return
	 */
	public static String formatYearReportDate(java.util.Date date,int yearType){
		String str="";
		if(yearType==1)
			str=TimeHelper.timeToString(date, "yyyy")+"-F";//全年
		else if(yearType==2)
			str=TimeHelper.timeToString(date, "yyyy")+"-U";//上半�?
		if(yearType==3)
			str=TimeHelper.timeToString(date, "yyyy")+"-D";//下半�?
		return str;
	}
	
	/**
	 * 格式化年报表日期（增减表�?
	 * 
	 * @param date1
	 * @param yearType1
	 * @param date2
	 * @param yearType2
	 * @return
	 */
	public static String formatYearReportDate(java.util.Date date1,int yearType1,java.util.Date date2,int yearType2){
		String str="";
		str=formatYearReportDate(date1,yearType1)+":"+formatYearReportDate(date2,yearType2);
		return str;
	}
	
	/**
	 * 格式化非正式报表日期
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static String formatNoformReportDate(java.util.Date date1,java.util.Date date2){
		String str="";
		str=TimeHelper.timeToString(date1, "yyyy-MM")+"~"+TimeHelper.timeToString(date2, "yyyy-MM");
		return str;
	}
	
	/**
	 * 格式化非正式报表日期（增减表�?
	 * 
	 * @param date11
	 * @param date12
	 * @param date21
	 * @param date22
	 * @return
	 */
	public static String formatNoformReportDate(java.util.Date date11,java.util.Date date12,java.util.Date date21,java.util.Date date22){
		String str="";
		str=formatNoformReportDate(date11,date12)+":"+formatNoformReportDate(date21,date22);
		return str;
	}
	
	/**
	 * 格式化院内用表报表日�?
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static String formatInnerReportDate(java.util.Date date1,java.util.Date date2){
		String str="";
		str=TimeHelper.timeToString(date1, "yyyy-MM-dd")+"~"+TimeHelper.timeToString(date2, "yyyy-MM-dd");
		return str;
	}
	
	/**
	 * 格式化台帐报表日�?
	 * 
	 * @param date
	 * @return
	 */
	public static String formatAccountReportDate(java.util.Date date){
		String str="";
		str=TimeHelper.timeToString(date, "yyyy");
		return str;
	}

	public static void main(String[] args) {
		// String rr="2007-9-7";
		// Date date=TimeHelper.stringToTime(rr);
		Date date = new Date();
		String ss = TimeHelper.getYearMonthFromDate(date);
		System.out.println(ss);
	}

    /**
     * 功能：得到上个月月份月初 格式为：xxxx-yy-zz (eg: 2007-12-01)<br> 
     * @return String
     * @author pure
     */
    public static String thisMonth(Calendar localTime) {
        String strY = null;
        int x ;//�?
        int y;//�?
        x = localTime.get(Calendar.YEAR);
        y = localTime.get(Calendar.MONTH);
        strY = y >= 10 ? String.valueOf(y) : ("0" + y);
        return x + "-" + strY + "-01";
    }


	   /**
     * 功能：得到上个月月份月底 格式为：xxxx-yy-zz (eg: 2007-12-31)<br> 
     * @return String
     * @author pure
     */
    public static String thisMonthEnd(Calendar localTime) {
        String strY = null;
        String strZ = null;
        boolean leap = false;
        int x ;//�?
        int y;//�?
        x = localTime.get(Calendar.YEAR);
        y = localTime.get(Calendar.MONTH) ;
        if (y == 1 || y == 3 || y == 5 || y == 7 || y == 8 || y == 10 || y == 12) {
            strZ = "31";
        }
        if (y == 4 || y == 6 || y == 9 || y == 11) {
            strZ = "30";
        }
        if (y == 2) {
            leap = leapYear(x);
            if (leap) {
                strZ = "29";
            }
            else {
                strZ = "28";
            }
        }
        strY = y >= 10 ? String.valueOf(y) : ("0" + y);
        return x + "-" + strY + "-" + strZ;
    }
    /**
     * 功能：判断输入年份是否为闰年<br>
     * 
     * @param year
     * @return 是：true  否：false
     * @author pure
     */
    public static boolean leapYear(int year) {
        boolean leap;
        if (year % 4 == 0) {
            if (year % 100 == 0) {
                if (year % 400 == 0) leap = true;
                else leap = false;
            }
            else leap = true;
        }
        else leap = false;
        return leap;
    }
    
   public static String parseDateToString(Date date){
	   if(AssertUtil.isNull(date)){
		   return null;
	   }
	   String result = timeFormatter.format(date);
	   return result;
   }
}
