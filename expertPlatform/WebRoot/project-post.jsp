<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Post Project_expertPlatform</title>
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

	<div class="section">
		<div class="container">
			<h2>Post a Project</h2>
			<!-- Header -->
			<form action="postProject.action" method="post">
				<HR style="border-width: 1px;" width="80%" color=#987cb9 SIZE=1>
				<input type="hidden" name="id" value="${user.id}">
				<div class="row">
					<!-- ProjectName -->
					<div class="field row">
						<div class="col-xs-6 col-xs-offset-3">
							<div class="form-group" title="">
								<label
									style="margin-top: 14px; margin-bottom: 14px; font-size: 15px">Project
									Name</label> <input type="text" name="projectname" class="form-control"
									placeholder="Project Name">
							</div>
						</div>
					</div>
				</div>


				<!-- Project Description -->
				<div class="field row">
					<hr style="border: 1px dotted #808080">
					<div class="col-xs-6 col-xs-offset-3">
						<div class="form-group">
							<label
								style="font-size: 15px; margin-top: 14px; margin-bottom: 14px">Project
								Description</label>
							<div class="content">
								<div class="container-fluid">
									<div id='pad-wrapper'>
										<div id="editparent">
											<div id='editControls' class='span9' style='padding: 5px;'>
												<div class='btn-group'>
													<a class='btn glyphicon glyphicon-circle-arrow-left'
														data-role='undo' href='#'><i class='icon-undo'></i></a> <a
														class='btn glyphicon glyphicon-circle-arrow-right'
														data-role='redo' href='#'><i class='icon-repeat'></i></a>
													<a class='btn glyphicon glyphicon-bold' data-role='bold'
														href='#'></a> <a class='btn glyphicon glyphicon-italic'
														data-role='italic' href='#'></a> <a
														class='btn glyphicon glyphicon-align-left'
														data-role='justifyLeft' href='#'><i
														class='icon-align-left'></i></a> <a
														class='btn glyphicon glyphicon-align-center'
														data-role='justifyCenter' href='#'><i
														class='icon-align-center'></i></a> <a
														class='btn glyphicon glyphicon-align-right'
														data-role='justifyRight' href='#'><i
														class='icon-align-right'></i></a> <a
														class='btn glyphicon glyphicon-align-justify'
														data-role='justifyFull' href='#'><i
														class='icon-align-justify'></i></a> <a
														class='btn glyphicon glyphicon-list'
														data-role='justifyList' href='#'></a> <a
														class='btn glyphicon glyphicon-text-height'
														aria-hidden="true" data-role='font' href='#'></a> <a
														class='btn glyphicon glyphicon-text-width'
														aria-hidden="true" data-role='bold' href='#'></a> <a
														class='btn glyphicon glyphicon-indent-left'
														data-role='indentLeft' href="#"><i
														class='icon-indent-right'></i></a> <a
														class='btn glyphicon glyphicon-indent-right'
														data-role='outdentRight' href="#"><i
														class='icon-indent-left'></i></a>
												</div>
											</div>
											<!--文本编辑框-->
											<input id="editor" class="span9 col-md-12" name="content"
												contenteditable>

										</div>
									</div>
								</div>
							</div>
							<div class="footer-banner" style="width: 728px; margin: 0 auto"></div>
						</div>
					</div>
				</div>
		</div>


		<div class="row">
			<!-- Dates -->
			<hr style="border: 1px dotted #808080">
			<div class="field row">
				<div class="col-xs-6 col-xs-offset-3">
					<div class="form-group">
						<label style="margin-top: 14px">DateTimes</label>
					</div>

					<div class="form-group">
						<label class="col-sm-2" style="font-size: 13px">Start Date</label>
						<div class="col-sm-4">
							<input type="date" class="form-control col-sm-3" name="startDate">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" style="font-size: 13px">End Date</label>
						<div class="col-sm-4">
							<input type="date" class="form-control col-sm-4"
								name="finishDate">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- Budget -->
			<hr style="border: 1px dotted #808080">
			<div class="field row">
				<div class="col-xs-6 col-xs-offset-3">
					<div class="form-group" data-original-title="" title="">
						<label
							style="margin-top: 14px; margin-bottom: 14px; font-size: 15px">Estimated
							Budget</label> <input type="text" name="budget" class="form-control"
							placeholder="$">
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- Attachments -->
			<hr style="border: 1px dotted #808080">
			<div class="field row">
				<div class="col-xs-6 col-xs-offset-3">
					<div class="form-group" data-date-start-date="">
						<label style="font-size: 15px">Attachments</label>
						<div class="form-group">
							<input class="col-sm-5" type="file" style="margin-top: 14px"
								title="file">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- Buttons -->
			<hr style="border: 2px solid #808080">
			<div class="form-group">
				<div class="col-xs-6">
					<button type="submit" class="btn btn-default col-sm-offset-8">Review
						and Post</button>
				</div>
				<div class="col-xs-6">
					<button type="submit" class="btn btn-default col-sm-offset-1">Save
						To Be Draft</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	<div class="col-xs-6">
		<div class="disclaimer col-xs-12 col-sm-offset-6"
			style="margin-top: 16px; font-size: 17px">
			By clicking button means you have read and agreed to the <a href="#">Terms
				&amp; Conditions.</a>
		</div>
	</div>
	</div>

	<!-- Footer -->
	<%@include file="footer.jsp"%>


</body>
</html>