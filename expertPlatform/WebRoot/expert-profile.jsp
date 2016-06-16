<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<title>Expert Profile_expertPlatform</title>
	<script src="js/expert-profile.js"></script>
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
	<!--End Navigation & Logo-->


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
									<img id="imageHeader" src="img/headImage.jpg">
								</div>
							</div>
							<div class="col-md-7 col-md-offset-1 margin">
								<h4>${expert.realname}</h4>
								username:${user.username}<br>email : ${user.email}
								<div class="actions">
									<a href="expert-edit.jsp?id=${user.id}" class="btn btn-default"
										role="button" style="width: 13em;height:2em;margin-top: 1em;">Edit</a>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-info" style="height:180px;">
						<div class="panel-heading">
							<h3 class="panel-title">Basic</h3>
						</div>
						<div class="single-block">
							<div class="single-attribute">Star Rating:</div>
							<div class="single-value">
								<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</div>
						<div class="single-block">
							<div class="single-attribute">Gender:</div>
							<div class="single-value">${expert.gender}</div>
						</div>
						<div class="single-block">
							<div class="single-attribute">Location:</div>
							<div class="single-value">${expert.location}</div>
						</div>
						<div class="single-block">
							<div class="single-attribute">Mobile:</div>
							<div class="single-value">${expert.mobile}</div>
						</div>
						<div class="single-block">
							<div class="single-attribute">Account:</div>
							<div class="single-value">
								${expert.account}<span> ￥</span>
							</div>
						</div>
						<div class="single-block">
							<div class="single-attribute">Field:</div>
							<div class="single-value">${expert.field}</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">About</h3>
						</div>
						<ul>
							<li><a href="selectProjectByExpertID.action?id=${user.id}">My Projects</a></li>
							<li><a href="initCompanyList.action">Companies Linked</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-8">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">
								Education
								<button type="button" class="btn btn-default btn-xs"
									style="float:right" onclick="educationEdit()"
									id="eduEditButton">edit model</button>
							</h3>

						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-hover"
									id="educationTable">
									<thead>
										<tr>
											<td>From</td>
											<td>To</td>
											<td>School</td>
											<td>Degree</td>
											<td></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${educationList}" var="education">
											<tr>

												<td><fmt:formatDate value="${education.fromdate}"
														dateStyle="medium" /><input type="hidden"
													value="${education.id}">
												</td>
												<td><fmt:formatDate value="${education.todate}"
														dateStyle="medium" />
												</td>
												<td>${education.school}</td>
												<td>${education.degree}<input type="hidden"
													value="${education.id}">
												</td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">
								Experience
								<button type="button" class="btn btn-default btn-xs"
									style="float:right" onclick="experienceEdit()"
									id="expEditButton">edit model</button>
							</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-hover"
									id="experienceTable">
									<thead>
										<tr>
											<td>From</td>
											<td>To</td>
											<td>Place</td>
											<td>Job Description</td>
											<td></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${experienceList}" var="experience">
											<tr>
												<td><fmt:formatDate value="${experience.fromdate}"
														dateStyle="medium" /><input type="hidden"
													value="${experience.id}">
												</td>
												<td><fmt:formatDate value="${experience.todate}"
														dateStyle="medium" />
												</td>
												<td>${experience.place}</td>
												<td>${experience.description}</td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">
								Honor
								<button type="button" class="btn btn-default btn-xs"
									style="float:right" onclick="honorEdit()" id="honorEditButton">edit model</button>
							</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-hover" id="honorTable">
									<thead>
										<tr>
											<td>Date</td>
											<td>Honor</td>
											<td>Url</td>
											<td></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${honorList}" var="honor">
											<tr>
												<td>
												<fmt:formatDate value="${honor.honordate}" dateStyle="medium" />
												<input type="hidden" value="${honor.id}">
												</td>
												<td>${honor.honor}</td>
												<td>${honor.honorurl}</td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- End profile -->

	<!-- Footer -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-footer col-md-3 col-xs-6">
					<h3>Successful Cases</h3>
					<ul class="no-list-style footer-navigate-section">
						<li><a href="#">Student Manage System</a></li>
						<li><a href="#">Papers on Analysis of air</a></li>
						<li><a href="#">Advanced Agriculture</a></li>
						<li><a href="#">How to deal with ring of planes</a></li>
					</ul>
				</div>
				<div class="col-footer col-md-3 col-xs-6">
					<h3>Resource</h3>
					<ul class="no-list-style footer-navigate-section">
						<li><a href="page-blog-posts.html">Company Introduced</a></li>
						<li><a href="page-portfolio-3-columns-2.html">Use Case</a></li>
						<li><a href="page-products-3-columns.html">Privacy Policy</a>
						</li>
						<li><a href="page-faq.html">FAQ</a></li>
					</ul>
				</div>

				<div class="col-footer col-md-4 col-xs-6">
					<h3>Contacts</h3>

					<p class="contact-us-details">
						<b>Address:</b> wenhui Street, wuzhong, SuZhou, China<br /> <b>Phone:</b>
						+188 8888 8888<br /> <b>Fax:</b> +188 8888 8888<br /> <b>Email:</b>
						<a href="mailto:chengshuozhang@163.com">chengshuozhang@163.com</a>
					</p>
				</div>
				<div class="col-footer col-md-2 col-xs-6">
					<h3>Stay Connected</h3>
					<ul class="footer-stay-connected no-list-style">
						<li><a href="#" class="wechat"></a></li>
						<li><a href="#" class="facebook"></a></li>
						<li><a href="#" class="QQ"></a></li>

					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="footer-copyright">&copy; 2016 mPurpose. All
						rights reserved.ICP主体备案号： 苏ICP备15060798号</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Model -->
	<div class="modal fade" id="eduModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Education Edit</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" method="post">
						<input id="modifyId" type="hidden">
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">From</label>
							<div class="col-sm-5">
								<input type="date" class="form-control" name="fromEdu"
									id="fromEdu" placeholder="from">
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">To</label>
							<div class="col-sm-6">
								<input type="date" class="form-control" name="toEdu" id="toEdu"
									placeholder="to">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">School</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="school"
									id="school" placeholder="school">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">Degree</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="degree"
									id="degree" placeholder="degree">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="eduDelete()">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="saveEduChange()">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="expModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Experience Edit</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" method="post">
						<input id="modifyExpId" type="hidden">
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">From</label>
							<div class="col-sm-5">
								<input type="date" class="form-control" name="fromExp"
									id="fromExp">
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">To</label>
							<div class="col-sm-6">
								<input type="date" class="form-control" name="toExp" id="toExp">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">Place</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="place" id="place"
									placeholder="Place">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">JobDescription</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="jobDescription"
									id="jobDescription" placeholder="JobDescription">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="expDelete()">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="saveExpChange()">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="honorModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Honor Edit</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" method="post">
						<input id="modifyHonorId" type="hidden">
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">Honor Date</label>
							<div class="col-sm-6">
								<input type="date" class="form-control" name="honorDate" id="honorDate">
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">Honor</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="honor" id="honor" placeholder="Honor">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-md-offset-1 control-label">Honor URL</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="honorURL" id="honorURL" placeholder="honorURL">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="honorDelete()">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="saveHonorChange()">Save changes</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
