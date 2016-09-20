<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上商城后台管理</title>
<link rel="stylesheet" type="text/css" href="../theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="../theme/1/css/style.css">
<link rel="stylesheet" type="text/css" href="../theme/1/css/table.css">
<link rel="stylesheet" type="text/css" href="../theme/1/css/icon.css">
<link rel="stylesheet" type="text/css" href="../theme/1/jquery-easyui-themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../theme/1/css/easyui-tabs.css">
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../theme/1/js/base.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$(".baseUI li").on("click",function(){
		var url = $(this).attr("url");
		$(".right").load(url);	// spa架构  	
	});
});
</script>

<body>
	<div class="main">
		<div id="top">
			<div class="top">
				<div class="t_logo"></div>
				<div class="t_sign">
					<span>您好，管理员【${sessionScope.user.username }】 </span><a href="../toIndex.action" class="t_exit">退出</a>
				</div>
			</div>
		</div>
		<div id="cont">
			<div class="centent">
				<div class="left">
					<ul class="baseUI">
						<li url="toAddCategory.action"><a href="#"><em class="base_basicset"></em><span>添加栏目</span></a></li>
						<li url="toCategoryManager.action"><a href="#"><em class="base_userset"></em><span>栏目管理</span></a></li>
						<br/>
						<li url="../toList.action"><a href="#"><em class="base_userset"></em><span>商品管理</span></a></li>
						<br/>
						<li url="toAddArticle.action"><a href="#"><em class="base_roll"></em><span>信息发布</span></a></li>
						<li url="toArticleManager.action"><a href="#"><em class="base_sys"></em><span>信息管理</span></a></li>
						<br/>
						<li url="toAddUser.action"><a href="#"><em class="base_basicset"></em><span>添加用户</span></a></li>
						<li url="toUserManager.action"><a href="#"><em class="base_userset"></em><span>用户管理</span></a></li>
					</ul>
				</div>
				<!-- 内容页面 -->
				<div class="right" style="padding:30px">
						
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div id="foot">
			<a href="#">江西理工大学</a>
		</div>
	</div>
</body>
</html>
