<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		$(document).on("pagebeforeshow","#expertinformation",function(){
  			$("#saveinformation").hide();
			$(".fixedbtn").attr("readonly","readonly");
			$(".inputbtn").attr("readonly","readonly");
			$(".inputselbtn").attr("disabled","disabled");
			$(".inputbtn").css("color","#9E9E9E");
			$(".fixedbtn").css("color","#9E9E9E");
			$(".inputselbtn").css("color","#9E9E9E");                     
		});
		$(document).on("pageshow","#expertinformation",function(){
			$("#edit").on("tap",function(){
    			$("#saveinformation").show();
				$(".inputbtn").removeAttr("readonly");
				$(".inputselbtn").removeAttr("disabled");
				$(".inputbtn").css("color","#000");
				$(".inputselbtn").css("color","#000");
  			});                       
		});
	</script>
    <title>专家汇</title>
</head>

<body>
<div data-role="page" id="pageone">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" style="text-align:center; background-color:#F9F9F9">
            <div>
        		<form class="ui-filterable searchbar">
      				<input id="myFilter" data-type="search" placeholder="搜索：项目名称">
    			</form>	
    		</div>
  		</div>
  		<div data-role="main">
            <div data-role="collapsibleset" data-filter="true" data-input="#myFilter">
            	<div data-role="collapsible" data-collapsed-icon="carat-r" data-expanded-icon="carat-d" data-collapsed="false">
    				<h4>进行中项目</h4>
    				<ul data-role="listview" class="prolist executed" data-filter="true" data-input="#myFilter">
      					<c:forEach items="${proList0}" var="project" varStatus="varStatus">
      					<li data-icon="bullets" data-filtertext="${varStatus.current.name}">
                    		<a href="WeChat_viewProjectDetail.action?proId=${varStatus.current.id}&circle=going&role=expert&origin=project" class="cell2" style="background-color:white">
                        		<h2 style="margin-top:0px; color:#3388CC">${project.name}</h2>
                            	<p>项目内容：${project.content}</p>
                            	<p>项目预算：￥${project.budget}</p>
                            	<p>发布日期：<fmt:formatDate value="${project.publicdate}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                        	</a>
                        	<a href="#myPopup1" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                            <div data-role="popup" id="myPopup1" data-overlay-theme="b" data-dismissible="false">
                            	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-left">关闭</a>
      							<ul data-role="listview" data-inset="true" style="min-width:250px">
        							<li data-role="list-divider"><b>选项</b></li>
        							<li><a href="#relatecompany">联系企业</a></li>
    							</ul>
    						</div>
                    	</li>
                    	</c:forEach>
                    </ul>
    			</div>
                <div data-role="collapsible" data-collapsed-icon="carat-r" data-expanded-icon="carat-d">
    				<h4>已申请项目</h4>
    				<ul data-role="listview" class="prolist released" data-filter="true" data-input="#myFilter">
      					<c:forEach items="${proList1}" var="project" varStatus="varStatus">
      					<li data-icon="bullets" data-filtertext="${varStatus.current.name}">
                    		<a href="WeChat_viewProjectDetail.action?proId=${varStatus.current.id}&circle=published&role=expert&origin=project" class="cell2" style="background-color:white">
                        		<h2 style="margin-top:0px; color:#3388CC">${project.name}</h2>
                            	<p>项目内容：${project.content}</p>
                            	<p>项目预算：￥${project.budget}</p>
                            	<p>发布日期：<fmt:formatDate value="${project.publicdate}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                        	</a>
                        	<a href="#myPopup2" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                            <div data-role="popup" id="myPopup2" data-overlay-theme="b" data-dismissible="false">
                            	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-left">关闭</a>
      							<ul data-role="listview" data-inset="true" style="min-width:250px">
        							<li data-role="list-divider"><b>选项</b></li>
        							<li><a href="#relatecompany">联系企业</a></li>
        							<li class="redpop"><a href="WeChat_cancelApply.action?proId=${varStatus.current.id}" rel="external">取消申请</a></li>
    							</ul>
    						</div>
                    	</li>
                    	</c:forEach>
                	</ul>
    			</div>
                <div data-role="collapsible" data-collapsed-icon="carat-r" data-expanded-icon="carat-d">
    				<h4>已结束项目</h4>
    				<ul data-role="listview" class="prolist gone" data-filter="true" data-input="#myFilter">
      					<c:forEach items="${proList2}" var="project" varStatus="varStatus">
      					<li data-icon="bullets" data-filtertext="${varStatus.current.name}">
                    		<a href="WeChat_viewProjectDetail.action?proId=${varStatus.current.id}&circle=ended&role=expert&origin=project" class="cell2" style="background-color:white">
                        		<h2 style="margin-top:0px; color:#3388CC">${project.name}</h2>
                            	<p>项目内容：${project.content}</p>
                            	<p>项目预算：￥${project.budget}</p>
                            	<p>发布日期：<fmt:formatDate value="${project.publicdate}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                        	</a>
                        	<a href="#myPopup3" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                            <div data-role="popup" id="myPopup3" data-overlay-theme="b" data-dismissible="false">
                            	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-left">关闭</a>
      							<ul data-role="listview" data-inset="true" style="min-width:250px">
        							<li data-role="list-divider"><b>选项</b></li>
        							<li><a href="#">评价企业</a></li>
        							<li class="redpop"><a href="WeChat_deleteProject.action?proId=${varStatus.current.id}" rel="external"">删除项目</a></li>
    							</ul>
    						</div>
                    	</li>
                    	</c:forEach>
    				</ul>
    			</div>
            </div>
  		</div>
  		<div data-role="footer" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
    		<div data-role="navbar">
      			<ul>
        			<li><a href="#" class="ui-btn-active ui-state-persist" data-icon="grid">项目</a></li>
        			<li><a href="WeChat_switchPage.action?page=expertPageTwo" data-icon="search" data-transition="none">搜索</a></li>
                    <li><a href="WeChat_switchPage.action?page=expertPageThree" data-icon="comment" data-transition="none">消息</a></li>
        			<li><a href="WeChat_switchPage.action?page=expertPageFour" data-icon="user" data-transition="none">个人</a></li>
      			</ul>
    		</div>
  		</div>
	</div>
</body>
</html>