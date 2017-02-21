<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<h1>用户管理</h1>
<hr>
<table  border="1" style="width: 100%;border-collapse: collapse;margin-top: 10px" >
	<tr>
		<th>编号</th>
		<th>用户名称</th>
		<th>用户密码</th>
		<th>用户级别</th>
		<th>电话</th>
		<th>地址</th>
		<th>账户金额</th>
		<th>操作</th>
	</tr>
	<c:forEach items="${userList }" var="u">
	<tr>
		<td><input type="checkbox" value="${u.id }"/></td>
		<td>${u.username }</td>
		<td>${u.password }</td>
		<td>
			<c:if test="${u.level == 'M'}">管理员(M)</c:if>
			<c:if test="${u.level == 'A'}">钻石会员(A)</c:if>
			<c:if test="${u.level == 'B'}">黄金会员(B)</c:if>
			<c:if test="${u.level == 'C'}">大众会员(C)</c:if>
		</td>
		<td>${u.phone }</td>
		<td>${u.address }</td>
		<td>￥${u.account }</td>
		<td>
			<a href="javascript:void(0);" val="${u.id }" style="color:green;" class="upd">修改</a>
			<a href="javascript:void(0);" val="${u.id }" style="color:green;" class="del">删除</a>
			<a href="javascript:void(0);" val="${u.id }" style="color:red;" class="rechar">充值</a>
		</td>
	</tr>
	</c:forEach>
</table>
<script>
$(function(){
	$(".upd").off();
	$(".upd").on("click", function(){
		var id = $(this).attr("val");
		$(".right").load("toUpdUser.action", {id:id});
	});
	
	$(".del").off();
	$(".del").on("click", function(){
		var id = $(this).attr("val");
		var flag = confirm("确认删除吗？");
		if(flag) {
			$.post("delUser.action", {id:id}, function(){
				//模拟点击(删除后页面刷新)
				$(".baseUI li :contains('用户管理')").trigger("click");
			});
		}
	});
	
	$(".rechar").off();
	$(".rechar").on("click", function(){
		var id = $(this).attr("val");
		$(".right").load("toRechargeUser.action", {id:id});
	});
});
	
</script>
