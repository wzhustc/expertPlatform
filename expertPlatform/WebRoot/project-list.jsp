<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

	<!-- page Title -->
	<div class="eshop-section section">
		<div class="container">
			<h2>Projects List</h2>
				<div class="row">
			<div class="col-md-4  col-md-offset-2 col-sm-6 col-sm-offset-6 ">
				<div class="">
					<h4>Please Search Here For More:</h4>
					<form action="selectProjectLikeName.action" method="post">
						<div class="input-group">
							<input class="form-control input-sm" 
								type="text" placeholder="Project Name" name="keySearch">
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
					<form action="selectProjectLikeField.action" method="post">
					<div class="input-group">
						<input class="form-control input-sm" id="" type="text"
							placeholder="Project field" name="keySearch"> <span
							class="input-group-btn">
							<button class="btn btn-success" type="submit"
								style="height:30px;">Search</button> </span>
					</div>
					</form>
				</div>
			</div>
		</div>

				<c:if test="${projectlist == null}">
							CAN NOT FIND YOUR SOURCE! <br />
				</c:if>
				<c:forEach var="project" items="${projectlist}" varStatus="cou">
					<c:if test="${cou.count eq 1 || (cou.count-1) % 4 eq 0}">
						<div class="row">
					</c:if>
					<div class="col-sm-3">
						<div class="shop-item">
							<div class="image">
								<a href="page-product-details.html"><img
									src="img/product1.jpg" alt="Item Name"></a>
							</div>
							<div class="title">
								<h3>
									<a href="page-product-details.html">${project.name}</a>
								</h3>
							</div>
							<div class="price">
								<span>${project.budget}</span>
							</div>
							<div class="description">
								<p>${project.addition}</p>
							</div>
							<div class="actions">
								<a href="page-product-details.html" class="btn"><i
									class="icon-shopping-cart icon-white"></i> Add to Cart</a> <span>or
									<a
									href="selectProjectDetailInfo.action?id=${project.id}">Read
										more</a>
								</span>
							</div>
						</div>
					</div>
					<c:if test="${(cou.count % 4 eq 0) || (cou.count eq fn:length(projectlist))}">
						</div>
					</c:if>
				</c:forEach>
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