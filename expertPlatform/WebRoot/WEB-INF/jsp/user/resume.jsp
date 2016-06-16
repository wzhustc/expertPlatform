<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>resume</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<form action="resume.action">
	<table>
		<thead>
			<tr>expert submit</tr>
		</thead>
		<tbody>
			<tr>
				<td>username</td>
				<td><input type="text" value="${user.username}">
				</td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="text" value="${user.email}">
				</td>
			</tr>
			<tr>
				<td>realName</td>
				<td><input type="text" name="realName">
				</td>
			</tr>
			<tr>
				<td>gender</td>
				<td>男<input type="radio" name="gender" value="男"> 女<input
					type="radio" name="gender" value="女"></td>
			</tr>
			<tr>
				<td>image</td>
				<td><input type="file" name="image">
				</td>
			</tr>
			<tr>
				<td>mobile</td>
				<td><input type="text" name="mobile">
				</td>
			</tr>
			<tr>
				<td>realId</td>
				<td><input type="text" name="realId">
				</td>
			</tr>
			<tr>
				<td>idImage</td>
				<td><input type="image" name="idImage">
				</td>
			</tr>
			<tr>
				<td>location</td>
				<td>
				<select name="country">
						<option value="China">China</option>
						<option value="English">English</option>
						<option value="USA">USA</option>
				</select>
				
				<select name="province">
						<option value="江苏">江苏</option>
						<option value="北京">北京</option>
						<option value="安徽">安徽</option>
				</select>
				
				<select name="city">
						<option value="苏州">苏州</option>
						<option value="南京">南京</option>
						<option value="北京">北京</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>glory</td>
				<td><textarea name="glory"></textarea></td>
			</tr>
			<tr>
				<td>gloryUrl</td>
				<td><input type="text" name="glory"></td>
			</tr>
			<tr>
				<td>field</td>
				<td><input type="text" name="field"></td>
			</tr>
			<tr>
				<td>addition</td>
				<td><textarea name="addition"></textarea></td>
			</tr>
			<tr>
				<td>account</td>
				<td><input type="text" name="account"></td>
			</tr>
			<tr>
				<td>checked</td>
				<td><label name="checked">通过</label></td>
			</tr>
			<tr>
				<td><input type="submit" value="submit">
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>


		</tbody>


	</table>
	</form>
</body>
</html>
