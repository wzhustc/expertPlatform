<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<head>
	<title>Register_expertPlatform</title>
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
					<h1>Register</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-sm-5 col-sm-offset-1">
					<div class="basic-login">

						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#expertTab" data-toggle="tab">
									I WANT TO BE EXPERT </a>
							</li>
							<li><a href="#companyTab" data-toggle="tab"> I REPRESENT
									COMPANY </a>
							</li>
						</ul>
						<div id="myTabContent" class="tab-content" style="margin-top:3px;">

							<div class="tab-pane fade in active" id="expertTab">
								<form role="form" action="registerUser.action" method="post">
									<div class="form-group">
										<label for="register-username"><i class="icon-user"></i>
											<b>UserName</b> </label> <input class="form-control"
											id="register-username" type="text" name="username"
											placeholder="">
									</div>
									<div class="form-group">
										<label for="register-username"><i class="icon-user"></i>
											<b>Email</b> </label> <input class="form-control" id="register-email"
											type="text" name="email" placeholder="">
									</div>
									<div class="form-group">
										<label for="register-password"><i class="icon-lock"></i>
											<b>Password</b> </label> <input class="form-control"
											id="register-password" type="password" name="password"
											placeholder="">
									</div>
									<div class="form-group">
										<label for="register-password2"><i class="icon-lock"></i>
											<b>Re-enter Password</b> </label> <input class="form-control"
											id="register-password2" type="password" placeholder="">
									</div>

									<div class="form-group">
										<input type="hidden" name="role" value="expert">
										<button type="submit" class="btn pull-right">Register</button>
										<div class="clearfix"></div>
									</div>

								</form>

							</div>
							<div class="tab-pane fade" id="companyTab">

								<form role="form" action="registerUser.action" method="post">
									<div class="form-group">
										<label for="register-username"><i class="icon-user"></i>
											<b>UserName</b> </label> <input class="form-control"
											id="register-username" type="text" name="username"
											placeholder="">
									</div>
									<div class="form-group">
										<label for="register-username"><i class="icon-user"></i>
											<b>Email</b> </label> <input class="form-control" id="register-email"
											type="text" name="email" placeholder="">
									</div>
									<div class="form-group">
										<label for="register-password"><i class="icon-lock"></i>
											<b>Password</b> </label> <input class="form-control"
											id="register-password" type="password" name="password"
											placeholder="">
									</div>
									<div class="form-group">
										<label for="register-password2"><i class="icon-lock"></i>
											<b>Re-enter Password</b> </label> <input class="form-control"
											id="register-password2" type="password" placeholder="">
									</div>
									<div class="form-group">
										<input type="hidden" name="role" value="company">
										<button type="submit" class="btn pull-right">Register</button>
										<div class="clearfix"></div>
									</div>
								</form>

							</div>

						</div>
					</div>

				</div>
				<div class="col-sm-5  social-login" style="margin-top:30px;">
					<p>You can use your Facebook or Twitter for registration</p>
					<div class="social-login-buttons">
						<a href="#" class="btn-facebook-login">Use Facebook</a> <a
							href="#" class="btn-twitter-login">Use Twitter</a>
					</div>
				</div>
			</div>
		</div>
		</div>

		<!-- Footer -->
		<%@include file="footer.jsp"%>

	
</body>
</html>
