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
	<div data-role="page" id="projectdetailpub" class="project">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header3">
        	<a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext" data-rel="back">返回</a>
    		<p>项目详情</p>
  		</div>
  		<c:forEach items="${proList}" var="project" varStatus="varStatus">
        <div data-role="main" class="ui-content detailcontent">
        	<ul data-role="listview">
                <li>
                	<div class="celltitle">项目名称：</div>
                    <p>${project.name}</p>
                </li>
                <li>
                	<div class="celltitle">项目内容：</div>
                    <p>${project.content}</p>
                </li>
                <li>
                	<div class="celltitle">项目流程：</div>
                    <p>${project.process}</p>
                </li>
                <li>
                	<div class="celltitle">项目预算：</div>
                    <p>￥${project.budget}</p>
                </li>
                <li>
                	<div class="celltitle">项目周期：</div>
                    <p>${project.projectcircle}</p>
                </li>
                <li>
                	<div class="celltitle">发布日期：</div>
                    <p><fmt:formatDate value="${project.publicdate}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                </li>
                <c:choose>
                	<c:when test="${circle == 'published' || circle == 'canceled'}">		
                    </c:when>
                    <c:otherwise>
                    	<li>
                			<div class="celltitle">开始日期：</div>
                    		<p><fmt:formatDate value="${project.startdate}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                		</li>
            		</c:otherwise>
            	</c:choose>
                <li>
                	<div class="celltitle">截止日期：</div>
                    <p><fmt:formatDate value="${project.deadline}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                </li>
                <c:choose>
                	<c:when test="${circle == 'ended'}">
                		<li>
                			<div class="celltitle">完成日期：</div>
                    		<p><fmt:formatDate value="${project.finishdate}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                		</li>
                    </c:when>
                    <c:otherwise>
            		</c:otherwise>
            	</c:choose>
                <li>
                	<div class="celltitle">项目简介：</div>
                    <p>${project.addition}</p>
                </li>
                <c:choose>
                	<c:when test="${circle == 'going'}">
                		<li id="revoke">
                    		<a href="WeChat_projectGoingToEnded.action?proId=${varStatus.current.id}" class="ui-btn ui-shadow">标记为已完成</a>
                		</li>
                    </c:when>
                    <c:when test="${circle == 'published'}">
                		<li id="invite">
                    		<a href="#" class="ui-btn ui-shadow">邀请专家</a>
                		</li>
                		<li id="revoke">
                    		<a href="WeChat_projectPublishedToCanceled.action?proId=${varStatus.current.id}" class="ui-btn ui-shadow">撤销当前项目</a>
               		 	</li>
                    </c:when>
                    <c:when test="${circle == 'ended' || circle == 'canceled'}">
                		<li id="revoke">
                    		<a href="WeChat_deleteProject.action?proId=${varStatus.current.id}" class="ui-btn ui-shadow">删除记录</a>
                		</li>
                    </c:when>
                    <c:otherwise>
            		</c:otherwise>
            	</c:choose>   
    		</ul>
        </div>
        <div data-role="footer" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
        	<c:choose>
                <c:when test="${circle == 'going'}">
                	<a href="#" class="ui-btn ui-shadow ui-icon-carat-r ui-btn-icon-right">联系项目专家</a>
                </c:when>
                <c:when test="${circle == 'published'}">
                	<a href="WeChat_viewExpertApplyList.action?proId=${varStatus.current.id}" class="ui-btn ui-shadow ui-icon-carat-r ui-btn-icon-right">查看申请当前项目的专家</a>
                </c:when>
                <c:when test="${circle == 'ended'}">
                	<a href="#" class="ui-btn ui-shadow ui-icon-carat-r ui-btn-icon-right">评论专家</a>
                </c:when>
                <c:otherwise>
            	</c:otherwise>
            </c:choose>	
        </div>
        </c:forEach>
    </div>
</body>
</html>