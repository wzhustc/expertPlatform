<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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
	<title>Company Profile_expertPlatform</title>
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
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>


	<!-- image -->
	<div class="section">
		<div class="container">
			<h2>Profile</h2>

			<div class="row">
				<div class="col-md-4">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">My Profile</h3>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="panel-body">
									<img id="imageHeader" src="img/product2.jpg">
								</div>
							</div>
							<div class="col-md-7 col-md-offset-1 margin">
								<h4><b>Company:${company.companyname}</b></h4>
								Legal Person: ${company.realname}<br> Email : ${user.email}
								<div class="actions">
									<a href="company-file-edit.jsp" class="btn btn-default" role="button"
										style="width: 13em;height:2em;margin-top: 1.5em;">Edit</a>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">Basic</h3>
						</div>
						
						<div class="single-block">
							<div class="single-attribute">Business ID:</div>
							<div class="single-value">${company.companyid}</div>
						</div>
						
						<div class="single-block">
							<div class="single-attribute">Location:</div>
							<div class="single-value">${company.location}</div>
						</div>
						
						<div class="single-block">
							<div class="single-attribute">Mobile:</div>
							<div class="single-value">${company.mobile}</div>
						</div>
						
						<div class="single-block">
							<div class="single-attribute">Account:</div>
							<div class="single-value">
								<span>$</span>${company.account}
							</div>
						</div>
						
						<div class="single-block">
							<div class="single-attribute">Field:</div>
							<div class="single-value">${company.field}</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">Experts Questions</h3>
							<button class="btn btn-info pull-right"
								style="width: 58px; height: 30px;margin-top: -23px">
								<span>more</span>
							</button>
						</div>
						<ul>
							<li>
								<h5>
									<a href="#"> How do we find and approach the projects of
										your company posted? </a>
								</h5>
								<h5 class="date date-time">Date:2016-03-03</h5>
							</li>
							<li>
								<h5>
									<a href="#"> Do your company have projects about Andriod
										development area? </a>
								</h5>
								<h5 class="date date-time">Date:2016-02-28</h5>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-8">
					<div class="panel panel-info">
						<div class="panel-heading" id="my-project">
							<div class="collapse navbar-collapse">
								<ul class="my-menu">
									<li class="nav-current" role="presentation"><a href="#"
										style="color: inherit;font-size: 16px; margin-bottom: 0; margin-top: 0"><b>My
												Projects (0)</b> </a>
									</li>
									<li role="presentation"><a href="#"
										style="color: inherit;font-size: 16px; margin-bottom: 0; margin-top: 0"><b>My
												Consultants (0)</b> </a>
									</li>
									<li role="presentation"><a href="#"
										style="color: inherit;font-size: 16px; margin-bottom: 0; margin-top: 0"><b>My
												Messages (0)</b> </a>
									</li>
								</ul>
							</div>

						</div>
						<div class="tab-content">
							<div id="my-projects" class="active tab-pane no-reload">
								<div class="text-center"
									style="margin-top: 20px;margin-bottom: 20px; padding-bottom: 10px">
									<h2>Get Started Now.</h2>
									<div class="row">
										<div class="col-md-5 col-md-offset-1">
											
											<input type="hidden" name="id" value="${user.id}">
												<div class="btn-group btn-group-lg">
													<a href="checkProject.action?id=${user.id}" class="btn btn-info btn-lg">Check My projects</a>
												</div>
										
										</div>
										<div class="col-md-5">
											<form  method="post">
												<input type="hidden" name="id" value="${user.id}">
												<div class="btn-group btn-group-lg">
													<a class="btn btn-info btn-lg" href="project-post.jsp">Start A New Project</a>
												</div>
											</form>
										</div>
									</div>
									<br> <br>
								</div>
							</div>
							<div id="my-consultants" class="tab-pane no-reload">
								<div class="row">
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<span>How do we find and approach the projects of
													your company posted ?</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<span class="date date-time">2016-03-01</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<a href="#">details</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<span>How do we find and approach the projects of
													your company posted ?</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<span class="date date-time">2016-03-01</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<a href="#">details</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<span>How do we find and approach the projects of
													your company posted ?</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<span class="date date-time">2016-03-01</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="row">
											<h5>
												<a href="#">details</a>
											</h5>
										</div>
									</div>
								</div>
							</div>
							<div id="my-messages" class="tab-pane no-reload">
								<div class="row">
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span>Your project has a problem </span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span>From : System </span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span class="date date-time">2016-03-01</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<a href="#">details</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span>How do we find and approach the projects of
													your company posted ?</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span>From : Zhang Chengshuo </span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span class="date date-time">2016-03-01</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<a href="#">details</a>
											</h5>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span>How do we find and approach the projects of
													your company posted ?</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span>From : Zhang wei </span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<span class="date date-time">2016-03-01</span>
											</h5>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="row">
											<h5>
												<a href="#">details</a>
											</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading" id="my-help">
							<h3 class="panel-title">What do you need help with ?</h3>
						</div>
						<div class="panel-body">
							<div class="nav tabs-wrapper">
								<ul class="nav nav-tabs nav-justified hn-tabs"
									style="height: 120px">
									<li><a href="#"> <i><img
												src="img/service-icon/box.png"> </i> <br> A New
											Business </a>
									</li>
									<li><a href="#"> <i><img
												src="img/service-icon/chat.png"> </i> <br> Marketing
									</a>
									</li>
									<li><a href="#"> <i><img
												src="img/service-icon/diamond.png"> </i> <br>
											Analysis </a>
									</li>
									<li><a href="#"> <i><img
												src="img/service-icon/ruler.png"> </i> <br>
											Optimization </a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading" id="my-experts">
							<h3 class="panel-title">Related Experts</h3>
							<button class="btn btn-info pull-right"
								style="width: 58px; height: 30px;margin-top: -23px">
								<span>fresh</span>
							</button>
						</div>
						<div class="expert-list row" data-first-consultant="4">
							<c:forEach var="expertRelated" items="${expertRelatedList}">
								<div class="col-sm-3 col-xs-6">
									<div class="col-xs-12 text-center pic-row">
										<img src="img/user2.jpg" alt="Lily"
											class="img-responsive img-circle profile-pic col-xs-offset-1">
									</div>
									<div class="col-xs-12 text-center name-row">
										<strong>${expertRelated.realname}</strong>
									</div>
									<div class="single-value">
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									</div>
									<div class="col-xs-12 text-center school-row">
										<img class="img-responsive"
											src="img/expert-graduate-certificate/expert1-graduate-certificate.jpg"
											alt="Columbia">
									</div>
									<div class="col-xs-12 text-center view-row"
										style="padding-top: 10px">
										<a href="showExpertDetailsByEID.action?id=${expertRelated.id}" target="_blank" class="btn btn-default btn-sm">View
											Profile </a>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End profile -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>

</body>
</html>
