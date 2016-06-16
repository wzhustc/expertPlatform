<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function register(){
	window.location.href="initRegister.action"; 
	}
	</script>
  </head>
  
 <body>
 <form action="login.action" method="post">
 	email:<input type="text" name="email"><br>
 	password:<input type="password" name="password"><br>
 	<input type="submit" value="login">
 	<input type="button" value="register" onclick="register()"> 
 </form>

</body>
</html>
