<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery  jquery.form 异步提交 -->
<script>
$(function(){
	var form = $("#updUserForm");
	form.off();
	form.on("submit",function(){
		form.ajaxSubmit(function(){
			alert("修改成功！");
			// 修改完成后，自动跳转回用户管理页面（模拟点击）
			$(".baseUI li :contains('用户管理')").trigger("click");
		});
		
		return false;
	});
});

</script>
<h1>修改用户页面</h1>
<hr>
<form action="updUser.action" method="post" id="updUserForm">
	<input type="hidden" name="id" value="${user.id }"/>
	用户名称:<input type="text" name="username" value="${user.username }"/><br/>
	用户密码:<input type="text" name="password" value="${user.password }"/><br/>
	用户级别:<input type="text" name="level" value="${user.level }"/><br/>
	用户电话:<input type="text" name="phone" value="${user.phone }"/><br/>
	用户地址:<input type="text" name="address" value="${user.address }"/><br/>
	<input type="submit" value="提交"/><br/>
</form>
