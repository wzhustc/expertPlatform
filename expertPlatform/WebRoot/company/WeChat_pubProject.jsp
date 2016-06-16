<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			$(".inputbtn").attr("readonly","readonly");
			$(".inputbtn").css("color","#9E9E9E");                     
		});
		$(document).on("pageshow","#companyinformation",function(){
			$("#edit").on("tap",function(){
    			$("#saveinformation").show();
				$(".inputbtn").removeAttr("readonly");
				$(".inputbtn").css("color","#000");
  			});                       
		});
	</script>
    <title>专家汇</title>
</head>
<body>
	<div data-role="page" id="publicprojectpage">
    	<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header3">
        	<a href="WeChat_switchPage.action?page=companyPageOne" rel="external" class="ui-btn ui-shadow ui-corner-all ui-icon-back ui-btn-icon-notext">返回</a>
    		<p>发布新项目</p>
  		</div>
  		<div style="color:#F30; text-align:center">
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
            	<form method="post" action="WeChat_pubProject.action">
                	<li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for="proName"><b>项目名称</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="text" name="proName" placeholder="请填写项目名称">
      						</div>
    					</div>  
                	</li>
                    <li>
                    	<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>项目内容</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="proContent" placeholder="请填写项目内容"></textarea>
      						</div>
    					</div>
                    </li>
                    <li>
                    	<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>项目流程</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="proProcess" placeholder="请填写项目流程"></textarea>
      						</div>
    					</div>
                    </li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>项目预算</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="tel" name="proBudge" placeholder="请填写项目预算">
      						</div>
    					</div>  
                	</li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>截止日期</b></label>
      						</div>
      						<div class="ui-block-b">
        						<input type="date" name="deadLine" placeholder="点击弹出日期选项">
      						</div>
    					</div>  
                	</li>
                	<li>
                    	<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>项目周期</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="projectCircle" placeholder="请填写项目周期"></textarea>
      						</div>
    					</div>
                    </li>
                    <li>
                		<div class="ui-grid-a">
      						<div class="ui-block-a">
        						<label for=""><b>备注</b></label>
      						</div>
      						<div class="ui-block-b">
        						<textarea name="proAddition" placeholder="请填写项目备注"></textarea>
      						</div>
    					</div>  
                	</li>
                    <div class="publicbtn"><input type="submit" value="保存并发布"></div>
            	</form>
    		</ul>
        </div>
    </div>
</body>
</html>