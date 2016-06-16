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
    <link rel="stylesheet" href="css/mystyle.css">
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/jquery.mobile-1.4.5.min.js"></script>
    <script>
		$(document).on("pagecreate","#pageone",function(){
  			$("#searchMore").on("tap",function(){
    			$(this).hide();
				$("#hiddendiv").show();
  			});                       
		});
		$(document).on("pagebeforeshow","#companyinformation",function(){
  			$("#saveinformation").hide();
			$(".inputbtn").attr("readonly","readonly");
			$(".inputbtn").css("color","#9E9E9E");                     
		});
		$(document).on("pageshow","#companyinformation",function(){
			$("#edit").on("tap",function(){
    			$("#saveinformation").show();
				$(".inputbtn").removeAttr("readonly");
				$(".inputbtn").css("color","#000");
  			});                       
		});
	</script>
    <title>专家汇</title>
</head>

<body>
<div data-role="page" id="pagefour">
        <div data-role="main" class="ui-content">
        	<ul data-role="listview" id="personal">
        		<c:forEach items="${comList}" var="company" varStatus="varStatus">
            	<li>
                	<img src="http://china.trade2cn.com/upload/2003/2277689/weidalogo.gif" alt="加载失败">
        			<h2 id="companynamebar">${company.companyname}</h2>
                </li>
                <li>
                	<a href="WeChat_viewCompanyDetail.action?comId=${varStatus.current.id}" rel="external" class="ui-btn ui-icon-bars ui-btn-icon-left">企业信息</a>
                </li>
                <li>
                	<a href="#" class="ui-btn ui-icon-heart ui-btn-icon-left">收藏</a>
                </li>
                <li>
                	<a href="#" class="ui-btn ui-icon-mail ui-btn-icon-left">反馈意见</a>
                </li>
                <li>
                	<a href="#" class="ui-btn ui-icon-info ui-btn-icon-left">关于</a>
                </li>
                <div id="logoutbtn">
                    <a href="WeChat_logout.action" rel="external" class="ui-btn ui-shadow">退出登录</a>
                </div>
                </c:forEach>
        	</ul>
        </div>
  		<div data-role="footer" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
    		<div data-role="navbar">
      			<ul>
        			<li><a href="WeChat_switchPage.action?page=companyPageOne" data-icon="grid" data-transition="none">项目</a></li>
        			<li><a href="WeChat_switchPage.action?page=companyPageTwo" data-icon="search" data-transition="none">搜索</a></li>
                    <li><a href="WeChat_switchPage.action?page=companyPageThree" data-icon="comment" data-transition="none">消息</a></li>
        			<li><a href="#" class="ui-btn-active ui-state-persist" data-icon="user">个人</a></li>
      			</ul>
    		</div>
  		</div>
	</div>
</body>
</html>