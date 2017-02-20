<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery  jquery.form 异步提交 -->
<script>
$(function(){
	var form = $("#addUserForm");
	form.off();
	form.on("submit",function(){
		form.ajaxSubmit(function(){
			alert("添加成功！");
			form[0].reset(); //重置表单
			//$("#addUserForm input").not(":submit").val(""); //重置表单
		});

		return false; //阻止form的默认行为
	});
});

</script>
<h1>添加用户</h1>
<hr>
<form action="addUser.action" method="post" id="addUserForm">
	用户名称:<input type="text" name="username"/><br/>
	用户密码:<input type="text" name="password"/><br/>
	用户级别:<input type="text" name="level"/><br/>
	用户电话:<input type="text" name="phone"/><br/>
	用户地址:<input type="text" name="address"/><br/>
	<input type="submit" value="添加"/><br/>
</form>
