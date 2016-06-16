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
<div data-role="page" id="pagetwo" class="companypagetwo">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
        	<ul data-role="listview">
      			<li>
                	<form method="post" action="WeChat_findExpert.action">
                    	<label style="margin-bottom:0em">搜索条件</label>
                        <hr class="hrcss">
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="field">专长领域</label>
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
        						<label for="location">所在地区</label>
      						</div>
      						<div class="ui-block-b">
        						<select name="location" id="location">
                                	<option value="notLimit">--不限--</option>
         							<option value="北京">北京</option>
         							<option value="上海">上海</option>
         							<option value="广州">广州</option>
         							<option value="深圳">深圳</option>
         							<option value="杭州">杭州</option>
         							<option value="南京">南京</option>
         							<option value="厦门">厦门</option>
         							<option value="苏州">苏州</option>
        						</select>
      						</div>
    					</div>
                        <div class="searchexp"><input type="submit" value="寻找专家"></div>
                    </form>
                </li>
    		</ul>
        </div>
        <div data-role="main" class="ui-content">
        	<ul data-role="listview">
        		<c:forEach items="${seaExpList}" var="expert" varStatus="varStatus">
      			<li>
                	<a href="WeChat_viewExpertDetail.action?expId=${varStatus.current.id}&origin=search" rel="external" class="cell">
                    	<img src="http://img.591zjh.com/18601056013/144306224052_cut.jpg" alt="加载失败">
        				<h2 style="margin-top:0px; color:#3388CC">${expert.realname}</h2>
        				<p>专业领域：${expert.field}</p>
                        <p>个人简介：${expert.addition}</p>
                	</a>
                    <a href="WeChat_viewExpertDetail.action?expId=${varStatus.current.id}&origin=search" rel="external">查看详情</a>
                </li>
                </c:forEach>
                <c:choose>
                	<c:when test="${not empty seaExpList}">
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
        			<li><a href="WeChat_switchPage.action?page=companyPageOne" data-icon="grid" data-transition="none">项目</a></li>
        			<li><a href="#" class="ui-btn-active ui-state-persist" data-icon="search">搜索</a></li>
                    <li><a href="WeChat_switchPage.action?page=companyPageThree" data-icon="comment" data-transition="none">消息</a></li>
        			<li><a href="WeChat_switchPage.action?page=companyPageFour" data-icon="user" data-transition="none">个人</a></li>
      			</ul>
    		</div>
  		</div>
	</div>
</body>
</html>