<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="top">  
	<div class="topbg">
		<div class="logo_sign">
			<div class="logo"></div>  
			<div class="sign">
				<c:if test="${sessionScope.user.level == 'M' }">
					<span>欢迎您，<a href="javascript:void(0);" val="${sessionScope.user.username }" class="infor">${sessionScope.user.username }</a> 【管理员】</span>
					<span class="sp_home"><a href="toIndex.action">首页</a></span>
					<span class="sp_backstage"><a href="manager/toIndex.action">后台管理</a></span>
					<span class="sp_signout"><a href="cancel.action">注销</a></span>
				</c:if>
				<c:if test="${sessionScope.user.level == 'C' }">
					<span>欢迎您，<a href="javascript:void(0);" val="${sessionScope.user.username }" class="infor">${sessionScope.user.username }</a> 【顾客】</span>
					<span class="sp_home"><a href="toIndex.action">首页</a></span>
					<span class="sp_signout"><a href="cancel.action">注销</a></span>
				</c:if>
				<c:if test="${sessionScope.user == null }">
					<span class="sp_home"><a href="toIndex.action">首页</a></span>
					<span class="sp_home"><a href="toLogin.action">您好，请登录</a></span>
				</c:if>
			</div>
		</div>
		<div class="nav">
			<ul class="navUI">
				<li><a href="toIndex.action">首页</a></li>
				<c:forEach items="${categoryList }" var="c">
					<li><a href="toList.action">${c.name }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<script>
	$(function() {
		$(".infor").off();
		$(".infor").on("click", function() {
			var username = $(this).attr("val");
			$.post("toUserInfor.action", {username:username}, function() {

			});
		});
	});
</script>