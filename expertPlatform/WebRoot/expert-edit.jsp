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
	<title>Expert File Edit_expertPlatform</title>
	<script src="js/expert-edit.js"></script>
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
			<h2>Profile Edit</h2>
			<hr style="border: 1px dotted #808080">
			<h3>Basic Information</h3>
			<input type="hidden" id="id" value="${param.id}">
			<form class="form-horizontal" role="form"
				action="selectExpertById.action?id=${param.id}" method="post">
				<HR style="border-width:1px;" width="80%" color=#987cb9 SIZE=1>
				<div id="basicInfo">
				<div class="form-group">
					<label for="inputUserName"
						class="col-sm-2 col-md-offset-1 control-label">email</label>

					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputUserName"
							placeholder="email" name="email" disabled="disabled"
							value="${user.email}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 col-md-offset-1 control-label">Gender</label>

					<div class="col-sm-5">
						<div class="radio">
							<label> <input type="radio" name="gender" value="man"
								checked> I am a man. </label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="gender" value="woman">
								I am a woman. </label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 col-md-offset-1 control-label">RealName</label>

					<div class="col-sm-5">
						<input type="text" class="form-control" name="realname"
							placeholder="RealName">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 col-md-offset-1 control-label">Mobile</label>

					<div class="col-sm-5">
						<input type="text" class="form-control" placeholder="Mobile"
							name="mobile">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 col-md-offset-1 control-label">CityId</label>

					<div class="col-sm-5">
						<input type="email" class="form-control" name="realId"
							placeholder="CityId">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 col-md-offset-1 control-label">Location</label>

					<div class="col-sm-5">
						<div class="col-sm-4">
							<select class="form-control" name="country" id="locationSelect">
								<option selected="selected" value="China">China</option>
								<option value="English">English</option>
								<option value="USA">USA</option>
								<option value="Japan">Japan</option>
							</select>
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="province"
								placeholder="Province">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="city"
								placeholder="City">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 col-md-offset-1 control-label">Fields</label>

					<div class="col-sm-5">
						<input type="email" class="form-control" name="field"
							placeholder="field">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 col-md-offset-1 control-label">Addition</label>

					<div class="col-sm-5">
						<textarea class="form-control" rows="3" name="addition" placeholder="I want to say ..."></textarea>
					</div>
				</div>
				
				<div id="insertInfo">
					
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<button type="button" class="btn btn-default"
							onclick="insertBasicInfo()">submit</button>
					</div>
				</div>
				</div>
				<!--honor info start-->
				<hr style="border: 1px dotted #808080">
				<h3>Honor</h3>

				<div id="honor">
					<table class='table table-hover' style='width: 60%;margin:0 auto'>
						<thead>
							<tr>
								<td>honor date</td>
								<td>honor</td>
								<td>honorUrl</td>
							</tr>
						</thead>
						<tbody id="honorTable">
						</tbody>
					</table>
					<div class="form-group" style="margin-top:8px;">
						<label class="col-sm-2 col-md-offset-1 control-label">HonorDate</label>

						<div class="col-sm-5">
							<input type="date" class="form-control" name="honordate"
								placeholder="HonorDate">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-md-offset-1 control-label">Honor</label>

						<div class="col-sm-5">
							<input type="text" class="form-control" name="honor"
								placeholder="Honor">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-md-offset-1 control-label">Honor
							URL</label>

						<div class="col-sm-5">
							<input type="text" class="form-control" name="honorurl"
								placeholder="HonorLink">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-10">
							<button type="button" class="btn btn-default"
								onclick="honorHandler()">submit</button>
							<button type="button" class="btn btn-default"
								onclick="honorMoreHandler()">submit and add more honor
								info</button>
						</div>
					</div>
				</div>
				<!--honor info end-->

				<!--education info start-->
				<hr style="border: 1px dotted #808080">
				<h3>Education</h3>
				<div id="education">
					<table class='table table-hover' style='width: 60%;margin:0 auto'>
						<thead>
							<tr>
								<td>From</td>
								<td>To</td>
								<td>School</td>
								<td>Degree</td>
							</tr>
						</thead>
						<tbody id="educationTable">
						</tbody>
					</table>
					<div class="form-group" style="margin-top:8px;">
						<label class="col-sm-1 col-md-offset-2 control-label">From</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" name="fromEdu"
								placeholder="from">
						</div>
						<label class="col-sm-1  control-label">To</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" name="toEdu"
								placeholder="to">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-md-offset-1 control-label">School</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="school"
								placeholder="school">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-md-offset-1 control-label">Degree</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="degree"
								placeholder="degree">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-10">
							<button type="button" class="btn btn-default"
								onclick="educationHandler()">submit</button>
							<button type="button" class="btn btn-default"
								onclick="educationMoreHandler()">submit and add more
								Education info</button>
						</div>
					</div>
				</div>
				<!--education info end-->

				<!--Experience info start-->
				<hr style="border: 1px dotted #808080">
				<h3>Experience</h3>
				<div id="experience">
					<table class='table table-hover' style='width: 60%;margin:0 auto'>
						<thead>
							<tr>
								<td>From</td>
								<td>To</td>
								<td>Place</td>
								<td>JobDescription</td>
							</tr>
						</thead>
						<tbody id="experienceTable">
						</tbody>
					</table>
					<div class="form-group" style="margin-top:8px;">
						<label class="col-sm-1 col-md-offset-2 control-label">From</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" name="fromEx"
								placeholder="from">
						</div>
						<label class="col-sm-1  control-label">To</label>
						<div class="col-sm-2">
							<input type="date" class="form-control" name="toEx"
								placeholder="to">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-md-offset-1 control-label">Place</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="place"
								placeholder="place">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-md-offset-1 control-label">Job
							Description</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="jobdescription"
								placeholder="job description">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-10">
							<button type="button" class="btn btn-default"
								onclick="experienceHandler()">submit</button>
							<button type="button" class="btn btn-default"
								onclick="experienceMoreHandler()">submit and add more
								Experience info</button>
						</div>
					</div>
				</div>
				<!--Experience info end-->

				<hr style="border: 2px solid #808080">
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
				</div>
			</form>

		</div>
	</div>

	<!-- End profile -->

	
	<form enctype="multipart/form-data">
		<div class="row">
			<div class="form-group col-sm-4 col-md-offset-3">
				<input id="file-2" type="file" multiple class="file"
					data-overwrite-initial="false" data-min-file-count="1">
			</div>
		</div>
	</form>


	<!-- Footer -->
	<%@include file="footer.jsp"%>

	<!-- Javascripts -->
	<script>
		var i = 1;
		$("#file-1").fileinput({
			uploadUrl : 'uploadFile.action', // you must set a valid URL here else you will get an error
			allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
			overwriteInitial : false,
			maxFileSize : 1000,
			maxFilesNum : 10,
			//allowedFileTypes: ['image', 'video', 'flash'],
			slugCallback : function(filename) {
				alert(i);
				i = i + 1;
				alert(filename);

				return filename.replace('(', '_').replace(']', '_');
			}
		});
		$("#file-2").fileinput({
			uploadUrl : '#', // you must set a valid URL here else you will get an error
			allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
			overwriteInitial : false,
			maxFileSize : 1000,
			maxFilesNum : 10,
			//allowedFileTypes: ['image', 'video', 'flash'],
			slugCallback : function(filename) {
				return filename.replace('(', '_').replace(']', '_');
			}
		});
	</script>
</body>

</html>
