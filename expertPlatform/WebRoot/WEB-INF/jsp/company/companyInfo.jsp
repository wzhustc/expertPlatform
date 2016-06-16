<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function search(){
	var companyId = document.getElementById("companyId").value;
	alert(companyId) ;
	window.location.href="selectCompanyById.action?companyId="+companyId; 
}

</script>
<body>
	<label>companyId:</label>
	<input type="text" name="companyId" id="companyId">
	<input type="button" value="search" onclick="search()"><br> 
    ${company.realname};<br>
    ${company.image};<br>
    ${company.mobile};<br>
    ${company.location};<br>
    ${company.companyname};<br>
    ${company.companyid};<br>
    ${company.companyimage};<br>
    ${company.field};<br>
    ${company.location};<br>
    ${company.addition};<br>
    ${company.account};<br>
    ${company.checked};
</body>
</html>