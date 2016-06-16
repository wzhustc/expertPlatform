<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
                      + request.getServerPort() + path + "/";
%>  
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="css/weui.min.css"/>
	<link rel="stylesheet" href="css/mystyle.css">
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/jquery.mobile-1.4.5.min.js"></script> 
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/myvalidate.js"></script>
    <title>用户注册</title>
    <style>
		.ui-page-theme-a {
			background-color:#CFF; /*{a-page-background-color}*/;
		}
		#a {
			background-color:#FFC;
			border-color:#66F;
			color:#000;
			text-shadow: 0 1px 0 #f3f3f3;
			height:150px;
			border-radius:3em;
			margin-bottom:50px;
			margin-top:5px;
		}
		#b {
			background-color:#CFC;
			border-color:#66F;
			color:#000;
			text-shadow: 0 1px 0 #f3f3f3;
			height:150px;
			border-radius:3em;
			margin-bottom:20px;
		}
		.la {
			width:4.3em;
		}
		.heigh {
			height:30px;
		}
		.heigh2 {
			height:40px;
		}
		.part {
			margin-top:10px;
		}
		.ui-body-c {
			margin-top:10px;
			margin-left:10px;
			margin-right:10px;
			background-color:white;
		}
		.regbtn .ui-btn {
			margin-left:30px;
			margin-right:30px;
			background-color:#3388CC;
			color:#FFF;
		}
		.maincontent {
			margin-left:10px;
			margin-right:10px;
		}
		#head1, #head2 {
			background-color:#3388CC;
			color:#FFF;
			text-align:center;
			height:40px;
		}
		#head1 p,#head2 p {
			margin-top:9px;
		}
		#head1 .ui-btn-icon-left:after, #head1 .ui-btn-icon-right:after, 
		#head1 .ui-btn-icon-top:after, #head1 .ui-btn-icon-bottom:after, 
		#head1 .ui-btn-icon-notext:after,#head2 .ui-btn-icon-left:after, 
		#head2 .ui-btn-icon-right:after, #head2 .ui-btn-icon-top:after, 
		#head2 .ui-btn-icon-bottom:after, #head2 .ui-btn-icon-notext:after {
			background-color:#00CC66;
		}
		.validateInfo {
			padding-left:4.8em;
			color:#F30;
		}
    </style>
</head>

<body>
	<div data-role="page" id="pageRegister">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="head1">
        	<a href="WeChat_switchPage.action?page=indexPage" rel="external" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext">返回</a>
    		<p>注册</p>
  		</div>
  		<div data-role="main" class="ui-content ui-body-c">
    		<a href="#pageTwo" class="ui-btn ui-corner-all ui-shadow" data-transition="flip" id="a">
            	<h2 style="margin-top:20px">我是专家</h2>
                <p style="white-space:pre-wrap; margin-top:35px">专家用户可以提交专业领域，寻找企业的短期项目</p>
            </a>
            <a href="#pageThree" class="ui-btn ui-corner-all ui-shadow" data-transition="flip" id="b">
            	<h2 style="margin-top:20px">我是企业</h2>
                <p style="white-space:pre-wrap; margin-top:35px">企业用户能够发布项目，找到具有行业资深经验的专家</p>
            </a>
  		</div>
	</div> 

	<div data-role="page" id="pageTwo">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="head1">
        	<a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext" data-rel="back">返回</a>
    		<p>专家用户注册</p>
  		</div>
  		<div data-role="main" class="maincontent ui-body-c">
        	<form id="expertRegisterForm" target="_top" method="post" action="WeChat_register.action?role=expert">
        		<div class="weui_cells weui_cells_form part">
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="userName" class="weui_label la"><b>用户名</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="userName" id="userName" class="weui_input" type="text" placeholder="请输入用户名（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>	
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="password" class="weui_label la"><b>登录密码</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="password" id="password" class="weui_input" type="password" placeholder="请输入密码（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
                    <div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="passwordAgain" class="weui_label la"><b>密码确认</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="passwordAgain" id="passwordAgain" class="weui_input" type="password" placeholder="再次输入密码（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
                    <div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="email" class="weui_label la"><b>邮箱</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="email" id="email" class="weui_input" type="email" placeholder="请输入常用邮箱（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
        		</div>
                <div class="weui_cells weui_cells_form part">
                	<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="idNumber" class="weui_label la"><b>身份证号</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="idNumber" id="idNumber" class="weui_input" type="text"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="realName" class="weui_label la"><b>真实姓名</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="realName" id="realName" class="weui_input" type="text"/>
                		</div>
            		</div>
            		<div class="weui_cell heigh2">
                		<div class="weui_cell_hd">
                        	<label class="weui_label la"><b>性别</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<fieldset>
       							<select name="gender" id="gender" data-native-menu="false">
        							<option value="男">男</option>
         							<option value="女">女</option>
        						</select>
      						</fieldset>
               			</div>
            		</div>
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="mobile" class="weui_label la"><b>手机</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="mobile" class="weui_input" type="tel" id="mobile"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
            		<div class="weui_cell heigh2">
                		<div class="weui_cell_hd"><b>所在地区</b></div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<fieldset>
       							<select name="location" id="location" data-native-menu="false">
        							<option value="北京">北京</option>
         							<option value="上海">上海</option>
         							<option value="广州">广州</option>
         							<option value="深圳">深圳</option>
         							<option value="杭州">杭州</option>
         							<option value="南京">南京</option>
         							<option value="厦门">厦门</option>
         							<option value="苏州">苏州</option>
        						</select>
      						</fieldset>
               			</div>
            		</div>			
            		<div class="weui_cell heigh2">
                		<div class="weui_cell_hd"><b>专长领域</b></div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<fieldset>
       							<select name="domain" id="domain" data-native-menu="false">
        							<option value="互联网">互联网</option>
         							<option value="医疗">医疗</option>
                            		<option value="建筑">建筑</option>
                            		<option value="销售">销售</option>
                            		<option value="企业管理">企业管理</option>
                            		<option value="餐饮">餐饮</option>
        						</select>
      						</fieldset>
               			</div>
            		</div>
            		<div class="weui_cell">
                		<div class="weui_cell_hd">
                        	<label for="glory" class="weui_label la"><b>获得荣誉</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<textarea name="glory" id="glory"></textarea>
                		</div>
            		</div>
            		<div class="weui_cell">
                		<div class="weui_cell_hd">
                        	<label for="gloryUrL" class="weui_label la"><b>荣誉链接</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<textarea name="gloryUrL" id="gloryUrL"></textarea>
                		</div>
            		</div>
                   <div class="weui_cell">
                		<div class="weui_cell_hd">
                        	<label for="personalInfo" class="weui_label la"><b>个人简介</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<textarea name="personalInfo" id="personalInfo"></textarea>
                		</div>
            		</div>
                    <div class="weui_cell">
                		<div class="weui_cell_bd weui_cell_primary">
                    		<div class="weui_uploader">
                        		<div class="weui_uploader_hd weui_cell">
                           			<div class="weui_cell_bd weui_cell_primary"><b>头像上传</b></div>
                            		<div class="weui_uploader_bd">
                            			<div class="weui_uploader_input_wrp">
                                			<input class="weui_uploader_input" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" multiple />
                            			</div>
                        			</div>
                        		</div>
                    		</div>
                		</div>
            		</div>	
        		</div>
                <div class="regbtn"><input type="submit" value="确认注册"></div>
        	</form>
    	</div>
	</div>
    
    <div data-role="page" id="pageThree">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="head2">
        	<a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext" data-rel="back">返回</a>
    		<p>企业用户注册</p>
  		</div>
  		<div data-role="main" class="maincontent ui-body-c">
        	<form id="companyRegisterForm" target="_top" method="post" action="WeChat_register.action?role=company">
        		<div class="weui_cells weui_cells_form part">
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="userName" class="weui_label la"><b>用户名</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="userName" id="userName" class="weui_input" type="text" placeholder="请输入公司名称（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>	
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="password" class="weui_label la"><b>登录密码</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="password" id="password" class="weui_input" type="password" placeholder="请输入密码（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
                    <div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="passwordAgain" class="weui_label la"><b>密码确认</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="passwordAgain" id="passwordAgain" class="weui_input" type="password" placeholder="再次输入密码（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
                    <div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="email" class="weui_label la"><b>企业邮箱</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="email" class="weui_input" type="email" id="email" placeholder="请输入企业邮箱（必填）"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
        		</div>
                <div class="weui_cells weui_cells_form part">
                	<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="companyName" class="weui_label la"><b>企业名称</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="companyName" id="companyName" class="weui_input" type="text"/>
                		</div>
            		</div>	
                	<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="businessNum" class="weui_label la"><b>工商号</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="businessNum" id="businessNum" class="weui_input" type="text"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label class="weui_label la"><b>真实姓名</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="realName" class="weui_input" type="text"/>
                		</div>
            		</div>	
            		<div class="weui_cell heigh">
                		<div class="weui_cell_hd">
                        	<label for="mobile" class="weui_label la"><b>联系方式</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<input name="mobile" id="mobile" class="weui_input" type="text"/>
                		</div>
            		</div>
            		<div class="validateInfo"></div>
                    <div class="weui_cell heigh2">
                		<div class="weui_cell_hd"><b>所在地区</b></div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<fieldset>
       							<select name="location" id="location" data-native-menu="false">
        							<option value="北京">北京</option>
         							<option value="上海">上海</option>
         							<option value="广州">广州</option>
         							<option value="深圳">深圳</option>
         							<option value="杭州">杭州</option>
         							<option value="南京">南京</option>
         							<option value="厦门">厦门</option>
         							<option value="苏州">苏州</option>
        						</select>
      						</fieldset>
               			</div>
            		</div>	
            		<div class="weui_cell heigh2">
                		<div class="weui_cell_hd"><b>所属行业</b></div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<fieldset>
       							<select name="domain" id="domain" data-native-menu="false">
        							<option value="互联网">互联网</option>
         							<option value="医疗">医疗</option>
                            		<option value="建筑">建筑</option>
                            		<option value="销售">销售</option>
                            		<option value="企业管理">企业管理</option>
                            		<option value="餐饮">餐饮</option>
        						</select>
      						</fieldset>
               			</div>
            		</div>
                    <div class="weui_cell">
                		<div class="weui_cell_hd">
                        	<label for="companyInfo" class="weui_label la"><b>企业简介</b></label>
                        </div>
                		<div class="weui_cell_bd weui_cell_primary">
                    		<textarea name="companyInfo" id="companyInfo"></textarea>
                		</div>
            		</div>
                    <div class="weui_cell">
                		<div class="weui_cell_bd weui_cell_primary">
                    		<div class="weui_uploader">
                        		<div class="weui_uploader_hd weui_cell">
                           			<div class="weui_cell_bd weui_cell_primary"><b>企业logo</b></div>
                            		<div class="weui_uploader_bd">
                            			<div class="weui_uploader_input_wrp">
                                			<input class="weui_uploader_input" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" multiple />
                            			</div>
                        			</div>
                        		</div>
                    		</div>
                		</div>
            		</div>	
        		</div>
                <div class="regbtn"><input type="submit" value="确认注册"></div>
        	</form>
    	</div>
	</div> 
</body>
</html>
