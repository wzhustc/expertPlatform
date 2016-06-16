<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
	<title>Project List_expertPlatform</title>
	<%@include file="linkAndMeta.jsp"%>
</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to
    improve your experience.</p>
<![endif]-->


<!-- Navigation & Bar-->
<%@include file="navAndBar.jsp"%>

	<!-- Page Title -->
	<div class="section section-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Some Companies</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="section ">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- 公司信息列表 -->
					<table class="company-info">
						<!-- 项目列表1 -->
						<c:if test="${projectList == null}">
							CAN NOT FIND YOUR SOURCE! <br />
						</c:if>
						<c:forEach var="project" items="${projectList}">
							<tr>
								<!-- 公司图片 -->
								<td class="image"><a href="#"><img
										src="img/product1.jpg" alt="Item Name"> </a></td>
								<!-- 公司介绍 -->
								<td>
									<div class="project-name">
										<a href="#"><b>${project.name}</b> </a>
									</div>
									<div class="">StartDate: ${project.startdate}</div>
									<div class="status">Budget: ${project.budget}</div>
								</td>
								<!-- 公司addition -->
								<td><a href="#">Addition</a>
								</td>
								<!-- 公司addition-->
								<td>${project.addition}</td>
								<!-- detail操作 -->
								<td><a href="selectProjectDetailInfo.action?id=${project.id}" class="btn btn-xs btn-grey">
								<input type="hidden" name="id" value="${project.id}">Detail</a>
								<a href="deleteProject.action?id=${project.id}" class="btn btn-xs btn-grey">
								<input type="hidden" name="id" value="${project.id}">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<!-- End Company Project -->
				</div>
			</div>
			<div class="row">
				<!-- Promotion Code -->
				<div class="pagination-wrapper ">
					<ul class="pagination pagination-lg">
						<li class="disabled"><a href="#">Previous</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="footer.jsp"%>
	


</body>
</html>