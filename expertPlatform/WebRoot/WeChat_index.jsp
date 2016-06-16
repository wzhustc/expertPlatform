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
<!--[if gt IE 8]><!--> <html class="no-js" id="login"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="css/weui.min.css">
	<link rel="stylesheet" href="css/mystyle.css">
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/jquery.mobile-1.4.5.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
    <script src="js/myvalidate.js"></script>
    <title>专家汇用户登录</title>
</head>
<body>
	<div data-role="page" id="pageLogin">
		<div data-role="content" class="ui-content ui-body-c">
			<div style="color:#F30; text-align:center">
				<c:choose>
                	<c:when test="${not empty msg}">
                    	<span>${msg}</span>
                    </c:when>
                    <c:otherwise>
            		</c:otherwise>
            	</c:choose>
			</div>
			<form id="loginForm" target="_top" action="WeChat_login.action" method="post">	
      			<div class="ui-field-contain">
        			<label for="name"><b>Email：</b></label>
        			<input type="text" name="name" id="name" placeholder="请输入Email">
        			<div class="validateInfo"></div>
        			<label for="password" style="margin-top:5px"><b>密码：</b></label>
        			<input type="password" name="password" id="password" placeholder="请输入登录密码">
        			<div class="validateInfo"></div>
      				<div>
                	<fieldset data-role="fieldcontain">
       					<select name="role" id="role" data-native-menu="false">
        					<option value="expert">专家用户</option>
         					<option value="company">企业用户</option>
        				</select>
      				</fieldset>
                    </div>
                    <div>
                    <div class="ui-grid-a" class="ui-field-contain" style="margin-bottom:18px">
                        <div class="ui-block-a">
                        	<fieldset data-role="controlgroup">
          						<label for="rememberpass">记住密码</label>
          						<input type="checkbox" name="rememberpass" id="rememberpass" value="remember">
      						</fieldset>
      					</div>
    					<div class="ui-block-b">
                        	<fieldset data-role="controlgroup">
          						<label for="autoLogin">自动登录</label>
          						<input type="checkbox" name="favcolor" id="autoLogin" value="green"> 
      						</fieldset>
     					</div>
    				</div>
                    </div>
      				<div class="logbtn"><input type="submit" value="登录"></div>
                </div> 
    		</form>
            <a id="regbutton" href="WeChat_initRegister.action" rel="external" class="ui-btn ui-corner-all ui-shadow">新用户？立即注册</a>
		</div>
        <div data-role="footer" style="margin-top:1px; background-color:#F1F1F1">
    		<h1><a href="#" rel="external" style="text-decoration:none;  color:#000; font-size:14px">登录遇到问题？</a></h1>
  		</div>
	</div>
</body>
</html>

