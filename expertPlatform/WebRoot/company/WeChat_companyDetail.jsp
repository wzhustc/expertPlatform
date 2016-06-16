<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
                      + request.getServerPort() + path + "/";
%>  
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css">
    <link rel="stylesheet" href="css/mystyle.css">
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/jquery.mobile-1.4.5.min.js"></script>
    <script>
		$(document).on("pagecreate","#pageone",function(){
  			$("#searchMore").on("tap",function(){
    			$(this).hide();
				$("#hiddendiv").show();
  			});                       
		});
		$(document).on("pagebeforeshow","#companyinformation",function(){
  			$("#saveinformation").hide();
  			$("#companyId").hide();
  			$(".fixedbtn").attr("readonly","readonly");
			$(".inputbtn").attr("readonly","readonly");
			$(".inputselbtn").attr("disabled","disabled");
			$(".fixedbtn").css("color","#9E9E9E");
			$(".inputbtn").css("color","#9E9E9E"); 
			$(".inputselbtn").css("color","#9E9E9E");
		});
		$(document).on("pageshow","#companyinformation",function(){
			var a = 0;
			$("#edit").on("tap",function(){
				$("#msg").hide();
				a++;
				if (a % 2 == 1) {
    				$("#saveinformation").show();
					$(".inputbtn").removeAttr("readonly");
					$(".inputselbtn").removeAttr("disabled");
					$(".inputbtn").css("color","#000");
					$(".inputselbtn").css("color","#000");
				}
				else {
					$("#saveinformation").hide();
					$(".inputbtn").attr("readonly","readonly");
					$(".inputselbtn").attr("disabled","disabled");
					$(".inputbtn").css("color","#9E9E9E");
					$(".inputselbtn").css("color","#9E9E9E");
				}
  			});                       
		});
	</script>
    <title>专家汇</title>
</head>
<body>
	<div data-role="page" id="companyinformation">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header3">
        	<a href="WeChat_switchPage.action?page=companyPageFour" rel="external" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext">返回</a>
    		<p>企业信息</p>
            <a href="#" class="ui-btn ui-shadow ui-corner-all ui-icon-edit ui-btn-icon-notext" id="edit">编辑</a>
  		</div>
  		<div id="msg" style="color:#F30; text-align:center">
			<c:choose>
            	<c:when test="${not empty msg}">
                	<span>${msg}</span>
                </c:when>
                <c:otherwise>
            	</c:otherwise>
            </c:choose>
		</div>
        <div data-role="main" class="ui-content">
        	<ul data-role="listview">
            	<form method="post" target="_top" action="WeChat_updateCompanyInfo.action">
            		<div id="companyId"><input type="text" name="id" value="${company.id}"></div>
                	<li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="projectName"><b>企业名称</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="companyName" value="${company.companyname}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                    <li>
                    	<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>所属领域</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="field" value="${company.field}" class="inputbtn">
      						</div>
    					</div>
                    </li>
                	<li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>所在地区</b></label>
      						</div>
      						<div class="ui-block-b special">
        						<select data-icon="false" name="location" data-native-menu="true" class="inputselbtn">
         							<option value="北京" ${company.location == "北京" ? "selected= 'selected'" : ""}>北京</option>
         							<option value="上海" ${company.location == "上海" ? "selected= 'selected'" : ""}>上海</option>
         							<option value="广州" ${company.location == "广州" ? "selected= 'selected'" : ""}>广州</option>
         							<option value="深圳" ${company.location == "深圳" ? "selected= 'selected'" : ""}>深圳</option>
         							<option value="杭州" ${company.location == "杭州" ? "selected= 'selected'" : ""}>杭州</option>
         							<option value="南京" ${company.location == "南京" ? "selected= 'selected'" : ""}>南京</option>
         							<option value="厦门" ${company.location == "厦门" ? "selected= 'selected'" : ""}>厦门</option>
         							<option value="苏州" ${company.location == "苏州" ? "selected= 'selected'" : ""}>苏州</option>
        						</select>
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>企业工商号</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="companyid" value="${company.companyid}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                	<li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>真实姓名</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="realName" value="${company.realname}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>联系方式</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="tel" name="mobile" value="${company.mobile}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>企业简介</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="addition" class="inputbtn">${company.addition}</textarea>
      						</div>
    					</div>  
                	</li>
                    <div id="saveinformation" class="publicbtn"><input type="submit" value="保存修改"></div>
            	</form>
    		</ul>
        </div>
    </div>
</body>
</html>