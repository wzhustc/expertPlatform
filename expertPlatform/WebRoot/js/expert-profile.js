/**
 * Created by chengshuo on 2016/3/19.
 */

/**
 * education 的 edit 响应
 */
function educationEdit() {
	var editBtn = $("#eduEditButton");
	var editBtnTxt = editBtn.text();
	
	if (editBtnTxt == "edit model") {
		$("#educationTable thead tr td:last").append("action");
		$("#educationTable tbody tr").find("td:eq(4)")
				.append("<button type='button' class='btn btn-default btn-xs' onclick='educationRowEdit(this)' data-toggle='modal' data-target='#eduModal'>edit</button>"
						);
		editBtn.text("cancel edit");
	}else{
	
		$("#educationTable thead tr td:last").html("");
		$("#educationTable tbody tr").find("td:eq(4)").html("");
		editBtn.text("edit model");
	}
}

function educationRowEdit(obj){
	var tr = $(obj).parent().parent() ;
	var eduId = tr.find("td:eq(0)").find("input").val();
	var nowFromEdu = tr.find("td:eq(0)").text().trim();
	var nowToEdu = tr.find("td:eq(1)").text().trim();
	var school = tr.find("td:eq(2)").text();
	var degree = tr.find("td:eq(3)").text();
	
	
	nowFromEdu = dateForm(nowFromEdu) ;
	nowToEdu = dateForm(nowToEdu) ;
	
	$("#fromEdu").val(nowFromEdu);
	$("#toEdu").val(nowToEdu);
	$("#school").val(school);
	$("#degree").val(degree);
	$("#modifyId").val(eduId);
	
}

function saveEduChange(){
	var fromEdu = $("#fromEdu").val() ;
	var toEdu = $("#toEdu").val() ;
	var school = $("#school").val() ;
	var degree = $("#degree").val() ;
	var id = $("#modifyId").val();
	
	$.ajax({
		type : "post",
		dataType : "json",
		url : "saveEduChange.action",
		data : {
			fromdate : fromEdu,
			todate : toEdu,
			school : school,
			degree : degree,
			id : id
		},
		success : function(msg) {
			if (msg=="success") {
				parent.location.reload();
			}

		}
	});
}

function eduDelete(){
	var id = $("#modifyId").val();
	$.ajax({
		type : "post",
		dataType : "json",
		url : "deleteEduById.action",
		data : {
			id : id
		},
		success : function(msg) {
			if (msg=="success") {
				parent.location.reload();
			}

		}
	});
}

//该方法用于 将 2012-2-2日的格式 转换为 2012-02-02的格式，用于在html中的日期控件中显示；
function dateForm(paraDate){
	var arr=new Array(); 
	arr = paraDate.split("-") ;
	if(arr[1].length==1){
		arr[1] = "0"+arr[1] ;
	}
	if(arr[2].length==1){
		arr[2] = "0"+arr[2] ;
	}
	paraDate =arr[0]+"-"+arr[1]+"-"+arr[2] ;
	return paraDate;
}


/**
 * experience 的 edit 响应
 */

function experienceEdit() {
	var editBtn = $("#expEditButton");
	var editBtnTxt = editBtn.text();
	
	if (editBtnTxt == "edit model") {
		$("#experienceTable thead tr td:last").append("action");
		$("#experienceTable tbody tr").find("td:eq(4)")
				.append("<button type='button' class='btn btn-default btn-xs' onclick='experienceRowEdit(this)'  data-toggle='modal' data-target='#expModal'>edit</button>"
						);
		editBtn.text("cancel edit");
	}else{
		$("#experienceTable thead tr td:last").html("");
		$("#experienceTable tbody tr").find("td:eq(4)").html("");
		editBtn.text("edit model");
	}
}
function experienceRowEdit(obj){
	var tr = $(obj).parent().parent() ;
	var expId = tr.find("td:eq(0)").find("input").val();
	var nowFromExp = tr.find("td:eq(0)").text().trim();
	var nowToExp = tr.find("td:eq(1)").text().trim();
	var place = tr.find("td:eq(2)").text();
	var jobDescription = tr.find("td:eq(3)").text();
	
	nowFromExp = dateForm(nowFromExp) ;
	nowToExp = dateForm(nowToExp) ;
	
	$("#fromExp").val(nowFromExp);
	$("#toExp").val(nowToExp);
	$("#place").val(place);
	$("#jobDescription").val(jobDescription);
	$("#modifyExpId").val(expId);
	
}

function saveExpChange(){
	var fromExp = $("#fromExp").val() ;
	var toExp = $("#toExp").val() ;
	var place = $("#place").val() ;
	var jobDescription = $("#jobDescription").val() ;
	var id = $("#modifyExpId").val();
	
	$.ajax({
		type : "post",
		dataType : "json",
		url : "saveExpChange.action",
		data : {
			fromdate : fromExp,
			todate : toExp,
			place : place,
			jobDescription : jobDescription,
			id : id
		},
		success : function(msg) {
			if (msg=="success") {
				parent.location.reload();
			}

		}
	});
}

function expDelete(){
	var id = $("#modifyExpId").val();
	$.ajax({
		type : "post",
		dataType : "json",
		url : "deleteExpById.action",
		data : {
			id : id
		},
		success : function(msg) {
			if (msg=="success") {
				parent.location.reload();
			}

		}
	});
}
/**
 * honor 的 edit 响应
 */

function honorEdit() {
	
	var editBtn = $("#honorEditButton");
	var editBtnTxt = editBtn.text();
	
	if (editBtnTxt == "edit model") {
		$("#honorTable thead tr td:last").append("action");
		$("#honorTable tbody tr").find("td:eq(3)")
				.append("<button type='button' class='btn btn-default btn-xs' onclick='honorRowEdit(this)'  data-toggle='modal' data-target='#honorModal'>edit</button>"
						);
		editBtn.text("cancel edit");
	}else{
		$("#honorTable thead tr td:last").html("");
		$("#honorTable tbody tr").find("td:eq(3)").html("");
		editBtn.text("edit model");
	}
}
function honorRowEdit(obj){
	var tr = $(obj).parent().parent() ;
	var honorId = tr.find("td:eq(0)").find("input").val();
	var honorDate = tr.find("td:eq(0)").text().trim();
	var honor = tr.find("td:eq(1)").text();
	var honorURL = tr.find("td:eq(2)").text();
	
	honorDate = dateForm(honorDate) ;
	
	$("#honorDate").val(honorDate);
	$("#honor").val(honor);
	$("#honorURL").val(honorURL);
	$("#modifyHonorId").val(honorId);
	
}

function saveHonorChange(){
	var honorDate = $("#honorDate").val() ;
	var honor = $("#honor").val() ;
	var honorURL = $("#honorURL").val() ;
	var id = $("#modifyHonorId").val();
	
	$.ajax({
		type : "post",
		dataType : "json",
		url : "saveHonorChange.action",
		data : {
			honorDate : honorDate,
			honor : honor,
			honorURL : honorURL,
			id : id
		},
		success : function(msg) {
			if (msg=="success") {
				parent.location.reload();
			}

		}
	});
}

function honorDelete(){
	var id = $("#modifyHonorId").val();
	$.ajax({
		type : "post",
		dataType : "json",
		url : "deleteHonorById.action",
		data : {
			id : id
		},
		success : function(msg) {
			if (msg=="success") {
				parent.location.reload();
			}

		}
	});
}