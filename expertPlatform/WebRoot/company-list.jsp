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
	<title>Company List_expertPlatform</title>
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
		<div class="row">
			<div class="col-md-4  col-md-offset-2 col-sm-6 col-sm-offset-6 ">
				<div class="">
					<h4>Please Search Here For More:</h4>
					<form action="selectCompanyLikeName.action" method="post">
						<div class="input-group">
							<input class="form-control input-sm" 
								type="text" placeholder="Company Name" name="keySearch">
							<span class="input-group-btn">
								<button class="btn btn-success" type="submit"
									style="height:30px;">Search</button> </span>
						</div>
					</form>
				</div>
			</div>
			<!-- Shipment Options -->
			<div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-6">
				<div class="">
					<h4>Another Way For Search:</h4>
					<form action="selectCompanyLikeField.action" method="post">
					<div class="input-group">
						<input class="form-control input-sm" id="" type="text"
							placeholder="Company field" name="keySearch"> <span
							class="input-group-btn">
							<button class="btn btn-success" type="submit"
								style="height:30px;">Search</button> </span>
					</div>
					</form>
				</div>
			</div>
		</div>
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<!-- 公司信息列表 -->



					<table class="company-info">
						<!-- 项目列表1 -->
						<c:if test="${companyList == null}">
							CAN NOT FIND YOUR SOURCE! <br />
						</c:if>
						<c:forEach var="company" items="${companyList}">
							<tr>
								<!-- 公司图片 -->
								<td class="image"><a href="#"><img
										src="img/product1.jpg" alt="Item Name"> </a></td>
								<!-- 公司介绍 -->
								<td>
									<div class="company-name">
										<a href="#"><b>${company.companyname}</b> </a>
									</div>
									<div class="">location: ${company.location}</div>
									<div class="status">fields: ${company.field}</div>
								</td>
								<!-- 公司addition -->
								<td><a href="#">Addition</a>
								</td>
								<!-- 公司addition-->
								<td>${company.addition}</td>
								<!-- detail操作 -->
								<td><a href="selectCompanyDetailInfo.action?id=${company.id}" class="btn btn-xs btn-grey">
								<input type="hidden" name="id" value="${company.id}">Detail</a>
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