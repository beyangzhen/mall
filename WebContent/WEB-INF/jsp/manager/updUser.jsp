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
<hr><br/>
<form action="updUser.action" method="post" id="updUserForm">
	<input type="hidden" name="id" value="${user.id }"/>
	用户名称:<input type="text" name="username" value="${user.username }"/><br/><br/>
	用户密码:<input type="text" name="password" value="${user.password }"/><br/><br/>
	用户级别:<input type="text" name="level" value="${user.level }"/><font color="green" style="padding-left:10px;">温馨提示：M为管理员，A为钻石会员，B为黄金会员，C为大众会员</font><br/><br/>
	用户电话:<input type="text" name="phone" value="${user.phone }"/><br/><br/>
	用户地址:<input type="text" name="address" value="${user.address }"/><br/><br/>
	<input type="submit" style="background-color:#970102; width:110px; height:30px; color:white; font-size: 18px; font-weight:bold; margin-top:30px;" value="提交"/><br/>
</form>
