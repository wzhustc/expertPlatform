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
		$(document).on("pagebeforeshow","#expertinformation",function(){
  			$("#saveinformation").hide();
			$(".fixedbtn").attr("readonly","readonly");
			$(".inputbtn").attr("readonly","readonly");
			$(".inputselbtn").attr("disabled","disabled");
			$(".inputbtn").css("color","#9E9E9E");
			$(".fixedbtn").css("color","#9E9E9E");
			$(".inputselbtn").css("color","#9E9E9E");                     
		});
		$(document).on("pageshow","#expertinformation",function(){
			$("#edit").on("tap",function(){
    			$("#saveinformation").show();
				$(".inputbtn").removeAttr("readonly");
				$(".inputselbtn").removeAttr("disabled");
				$(".inputbtn").css("color","#000");
				$(".inputselbtn").css("color","#000");
  			});                       
		});
	</script>
    <title>专家汇</title>
</head>

<body>
<div data-role="page" id="pagethree">
  		<div data-role="header" data-position="fixed" data-fullscreen="false" data-tap-toggle="false" id="header1">
    		<p>项目邀请</p>
  		</div>
  		<div data-role="main" class="ui-content">
    		<ul data-role="listview" class="prolist released" data-filter="true" data-input="#myFilter">
      			<li data-icon="bullets" data-filtertext="构建高可用Linux服务器">
                    <a href="#projectdetailaccept" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">构建高可用Linux服务器</h2>
                        <p>项目内容：构造稳定的服务器，能够承载多用户量的访问</p>
                        <p>项目预算：￥20,000,000</p>
                        <p>发布日期：2016-1-20</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                    <div data-role="popup" id="myPopup5" data-overlay-theme="b" data-dismissible="false">
                    	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-icon-delete ui-btn-icon-notext ui-btn-left">关闭</a>
      					<ul data-role="listview" data-inset="true" style="min-width:250px">
        					<li data-role="list-divider"><b>选项</b></li>
                            <li class="redpop"><a href="#">接受邀请</a></li>
        					<li><a href="#relatecompany">联系企业</a></li>
    					</ul>
    				</div>
                </li>
                <li data-icon="bullets" data-filtertext="思科计划项目">
                    <a href="#" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">思科计划项目</h2>
                        <p>项目内容：预计在未来几年，思科将跃居世界排行老大</p>
                        <p>项目预算：￥3000,000,000</p>
                        <p>发布日期：2016-12-2</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                </li>
                <li data-icon="bullets" data-filtertext="阿里春节咻一咻项目">
                    <a href="#" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">阿里春节咻一咻项目</h2>
                        <p>项目内容：咻一咻，给阿里员工发年终奖</p>
                        <p>项目预算：￥2,000,000</p>
                        <p>发布日期：2016-12-1</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                </li>
                <li data-icon="bullets" data-filtertext="目标制定与计划执行">
                    <a href="#" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">目标制定与计划执行</h2>
                        <p>项目内容：能根据上级要求合理分解制定目标，设定可行性计划，并高效执行实战，结合工作实际举例，提供具体操作工具</p>
                        <p>项目预算：￥8,000</p>
                        <p>发布日期：2015-12-20</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
				</li>
                <li data-icon="bullets" data-filtertext="管理者工作表达提升">
                	<a href="#" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">管理者工作表达提升</h2>
                        <p>项目内容：管理技能</p>
                        <p>项目预算：￥8,000</p>
                        <p>发布日期：2016-12-2</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                </li>
                <li data-icon="bullets" data-filtertext="银行突发事件危机处理与演练">
                    <a href="#" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">银行突发事件危机处理与演练</h2>
                        <p>项目内容：有银行背景,时间11月3-5日三期</p>
                        <p>项目预算：￥100,000</p>
                        <p>发布日期：2016-12-1</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                </li>
                <li data-icon="bullets" data-filtertext="opl培训与实战">
                    <a href="#" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">opl培训与实战</h2>
                        <p>项目内容：急找11月18,19日两期《opl培训与实战》讲师！</p>
                        <p>项目预算：￥300,000</p>
                        <p>发布日期：2016-12-1</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                </li>
                <li data-icon="bullets" data-filtertext="讲当前时事政治的老师">
                	<a href="#" class="cell2" style="background-color:white">
                        <h2 style="margin-top:0px; color:#3388CC">讲当前时事政治的老师</h2>
                        <p>项目内容：讲当前时事政治的老师,课程时间:11月半天,最好江浙沪的老师,课程地点：杭州 请联系我！</p>
                        <p>项目预算：￥5,000</p>
                        <p>发布日期：2016-11-3</p>
                    </a>
                    <a href="#myPopup5" data-rel="popup" class="cell2" style="background-color:white">查看详情</a>
                </li>
                <p style="text-align:center; color:#3388CC"><a href="#" style="text-decoration:none">点击查看更多...</a></p>
    		</ul>
  		</div>
  		<div data-role="footer" data-position="fixed" data-fullscreen="false" data-tap-toggle="false">
    		<div data-role="navbar">
      			<ul>
        			<li><a href="WeChat_switchPage.action?page=expertPageOne" data-icon="grid" data-transition="none">项目</a></li>
        			<li><a href="WeChat_switchPage.action?page=expertPageTwo" data-icon="search" data-transition="none">搜索</a></li>
                    <li><a href="#" class="ui-btn-active ui-state-persist" data-icon="comment">消息</a></li>
        			<li><a href="WeChat_switchPage.action?page=expertPageFour" data-icon="user" data-transition="none">个人</a></li>
      			</ul>
    		</div>
  		</div>
	</div>
</body>
</html>