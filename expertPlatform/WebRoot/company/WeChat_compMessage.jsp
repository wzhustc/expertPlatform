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
<div data-role="page" id="pagethree">
  		<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header1">
    		<p>相关专家推荐</p>
  		</div>
  		<div data-role="main" class="ui-content">
    		<ul data-role="listview">
      			<li>
                	<a href="#expertdetail" class="cell">
                    	<img src="http://img.591zjh.com/18601056013/144306224052_cut.jpg" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">邓博</h2>
        				<p>专业领域：管理技能</p>
                        <p>个人简介：幽默风趣，热爱生活，激情互动</p>
                	</a>
                    <a href="#expertdetail">查看详情</a>
                </li>
                <li>
                	<a href="#" class="cell">
                    	<img src="http://img.591zjh.com/13811106818/144340913146_cut.png" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">代瑞红</h2>
        				<p>专业领域：天使投资</p>
                        <p>个人简介：理性，知性，天使投资人的热情</p>
                	</a>
                    <a href="#">查看详情</a>
                </li>
                <li>
                	<a href="#" class="cell">
                    	<img src="http://img.591zjh.com/13923484952/144323491009_cut.png" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">靖爽</h2>
        				<p>专业领域：研发管理</p>
                        <p>个人简介：研发管理资深专家</p>
                	</a>
                    <a href="#">查看详情</a>
                </li>
                <li>
                	<a href="#" class="cell">
                    	<img src="http://img.591zjh.com/13331011481/144392466476_cut.bmp" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">唐彬</h2>
        				<p>专业领域：互联网金融</p>
                        <p>个人简介：互联网金融千人会轮值主席</p>
                	</a>
                    <a href="#">查看详情</a>
                </li>
                <li>
                	<a href="#" class="cell">
                    	<img src="http://img.591zjh.com/18010472829/144307115788_cut.png" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">覃浪洲</h2>
        				<p>专业领域：人力资源</p>
                        <p>个人简介：幽默，感染力强，实战落地</p>
                	</a>
                    <a href="#">查看详情</a>
                </li>
                <p id="searchMore" style="text-align:center; color:#3388CC">点击查看更多...</p>
        	</ul>
            <ul data-role="listview" id="hiddendiv" hidden="true" class="ui-content" style="margin-top:16px">
            	<li>
                	<a href="#" class="cell">
                    	<img src="http://img.591zjh.com/18600015426/144307457524_cut.gif" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">肖鹏</h2>
        				<p>专业领域：IT规划与管理</p>
                        <p>个人简介：务实肯干，经验丰富</p>
                	</a>
                    <a href="#">查看详情</a>
                </li>
                <li>
                	<a href="#" class="cell">
                    	<img src="http://img.591zjh.com/13911094990/144297335222_cut.jpg" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">雷鸣</h2>
        				<p>专业领域：计算机软件</p>
                        <p>个人简介：风趣 语速快 有点南方口音</p>
                	</a>
                    <a href="#">查看详情</a>
                </li>
                <li>
                	<a href="#" class="cell">
                    	<img src="http://img.591zjh.com/18618123620/144496666415_cut.bmp" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">李正海</h2>
        				<p>专业领域：互联网、通信</p>
                        <p>个人简介：一线大数据联盟主要创始人，高级工程师，高级程序员</p>
                	</a>
                    <a href="#">查看详情</a>
                </li>
                <p style="text-align:center; color:#3388CC"><a href="#" style="text-decoration:none">点击查看更多...</a></p>
            </ul>
  		</div>
  		<div data-role="footer" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
    		<div data-role="navbar">
      			<ul>
        			<li><a href="WeChat_switchPage.action?page=companyPageOne" data-icon="grid" data-transition="none">项目</a></li>
        			<li><a href="WeChat_switchPage.action?page=companyPageTwo" data-icon="search" data-transition="none">搜索</a></li>
                    <li><a href="#" class="ui-btn-active ui-state-persist" data-icon="comment">消息</a></li>
        			<li><a href="WeChat_switchPage.action?page=companyPageFour" data-icon="user" data-transition="none">个人</a></li>
      			</ul>
    		</div>
  		</div>
	</div>
</body>
</html>