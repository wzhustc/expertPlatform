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
	<title>Messages_expertPlatform</title>
	 <script src="js/message.js"></script>
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
	<!-- messages unread -->
	<div class="section">
		<div class="container">
			<h3>Message UNREAD</h3>

			<div class="row">
				<form id="unReadTable" action="deleteMessages.action" method="post">
					<table class="table table-striped table-hover"
						id="massageUnreadTable">
						<thead>
							<tr>
								<th>#</th>
								<th>sender</th>
								<th colspan="2">content</th>
								<th>sendTime</th>
								<th>action</th>
								<th>select</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="unReadMessage" items="${unReadMessageList}">
								<tr>
									<td>#</td>
									<td>${unReadMessage.cId}</td>
									<td colspan="2">${unReadMessage.message}</td>
									<td><fmt:formatDate value="${unReadMessage.senddate}"
											dateStyle="medium" />
									</td>
									<td><a href="#">detail</a></td>
									<td><input name="select" type="checkbox" value="${unReadMessage.id}" /></td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</form>
			
		</div>
		<div class="row">
			<div class="col-lg-2 col-lg-offset-8">
				<button class="btn btn-default" onclick="deleteUnreadMessage()"
					id="deleteUnreadMessageBtn">delete</button>
			</div>
			<div class="col-lg-2">
				<button class="btn btn-default" onclick="setMessageRead()"
					id="setMessageReadBtn">set read</button>
			</div>
		</div>
	</div>
	</div>

	<!-- end messages unread -->
	<hr>
	<!-- history messages -->
	<div class="section">
		<div class="container">
			<h3>History Messages</h3>

			<div class="row">
				<form action="deleteMessages.action" method="post">
					<table class="table" id="historyMessageTable">
						<thead>
							<tr>
								<th>#</th>
								<th>sender</th>
								<th colspan="2">content</th>
								<th>sendTime</th>
								<th>action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="isReadMessage" items="${isReadMessageList}">
								<tr>
									<td># <input type="hidden" value="${isReadMessage.id}">
									</td>
									<td>${isReadMessage.cId}</td>
									<td colspan="2">${isReadMessage.message}</td>
									<td><fmt:formatDate value="${isReadMessage.senddate}"
											dateStyle="medium" />
									</td>
									<td><a href="#">detail</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
			<div class="row">
				<div class="col-lg-2 col-lg-offset-8">
					<button class="btn btn-default" onclick="deleteHistoryMessage()"
						id="deleteHistoryMessageBtn">delete messages</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Projects published -->

	<!-- Footer -->
	<%@include file="footer.jsp"%>



</body>
</html>