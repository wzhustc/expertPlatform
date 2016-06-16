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
	<title>Expert Details_expertPlatform</title>
	<script src="js/expert-details.js"></script>
	
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
						<h1>Expert Details</h1>
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
	    					<img src="img/experts/expert1.png" alt="Item Name">
	    				</div>
	    			</div>
	    			<!-- End Product Image & Available Colors -->
	    			<!-- Product Summary & Options -->
	    			<div class="col-sm-6 product-details">
	    				<h4>${expert.realname}</h4>

						<h5>Expert Info</h5>
	    				
						<table class="shop-item-selections">
							<!-- 项目领域 -->
							<tr>
								<td><b>gender : </b></td>
								<td>
									<b>${expert.gender}</b>
								</td>
							</tr>
							<!-- 项目开始时间 -->
							<tr>
								<td><b>field :</b></td>
								<td>
									<b>${expert.field}</b>
								</td>
							</tr>
							<!-- 费用 -->
							<tr>
								<td><b>location : </b></td>
								<td>
									<b>${expert.location}</b>
								</td>
							</tr>
							<!-- 专家申请 -->
							<tr>
								<td>&nbsp;</td>
								<td>
									<button  class="btn btn" data-toggle='modal' data-target='#sendModal'><i class="icon-shopping-cart icon-white"></i> Send Message</button>
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
								<li class="active"><a href="#tab1">Project Introduction</a></li>

							</ul>
							<!-- Tab Content (Full Description) -->
							<div class="tab-content product-detail-info">
								<div class="tab-pane active" id="tab1">
									<h4>Project Content :</h4>
									<p>${project.content}</p>
									<h4>Project Details :</h4>
									<ul>
										<c:forEach items="${educationList}" var="education">
												<li>
												<fmt:formatDate value="${education.fromdate}"
														dateStyle="medium" />
												To
												<fmt:formatDate value="${education.todate}"
														dateStyle="medium" />
												at:&nbsp;
												${education.school}
												achieve:&nbsp;
												${education.degree}
												</li>
											
										</c:forEach>
										<c:forEach items="${honorList}" var="honor">
												<li>
												<fmt:formatDate value="${honor.honordate}"
														dateStyle="medium" />&nbsp;
												honor:&nbsp;
												${honor.honor}</t>
												url:&nbsp;
												${honor.honorurl}
												</li>
										</c:forEach>
										<c:forEach items="${experienceList}" var="experience">
												<li>
												<fmt:formatDate value="${experience.fromdate}"
														dateStyle="medium" />
												To
												<fmt:formatDate value="${experience.todate}"
														dateStyle="medium" />
												at:&nbsp;
												${experience.place}
												achieve:&nbsp;
												${experience.description}
												</li>
										</c:forEach>
										
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
        <!-- Model -->
	<div class="modal fade" id="sendModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Send Message</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" action="messageCompanyToExpert.action" method="post" id="messageForm">
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">To</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="fromEdu"
									id="name" value="@ ${expert.realname}" disabled>
									<input type="hidden" id="eId" name="eId" value="${expert.id}">
									<input type="hidden" id="cId" name="cId" value="${user.id}">
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">message</label>
							<div class="col-sm-6">
								<textarea class="form-control" id="message-text" name="message" id="message"></textarea>
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="sendMessage()">send</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>