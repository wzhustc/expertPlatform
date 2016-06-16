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
<div data-role="page" id="pagetwo" class="companypagetwo">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
        	<ul data-role="listview">
      			<li>
                	<form method="post" action="WeChat_findProject.action">
                    	<label style="margin-bottom:0em">搜索条件</label>
                        <hr class="hrcss">
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="field">项目领域</label>
      						</div>
      						<div class="ui-block-b">
        						<select name="field" id="field">
         							<option value="互联网">互联网</option>
         							<option value="医疗">医疗</option>
                            		<option value="建筑">建筑</option>
                            		<option value="销售">销售</option>
                            		<option value="企业管理">企业管理</option>
                            		<option value="餐饮">餐饮</option>
        						</select>
      						</div>
    					</div>
                        <div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="location">预算</label>
      						</div>
      						<div class="ui-block-b">
        						<select name="budget" id="budget">
                                	<option value="notLimit">--不限--</option>
         							<option value="lt">低于10,000</option>
         							<option value="bt">10,000 ~ 100,000</option>
         							<option value="gt">高于100,000</option>
        						</select>
      						</div>
    					</div>
                        <div class="searchexp"><input type="submit" value="寻找项目"></div>
                    </form>
                </li>
    		</ul>
        </div>
        <div data-role="main" class="ui-content">
        	<ul data-role="listview" class="prolist released" data-filter="true" data-input="#myFilter">
      			<c:forEach items="${seaProList}" var="project" varStatus="varStatus">
      			<li data-icon="bullets" data-filtertext="${varStatus.current.name}">
                    <a href="WeChat_viewProjectDetail.action?proId=${varStatus.current.id}&circle=apply&role=expert&origin=search" rel="external" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">${project.name}</h2>
                           <p>项目内容：${project.content}</p>
                           <p>项目预算：￥${project.budget}</p>
                           <p>发布日期：<fmt:formatDate value="${project.publicdate}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                    </a>
                    <a href="#myPopup4" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                    <div data-role="popup" id="myPopup4" data-overlay-theme="b" data-dismissible="false">
                    	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-left">关闭</a>
      					<ul data-role="listview" data-inset="true" style="min-width:250px">
        					<li data-role="list-divider"><b>选项</b></li>
                            <li class="redpop"><a href="WeChat_applyProject.action?proId=${varStatus.current.id}" rel="external">申请项目</a></li>
        					<li><a href="#relatecompany">联系企业</a></li>
    					</ul>
    				</div>
                </li>
                </c:forEach>
                <c:choose>
                	<c:when test="${not empty seaProList}">
                    	<p style="text-align:center; color:#3388CC"><a href="#" style="text-decoration:none">点击查看更多...</a></p>
                    </c:when>
                    <c:otherwise>
            		</c:otherwise>
            	</c:choose>
    		</ul>
        </div>
  		<div data-role="footer" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
    		<div data-role="navbar">
      			<ul>
        			<li><a href="WeChat_switchPage.action?page=expertPageOne" data-icon="grid" data-transition="none">项目</a></li>
        			<li><a href="#" class="ui-btn-active ui-state-persist" data-icon="search">搜索</a></li>
                    <li><a href="WeChat_switchPage.action?page=expertPageThree" data-icon="comment" data-transition="none">消息</a></li>
        			<li><a href="WeChat_switchPage.action?page=expertPageFour" data-icon="user" data-transition="none">个人</a></li>
      			</ul>
    		</div>
  		</div>
	</div>
</body>
</html>