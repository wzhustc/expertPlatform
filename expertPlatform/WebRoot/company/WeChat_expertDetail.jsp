<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<div data-role="page" id="expertdetail">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header2">
    		<c:choose>
                <c:when test="${origin == 'search'}">
                	<a href="WeChat_switchPage.action?page=companyPageTwo" rel="external" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext">返回</a>
                </c:when>
                <c:when test="${origin == 'apply'}">
                	<a href="#" data-rel="back" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext">返回</a>
                </c:when>
                <c:otherwise>
            	</c:otherwise>
            </c:choose>	
    		<p>专家详情</p>
            <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-heart ui-btn-icon-notext">收藏</a>
  		</div>
        <div data-role="main" class="ui-content detailcontent">
        	<ul data-role="listview" class="expert">
      			<li>
                    <img src="http://img.591zjh.com/18601056013/144306224052_cut.jpg" alt="加载失败">
        			<h2 id="expertname">${expert.realname}</h2>
        			<p id="expertfield">${expert.field}</p>
                    <p id="expertlocation">所在地区：${expert.location}</p>
                    <p id="experthot">星级指数：</p>
            	</li>
                <li id="expertpro1">
                	<div>已参加项目的数量<span class="ui-li-count">7</span></div>
                </li>
                <li id="expertpro2">
                	<a href="#">查看评论</a>
                </li>
                <li>
                	<div class="celltitle">获得荣誉：</div>
                    <p id="expertglory">${expert.glory}</p>
                </li>
                <li>
                	<div class="celltitle">荣誉链接：</div>
                    <p id="expertgloryurl">${expert.gloryurl}</p>
                </li>
                <li>
                	<div class="celltitle">个人简介：</div>
                    <p id="expertadd">${expert.addition}</p>
                </li>
                <li>
                    <p id="experttel">联系方式：<a href="tel:18896337822">${expert.mobile}</a></p>
                </li>
                <li id="relate">
                    <a href="#" class="ui-btn ui-shadow">发消息</a>
                </li>
                <c:choose>
                	<c:when test="${origin == 'apply'}">
                		<li id="revoke">
                    		<a href="WeChat_agreeApply.action?expId=${expert.id}" rel="external" class="ui-btn ui-shadow">同意申请</a>
                		</li>
                    </c:when>
                    <c:otherwise>
            		</c:otherwise>
            	</c:choose>   
    		</ul>
        </div>
    </div>
</body>
</html>