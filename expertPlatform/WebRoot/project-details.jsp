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
	<title>Project Details_expertPlatform</title>
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
						<h1>Project Details</h1>
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
	    				<h4>${project.name}</h4>

						<h5>Project Description</h5>
	    				<p>This is a ${project.name} project, This project is about ${project.content }</p>
						<table class="shop-item-selections">
							<!-- 项目领域 -->
							<tr>
								<td><b>Project Content : </b></td>
								<td>
									<b>${project.content}</b>
								</td>
							</tr>
							<!-- 项目开始时间 -->
							<tr>
								<td><b>Public Date :</b></td>
								<td>
									<b><fmt:formatDate value="${project.publicdate}" pattern="yyyy-MM-dd"></fmt:formatDate></b>
								</td>
							</tr>
							<!-- 费用 -->
							<tr>
								<td><b>Project Budget : </b></td>
								<td>
									<b>${project.budget}</b>
								</td>
							</tr>
							<!-- 专家申请 -->
							<tr>
								<td>&nbsp;</td>
								<td>
									<a href="#" class="btn btn"><i class="icon-shopping-cart icon-white"></i> APPLY IT</a>
                                    <a href="#" class="btn btn"><i class="icon-shopping-cart icon-white"></i> MARK IT</a>
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
									<h4>Project Content :</h4>
									<p>${project.content}</p>
									<h4>Project Details :</h4>
									<ul>
										
										<li>Current State：${project.current}</li>
                                        <li>Process : ${project.process}</li>
										<li>Publish Date : <fmt:formatDate value="${project.publicdate}" pattern="yyyy-MM-dd"></fmt:formatDate></li>
										<li>Deadline : <fmt:formatDate value="${project.deadline}" pattern="yyyy-MM-dd"></fmt:formatDate></li>
										<li>Budget : $${project.budget}</li>
										<li>Addition : ${project.addition}</li>
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