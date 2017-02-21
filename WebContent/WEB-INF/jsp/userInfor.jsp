<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
	<title>用户信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/1/css/front/styles.css">
	<link rel="icon" href="${pageContext.request.contextPath}/theme/1/images/icon/favicon.ico">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<style>
		th{
			background: lightblue;
			font-family: 微软雅黑;
			font-size: 14px;
		}
		td{
			text-align: center;
			font-family: 微软雅黑;
			font-size: 14px;
		}
	</style>
	<h1>用户信息</h1>
	<hr>
	<div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px; color:white; font-weight:bold;" href="${pageContext.request.contextPath}/toIndex.action">首页</a></li>
  		</ul>
  	</div>
	<table  border="1" style="width:100%; border-collapse:collapse; margin-top:10px" >
		<tr>
			<th>编号</th>
			<th>名称</th>
			<th>密码</th>
			<th>级别</th>
			<th>当前积分</th>
			<th>电话</th>
			<th>地址</th>
			<th>账户金额</th>
		</tr>
		<tr>
			<td>${user.id }</td>
			<td class="baseUI"><a href="toUserInfor.action?username=${sessionScope.user.username }">${user.username }</a></td>
			<td>${user.password }</td>
			<td>
				<c:if test="${user.level == 'M'}">管理员(M)</c:if>
				<c:if test="${user.level == 'A'}">钻石会员(A)</c:if>
				<c:if test="${user.level == 'B'}">黄金会员(B)</c:if>
				<c:if test="${user.level == 'C'}">大众会员(C)</c:if>
			</td>
			<td>
				<c:if test="${user.level == 'M'}">---</c:if>
				<c:if test="${user.level != 'M'}">${user.score }</c:if>
			</td>
			<td>${user.phone }</td>
			<td>${user.address }</td>
			<td>
				￥<fmt:formatNumber type="number" value="${user.account }" maxFractionDigits="2" minFractionDigits="2"/>
				<a href="javascript:void(0);" val="${user.id }" style="color:red; padding-left:8px;" class="rechar">充值</a>
			</td>
		</tr>
	</table>
	<!-- 账户充值页面 -->
	<div class="recharge" style="padding:30px">
			
	</div>
	<script>
		// jquery 入口
		$(function() { 
			$(".rechar").off();
			$(".rechar").on("click", function(){
				var id = $(this).attr("val");
				$(".recharge").load("${pageContext.request.contextPath}/manager/toRechargeUser.action", {id:id})
			});
			
		});
	
	</script>
