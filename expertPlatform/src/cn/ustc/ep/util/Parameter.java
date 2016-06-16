package cn.ustc.ep.util;

import java.util.HashMap;
import java.util.Map;

public class Parameter {
	//message需要的常量
	public static final int UNREAD = 0 ;
	public static final int ISREAD = 1 ;
	//result结果常量
	public static final String SUCCESS = "success" ;
	public static final String FAIL = "fail" ;
	//project需要的常量
	public static final String UNCHECK="0";
	public static final String UNCONFIRM="0";
	public static final String PUBLISH="1";
	public static final String FINISH="2";
	public static final String RUNNING="0";
	public static final String CANCEL="3";
	public static final int NOEXPERT=-1;
	public static final String PROCESS="4";
	public static final String RETURN_SUCCESS="1";
	public static final String RETURN_FAIL="0";
	//apply需要的常量
	public static final String NOT_AGREE="false";
	public static final String AGREE="true";
	public static final String DIRECTION_INVITE="invite";
	public static final String DIRECTION_APPLY="apply";
	
	public static Map<String,String> stateMap = null;
	static{
		stateMap = new HashMap<String,String>();
		stateMap.put("1","published");
		stateMap.put("2","finished");
		stateMap.put("3","canceled");
		stateMap.put("0","going");
	} 
	
	
	
	
}
