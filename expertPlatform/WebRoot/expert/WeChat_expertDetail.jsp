<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		$(document).on("pagebeforeshow","#expertinformation",function(){
  			$("#saveinformation").hide();
  			$("#expertId").hide();
			$(".fixedbtn").attr("readonly","readonly");
			$(".inputbtn").attr("readonly","readonly");
			$(".inputselbtn").attr("disabled","disabled");
			$(".inputbtn").css("color","#9E9E9E");
			$(".fixedbtn").css("color","#9E9E9E");
			$(".inputselbtn").css("color","#9E9E9E");                     
		});
		$(document).on("pageshow","#expertinformation",function(){
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
	<div data-role="page" id="expertinformation">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header3">
        	<a href="WeChat_switchPage.action?page=expertPageFour" rel="external" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext">返回</a>
    		<p>我的信息</p>
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
            	<form method="post" target="_top" action="WeChat_updateExpertInfo.action">
                	<div id="expertId"><input type="text" name="id" value="${expert.id}"></div>
                	<li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="realName"><b>真实姓名</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="realName" value="${expert.realname}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="realId"><b>身份证号</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="realId" value="${expert.realid}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                    <li>
                    	<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="gender"><b>性别</b></label>
      						</div>
      						<div class="ui-block-b special">
        						<select data-icon="false" name="gender" id="gender" data-native-menu="true" class="inputselbtn">
        							<option value="男" ${expert.gender == "男" ? "selected= 'selected'" : ""}>男</option>
         							<option value="女" ${expert.gender == "女" ? "selected= 'selected'" : ""}>女</option>
        						</select>
      						</div>
    					</div>
                    </li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="location"><b>所在地区</b></label>
      						</div>
      						<div class="ui-block-b special">
        						<select data-icon="false" name="location" data-native-menu="true" class="inputselbtn">
         							<option value="北京" ${expert.location == "北京" ? "selected= 'selected'" : ""}>北京</option>
         							<option value="上海" ${expert.location == "上海" ? "selected= 'selected'" : ""}>上海</option>
         							<option value="广州" ${expert.location == "广州" ? "selected= 'selected'" : ""}>广州</option>
         							<option value="深圳" ${expert.location == "深圳" ? "selected= 'selected'" : ""}>深圳</option>
         							<option value="杭州" ${expert.location == "杭州" ? "selected= 'selected'" : ""}>杭州</option>
         							<option value="南京" ${expert.location == "南京" ? "selected= 'selected'" : ""}>南京</option>
         							<option value="厦门" ${expert.location == "厦门" ? "selected= 'selected'" : ""}>厦门</option>
         							<option value="苏州" ${expert.location == "苏州" ? "selected= 'selected'" : ""}>苏州</option>
        						</select>
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="mobile"><b>手机号</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="tel" name="mobile" value="${expert.mobile}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="field"><b>擅长领域</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="field" value="${expert.field}" class="inputbtn">
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="glory"><b>获得荣誉</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="glory" class="inputbtn">${expert.glory}</textarea>
      						</div>
    					</div>  
                	</li>
                	<li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="gloryUrl"><b>荣誉链接</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="gloryUrl" class="inputbtn">${expert.gloryurl}</textarea>
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="addition"><b>个人简介</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="addition" class="inputbtn">${expert.addition}</textarea>
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