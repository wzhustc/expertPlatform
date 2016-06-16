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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Company Details_expertPlatform</title>
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
						<h1>Company Details</h1>
					</div>
				</div>
			</div>
		</div>
        
        <div class="section">
	    	<div class="container">
	    		<div class="row">
	    			<!-- Product Image & Available Colors -->
	    			<div class="col-sm-4">
	    				<div class="product-image-large">
	    					<img src="img/product1.jpg" alt="Item Name">
	    				</div>
	    			</div>
	    			<!-- End Product Image & Available Colors -->
	    			<!-- Product Summary & Options -->
	    			<div class="col-sm-6 product-details">
	    				<h4>${company.companyname}</h4>

						<h5>Company Description</h5>
	    				
						<table class="shop-item-selections">
							<!-- Company Name -->
							<tr>
								<td><b>Company Name : </b></td>
								<td>
									<b>${company.companyname}</b>
								</td>
							</tr>
							<!-- Company CEO -->
							<tr>
								<td><b>Company CEO :</b></td>
								<td>
									<b>${company.realname}</b>
								</td>
							</tr>
							<!-- Company field-->
							<tr>
								<td><b>Company Business : </b></td>
								<td>
									<b>${company.field}</b>
								</td>
							</tr>
							
						</table>
	    			</div>
	    			<!-- End Product Summary & Options -->
	    			
	    			<!-- Full Description & Specification -->
	    			<div class="col-sm-12">
	    				<div class="tabbable">
	    					<!-- Tabs -->
							<ul class="nav nav-tabs product-details-nav">
								<li class="active"><a href="#tab1" data-toggle="tab">Project Introduction</a></li>

							</ul>
							<!-- Tab Content (Full Description) -->
							<div class="tab-content product-detail-info">
								<div class="tab-pane active" id="tab1">
									<h4>Company Type :</h4>
									<p>${company.addition}</p>
									<h4>Company Details :</h4>
									<ul>
										<li>Company Name : ${company.companyname}</li>
										<li>Company CEO : ${company.realname}</li>
										<li>Company Business : ${company.field}</li>
										<li>Company Location : ${company.location}</li>
										<li>Company Addition : ${company.addition}</li>
									</ul>
								</div>
							</div>
						</div>
	    			</div>
	    			<!-- End Full Description & Specification -->
	    		</div>
			</div>
		</div>

        <!-- Footer -->
        <%@include file="footer.jsp"%>

</body>
</html>