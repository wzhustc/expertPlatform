<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<title>Service Introduction_expertPlatform</title>
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
					<h1>high quality service provided</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row service-wrapper-row">
				<div class="col-sm-4">
					<div class="service-image">
						<img src="img/homepage-slider/slide2.png" alt="Color Schemes">
					</div>
				</div>
				<div class="col-sm-8">
					<h3>Experienced, Quality Experts</h3>
					<p>At our platform, we give you direct access to the same
						experienced, quality consultants you’ll find at the top firms,
						only in a fraction of the time, and a tenth of the price.</p>
					<p>See how we select, screen, and support our nerds, so you can
						be sure that your project and business goals are in the right
						hands.</p>
				</div>
			</div>
			<div class="row service-wrapper-row">
				<div class="col-sm-4">
					<div class="service-image">
						<img src="img/less-logo.png" alt="LESS CSS">
					</div>
				</div>
				<div class="col-sm-8">
					<h3>Short-term Project</h3>
					<p>What type of project are you interested in?</p>
					<p>As a enterprise,you can publish projects for your company
						and select your suitable experts.</p>
				</div>
			</div>
			<div class="row service-wrapper-row">
				<div class="col-sm-4">
					<div class="service-image">
						<img src="img/homepage-slider/slide1.png" alt="Responsive">
					</div>
				</div>
				<div class="col-sm-8">
					<h3>Business's needs</h3>
					<p>At your free time,it is a good choice to do some
						introduction for a fee.</p>
					<p>As a top expert,your can find a plenty of business's needs
						easily.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="footer.jsp"%>

</body>
</html>
