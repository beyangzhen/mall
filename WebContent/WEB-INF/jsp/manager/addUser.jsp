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
<hr><br/>
<form action="addUser.action" method="post" id="addUserForm">
	用户名称:<input type="text" name="username"/><br/><br/>
	用户密码:<input type="text" name="password"/><br/><br/>
	用户级别:<input type="text" name="level"/><font color="green" style="padding-left:10px;">温馨提示：M为管理员，A为钻石会员，B为黄金会员，C为大众会员</font><br/><br/>
	用户电话:<input type="text" name="phone"/><br/><br/>
	用户地址:<input type="text" name="address"/><br/><br/>
	<input type="submit" style="background-color:#970102; width:110px; height:30px; color:white; font-size: 18px; font-weight:bold; margin-top:30px;" value="添加"/><br/><br/>
</form>
