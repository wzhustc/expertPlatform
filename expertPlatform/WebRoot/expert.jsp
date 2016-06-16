<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
	<title>Expert List_expertPlatform</title>
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

	<!-- select bar -->
	<div class="section section-breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Meet some of our experts</h1>
				</div>
			</div>
			<form action="selectExpertByUsername.action" method="post">
				<div class="row" id="select_expert">
					<div class="col-md-4 col-md-offset-1">
						<select class="form-control" name="field">
							<option>computer</option>
							<option>agriculture</option>
							<option>architecture</option>
							<option>biology</option>
							<option>atmosphere</option>
						</select>
					</div>
					<div class="col-md-4">
						<input type="text" class="form-control" id="inputSuccess"
							placeholder="key words" name="expertName">
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<button type="submit" class="btn btn-success">Find
								Experts</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="eshop-section section">
		<div class="container">
			<c:if test="${not empty selectExpert}">
				<h4 s>Show result for your search</h4>

				<div class="row">
					<div class="col-md-3 col-sm-6">
						<!-- Expert -->
						<div class="shop-item">
							<!-- Expert Image -->
							<div class="shop-item-image">
								<a href="page-product-details.html"><img
									src="img/experts/expert1.png" alt="Item Name"></a>
							</div>
							<!-- Expert Title -->
							<div class="title">
								<h3>
									<a href="showExpertDetailsByEID.action?id=${selectExpert.id}">${selectExpert.realname}</a>
								</h3>
							</div>
							<!-- Expert Available Colors-->
							<div class="colors">
								rate: <span class="color-white"></span> <span
									class="color-black"></span> <span class="color-blue"></span> <span
									class="color-orange"></span> <span class="color-green"></span>
							</div>
							<div class="info">
								<strong>Description</strong>
								<p>gender：${selectExpert.gender}</p>
								<p>mobile:${selectExpert.mobile}</p>
								<p>location:${selectExpert.location}</p>
								<strong>Honor</strong>
								<p>${selectExpert.glory}</p>
								<strong>Field</strong>
								<p>${selectExpert.field}</p>

							</div>



							<!-- Details Button -->
							<div class="actions">
								<a href="showExpertDetailsByEID.action?id=${selectExpert.id}" class="btn btn-block"><i
									class="icon-shopping-cart icon-white"></i> See Details</a>
							</div>
						</div>
						<!-- End Expert -->
					</div>
				</div>
				<hr style="border: solid 2px grey;">
			</c:if>
		<c:forEach var="expert" items="${expertList}" varStatus="cou">
				<c:if test="${cou.count eq 1 || (cou.count-1) % 4 eq 0}">
					<div class="row">
				</c:if>
				<div class="col-md-3 col-sm-6">
					<!-- Expert -->
					<div class="shop-item">
						<!-- Expert Image -->
						<div class="shop-item-image">
							<a href="page-product-details.html"><img
								src="img/experts/expert1.png" alt="Item Name"></a>
						</div>
						<!-- Expert Title -->
						<div class="title">
							<h3>
								<a href="showExpertDetailsByEID.action?id=${expert.id}">${expert.realname}</a>
							</h3>
						</div>
						<!-- Expert Available Colors-->
						<div class="colors">
							rate: <span class="color-white"></span> <span class="color-black"></span>
							<span class="color-blue"></span> <span class="color-orange"></span>
							<span class="color-green"></span>
						</div>
						<div class="info">
							<strong>Description</strong>
							<p>gender：${expert.gender}</p>
							<p>mobile:${expert.mobile}</p>
							<p>location:${expert.location}</p>
							<strong>Field</strong>
							<p>${expert.field}</p>

						</div>



						<!-- Details Button -->
						<div class="actions">
							<a href="showExpertDetailsByEID.action?id=${expert.id}"
								class="btn btn-block"><i
								class="icon-shopping-cart icon-white"></i> See Details</a>
						</div>
					</div>
					<!-- End Expert -->
				</div>
				<c:if test="${(cou.count % 4 eq 0) || (cou.count eq fn:length(expertList))}">
					</div>
				</c:if>
		</c:forEach>
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

	<div class="eshop-section section">
		<div class="container">
			<h2>Hot Experts</h2>

			<div class="row">
				<div class="col-md-3 col-sm-6">
					<!-- Expert -->
					<div class="shop-item">
						<!-- Expert Image -->
						<div class="shop-item-image">
							<a href="page-product-details.html"><img
								src="img/experts/expert1.png" alt="Item Name"></a>
						</div>
						<!-- Expert Title -->
						<div class="title">
							<h3>
								<a href="page-product-details.html">Lorem ipsum dolor</a>
							</h3>
						</div>
						<!-- Expert Available Colors-->
						<div class="colors">
							rate: <span class="color-white"></span> <span class="color-black"></span>
							<span class="color-blue"></span> <span class="color-orange"></span>
							<span class="color-green"></span>
						</div>
						<div class="info">
							<strong>Position</strong>
							<p>Dale Grossman Consulting</p>
							<p>Strategic, Management, & Financial Consultant</p>
							<p>Director of Strategic Planning</p>
							<strong>School</strong>
							<p>New York University - Leonard N. Stern School of Business</p>
							<strong>Field</strong>
							<p>Computer&Electron</p>

						</div>



						<!-- Details Button -->
						<div class="actions">
							<a href="page-product-details.html" class="btn btn-block"><i
								class="icon-shopping-cart icon-white"></i> See Details</a>
						</div>
					</div>
					<!-- End Product -->
				</div>
				<div class="col-md-3 col-sm-6">
					<!-- Expert -->
					<div class="shop-item">
						<!-- Expert Image -->
						<div class="shop-item-image">
							<a href="page-product-details.html"><img
								src="img/experts/expert1.png" alt="Item Name"></a>
						</div>
						<!-- Expert Title -->
						<div class="title">
							<h3>
								<a href="page-product-details.html">Lorem ipsum dolor</a>
							</h3>
						</div>
						<!-- Expert Available Colors-->
						<div class="colors">
							rate: <span class="color-white"></span> <span class="color-black"></span>
							<span class="color-blue"></span> <span class="color-orange"></span>
							<span class="color-green"></span>
						</div>
						<div class="info">
							<strong>Position</strong>
							<p>Dale Grossman Consulting</p>
							<p>Strategic, Management, & Financial Consultant</p>
							<p>Director of Strategic Planning</p>
							<strong>School</strong>
							<p>New York University - Leonard N. Stern School of Business</p>
							<strong>Field</strong>
							<p>Computer&Electron</p>

						</div>



						<!-- Details Button -->
						<div class="actions">
							<a href="page-product-details.html" class="btn btn-block"><i
								class="icon-shopping-cart icon-white"></i> See Details</a>
						</div>
					</div>
					<!-- End Product -->
				</div>
				<div class="col-md-3 col-sm-6">
					<!-- Expert -->
					<div class="shop-item">
						<!-- Expert Image -->
						<div class="shop-item-image">
							<a href="page-product-details.html"><img
								src="img/experts/expert1.png" alt="Item Name"></a>
						</div>
						<!-- Expert Title -->
						<div class="title">
							<h3>
								<a href="page-product-details.html">Lorem ipsum dolor</a>
							</h3>
						</div>
						<!-- Expert Available Colors-->
						<div class="colors">
							rate: <span class="color-white"></span> <span class="color-black"></span>
							<span class="color-blue"></span> <span class="color-orange"></span>
							<span class="color-green"></span>
						</div>
						<div class="info">
							<strong>Position</strong>
							<p>Dale Grossman Consulting</p>
							<p>Strategic, Management, & Financial Consultant</p>
							<p>Director of Strategic Planning</p>
							<strong>School</strong>
							<p>New York University - Leonard N. Stern School of Business</p>
							<strong>Field</strong>
							<p>Computer&Electron</p>

						</div>



						<!-- Details Button -->
						<div class="actions">
							<a href="page-product-details.html" class="btn btn-block"><i
								class="icon-shopping-cart icon-white"></i> See Details</a>
						</div>
					</div>
					<!-- End Product -->
				</div>
				<div class="col-md-3 col-sm-6">
					<!-- Expert -->
					<div class="shop-item">
						<!-- Expert Image -->
						<div class="shop-item-image">
							<a href="page-product-details.html"><img
								src="img/experts/expert1.png" alt="Item Name"></a>
						</div>
						<!-- Expert Title -->
						<div class="title">
							<h3>
								<a href="page-product-details.html">Lorem ipsum dolor</a>
							</h3>
						</div>
						<!-- Expert Available Colors-->
						<div class="colors">
							rate: <span class="color-white"></span> <span class="color-black"></span>
							<span class="color-blue"></span> <span class="color-orange"></span>
							<span class="color-green"></span>
						</div>
						<div class="info">
							<strong>Position</strong>
							<p>Dale Grossman Consulting</p>
							<p>Strategic, Management, & Financial Consultant</p>
							<p>Director of Strategic Planning</p>
							<strong>School</strong>
							<p>New York University - Leonard N. Stern School of Business</p>
							<strong>Field</strong>
							<p>Computer&Electron</p>

						</div>



						<!-- Details Button -->
						<div class="actions">
							<a href="page-product-details.html" class="btn btn-block"><i
								class="icon-shopping-cart icon-white"></i> See Details</a>
						</div>
					</div>
					<!-- End Product -->
				</div>
			</div>

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

	<!-- Footer -->
	<%@include file="footer.jsp"%>

</body>
</html>
