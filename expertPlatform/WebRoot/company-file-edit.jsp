<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
	<title>Company File Edit_expertPlatform</title>
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
        <h2>Company Profile Edit</h2>
		
        <form class="form-horizontal"  action="updateCompanyInfo.action" name="company" 
          role="form" method="post">
            <HR style="border-width:1px;" width="80%" color=#987cb9 SIZE=1>
			<input type="hidden" name="id" value="${user.id}">
            <h3>User Info</h3>
            <div class="form-group">
                <label for="inputUserName" class="col-sm-2 col-md-offset-1 control-label">User Name</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" value="${company.companyname}" disabled="disabled" 
                    placeholder="Username" >
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Real Name</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="realname" value="${company.realname}" 
                    placeholder="RealName">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Mobile</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="mobile" value="${company.mobile}" placeholder="Mobile">
                </div>
            </div>
           
            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">User Image</label>
                <c:if test="${company.image != null}">
                <img src="${company.iamge}"/>
                </c:if>
                <input class="col-sm-5" style="margin-top: 7px;" name="userimage" type="file">
            </div>

            <!--company info start-->
            <hr style="border: 1px dotted #808080">
            <h3>Company Info</h3>
            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Company Name</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="companyname" value="${company.companyname}" placeholder="Company Name">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Business Field</label>
                <div class="col-sm-5">
                    <select class="form-control" name="field">
                        <option selected>Business Field</option>
                        <option value="Internet">Internet</option>
                        <option value="Financial">Financial</option>
                        <option value="Chemicals">Chemicals</option>
                        <option value="Education">Education</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Government">Government</option>
                        <option value="Nonprofit">Nonprofit</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Location</label>
                <div class="col-sm-5">
                    <div class="col-sm-4">
                        <select class="form-control" name="country">
                            <option selected>Country</option>
                            <option>China</option>
                            <option>English</option>
                            <option>USA</option>
                            <option>Japan</option>
                            <option>Italy</option>
                            <option>Australia</option>
                            <option>Canada</option>
                        </select>

                    </div>
                    <div class="col-sm-4">
					<input type="text" class="form-control" name = "city" placeholder = "City">
                    </div>
                    <div class="col-sm-4">
					<input type="text" class="form-control" name= "street" placeholder = "Street">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Detail Address</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="location" value="${company.location}" placeholder="Detail Address">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Business License</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="companyid" value="${company.companyid}" placeholder="Business License">
                </div>
            </div>
           

            <div class="form-group">
                <label class="col-sm-2 col-md-offset-1 control-label">Company Logo</label>
                <input class="col-sm-5" style="margin-top: 7px;" type="file">
            </div>
            <!--company info end-->

            <!--Business Details-->
            <hr style="border: 1px dotted #808080">
            <div class="row">
                <p><h3>Business Details</h3>
                <h5>
                    <b>This information will be available to experts viewing your profile</b>
                </h5>
                </p>

                <div class="row">
                    <div class="col-sm-5 col-sm-offset-3">
                        <textarea name="addition" value="${company.addition}" class="form-control test-input" maxlength="2000" rows="5" cols="60" placeholder="Provide additional business details"></textarea>
                    </div>
                </div>

            </div>

            <hr style="border: 2px solid #808080">
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-10">
                    <button type="submit" class="btn btn-default col-sm-offset-1">Save Changes</button>
                    <button type="reset" class="btn btn-default col-sm-offset-1">Cancel Changes</button>
                </div>
            </div>
        </form>

    </div>
</div>

<!-- End profile -->

<!-- Footer -->
<%@include file="footer.jsp"%>

</body>
</html>