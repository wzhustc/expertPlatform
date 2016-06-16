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
	<div data-role="page" class="project">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header3">
        	<a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext" data-rel="back">返回</a>
    		<p>专家申请详情</p>
  		</div>
        <div data-role="main" class="ui-content detailcontent">
        	<ul data-role="listview">
        		<c:forEach items="${expList}" var="expert" varStatus="varStatus">
                <li data-icon="bullets">
                	<a href="WeChat_viewExpertDetail.action?expId=${varStatus.current.id}&origin=apply" class="cell">
                    	<img src="http://img.591zjh.com/18601056013/144306224052_cut.jpg" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">${expert.realname}</h2>
        				<p>专业领域：${expert.field}</p>
                        <p>个人简介：${expert.addition}</p>
                	</a>
                    <a href="#myPopup7" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                    <div data-role="popup" id="myPopup7" data-overlay-theme="b" data-dismissible="false">
                    	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-left">关闭</a>
      					<ul data-role="listview" data-inset="true" style="min-width:250px">
        					<li data-role="list-divider"><b>选项</b></li>    
                            <li class="redpop"><a href="WeChat_agreeApply.action?expId=${varStatus.current.id}" rel="external">同意申请</a></li>
    						<li><a href="#">联系专家</a></li>
    					</ul>
    				</div>
                </li>
    		</ul>
    		</c:forEach>
        </div>
    </div>
</body>
</html>