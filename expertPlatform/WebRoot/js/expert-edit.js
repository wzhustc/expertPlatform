/**
 * Created by chengshuo on 2016/3/11.
 */

function honorHandler() {

	var honor = $("input[name='honor']").val();
	var honordate = $("input[name='honordate']").val();
	var honorurl = $("input[name='honorurl']").val();
	var id = $("#id").val();

	$("#honor .form-group").remove();
	$("#honorTable").append(
			"<tr class='info'> <td>" + honordate + "</td> <td>" + honor
					+ "</td> <td>" + honorurl + "</td></tr>");

	$.ajax({
		type : "post",
		dataType : "json",
		url : "addHonor.action",
		data : {
			id : id,
			honordate : honordate,
			honor : honor,
			honorurl : honorurl
		},
		success : function(msg) {
			if (true) {
				alert("添加成功！");
			}

		}
	});
}
function honorMoreHandler() {
	var honor = $("input[name='honor']").val();
	var honordate = $("input[name='honordate']").val();
	var honorurl = $("input[name='honorurl']").val();
	var id = $("#id").val();

	$("#honorTable").prepend(
			"<tr class='info'> <td>" + honordate + "</td> <td>" + honor
					+ "</td> <td>" + honorurl + "</td></tr>");
	$("input[name='honor']").val("");
	$("input[name='honordate']").val("");
	$("input[name='honorurl']").val("");

	$.ajax({
		type : "post",
		dataType : "json",
		url : "addHonor.action",
		data : {
			id : id,
			honordate : honordate,
			honor : honor,
			honorurl : honorurl
		},
		success : function(msg) {
			if (true) {
				alert("添加成功！");
			}

		}
	});
}

function educationHandler() {

	alert("start!");
	var fromdate = $("input[name='fromEdu']").val();
	var todate = $("input[name='toEdu']").val();
	var school = $("input[name='school']").val();
	var degree = $("input[name='degree']").val();
	var id = $("#id").val();

	$("#education .form-group").remove();
	$("#educationTable").append(
			"<tr class='info'> <td>" + fromdate + "</td> <td>" + todate
					+ "</td> <td>" + school + "</td><td>" + degree
					+ "</td></tr>");

	$.ajax({
		type : "post",
		dataType : "json",
		url : "addEducation.action",
		data : {
			fromdate : fromdate,
			todate : todate,
			school : school,
			degree : degree,
			id : id
		},
		success : function(msg) {
			if (true) {
				alert("添加成功！");
			}

		}
	});
}
function educationMoreHandler() {
	var fromdate = $("input[name='fromEdu']").val();
	var todate = $("input[name='toEdu']").val();
	var school = $("input[name='school']").val();
	var degree = $("input[name='degree']").val();
	var id = $("#id").val();

	$("#educationTable").prepend(
			"<tr class='info'> <td>" + fromdate + "</td> <td>" + todate
					+ "</td> <td>" + school + "</td><td>" + degree
					+ "</td></tr>");

	$("input[name='fromEdu']").val("");
	$("input[name='toEdu']").val("");
	$("input[name='school']").val("");
	$("input[name='degree']").val("");

	$.ajax({
		type : "post",
		dataType : "json",
		url : "addEducation.action",
		data : {
			fromdate : fromdate,
			todate : todate,
			school : school,
			degree : degree,
			id : id
		},
		success : function(msg) {
			if (true) {
				alert("添加成功！");
			}

		}
	});
}
function experienceHandler() {

	
	var fromdate = $("input[name='fromEx']").val();
	var todate = $("input[name='toEx']").val();
	var place = $("input[name='place']").val();
	var jobdescription = $("input[name='jobdescription']").val();
	var id = $("#id").val();

	$("#experience .form-group").remove();
	$("#experienceTable").append(
			"<tr class='info'> <td>" + fromdate + "</td> <td>" + todate
					+ "</td> <td>" + place + "</td><td>" + jobdescription
					+ "</td></tr>");

	$.ajax({
		type : "post",
		dataType : "json",
		url : "addExperience.action",
		data : {
			fromdate : fromdate,
			todate : todate,
			place : place,
			jobdescription : jobdescription,
			id : id
		},
		success : function(msg) {
			if (true) {
				alert("添加成功！");
			}

		}
	});
}
function experienceMoreHandler() {
	var fromdate = $("input[name='fromEx']").val();
	var todate = $("input[name='toEx']").val();
	var place = $("input[name='place']").val();
	var jobdescription = $("input[name='jobdescription']").val();
	var id = $("#id").val();

	$("#experienceTable").prepend(
			"<tr class='info'> <td>" + fromdate + "</td> <td>" + todate
					+ "</td> <td>" + place + "</td><td>" + jobdescription
					+ "</td></tr>");

	$("input[name='fromEx']").val("");
	$("input[name='toEx']").val("");
	$("input[name='place']").val("");
	$("input[name='jobdescription']").val("");

	$.ajax({
		type : "post",
		dataType : "json",
		url : "addExperience.action",
		data : {
			fromdate : fromdate,
			todate : todate,
			place : place,
			jobdescription : jobdescription,
			id : id
		},
		success : function(msg) {
			if (true) {
				alert("添加成功！");
			}

		}
	});
}

function insertBasicInfo(){
	
	alert("insertBasicInfo") ;
	
	var email = $("input[name='email']").val();
	var gender = $("input[name='gender']").val();
	var realname = $("input[name='realname']").val();
	var mobile = $("input[name='mobile']").val();
	var realId = $("input[name='realId']").val();
	var country = $("#locationSelect").val();
	var province = $("input[name='province']").val();
	var city = $("input[name='city']").val();
	var field = $("input[name='field']").val();
	var addition = $("textarea[name='addition']").val();
	
	var id = $("#id").val();
	
	alert("value") ;

	$("#basicInfo .form-group").remove();
	$("#insertInfo").append(
			 "<div class='row'><div class='col-sm-1 col-md-offset-3'>Email:</div>"
			+"<div class='col-sm-2'>"+email+"</div></div>"
			+"<div class='row'><div class='col-sm-1 col-md-offset-3'>Gender:</div>"
			+"<div class='col-sm-2'>"+gender+"</div></div>"	
			+"<div class='row'><div class='col-sm-1 col-md-offset-3'>RealName:</div>"
			+"<div class='col-sm-2'>"+realname+"</div></div>"	
			+"<div class='row'><div class='col-sm-1 col-md-offset-3'>Mobile:</div>"
			+"<div class='col-sm-2'>"+mobile+"</div></div>"	
			+"<div class='row'><div class='col-sm-1 col-md-offset-3'>CityID:</div>"
			+"<div class='col-sm-2'>"+realId+"</div></div>"	
			+"<div class='row'><div class='col-sm-1 col-md-offset-3'>Location:</div>"
			+"<div class='col-sm-2'>"+country+" "+province+" "+city+"</div></div>"
			+"<div class='row'><div class='col-sm-1 col-md-offset-3'>Fields:</div>"
			+"<div class='col-sm-2'>"+field+"</div></div>"
			+"<div class='row'><div class='col-sm-1 col-md-offset-3'>Addition:</div>"
			+"<div class='col-sm-2'>"+addition+"</div></div>"
			);

	$.ajax({
		type : "post",
		dataType : "json",
		url : "insertBasicInfo.action",
		data : {
			email : email,
			gender : gender,
			realname : realname,
			mobile : mobile,
			realId : realId,
			country : country,
			province : province,
			city : city,
			field : field,
			addition : addition,
			id : id
		},
		success : function(msg) {
			if (true) {
				alert("添加成功！");
			}

		}
	});
}