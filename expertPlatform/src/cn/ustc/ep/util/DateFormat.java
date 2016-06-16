package cn.ustc.ep.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	public static String Date2String(Date d) throws ParseException {
		
		// 给定模式
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// public final String format(Date date)
		String s = sdf.format(d);
		return s ;
	}
	public static Date String2Date(String d) throws ParseException{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date date = sdf.parse(d);
		return date ;
	}
}