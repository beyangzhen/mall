 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery  jquery.form 异步提交 -->
<script>
$(function(){
	var form = $("#addCategoryForm");
	form.off();
	form.on("submit",function(){
		form.ajaxSubmit(function(){
			alert("添加成功");
			form[0].reset(); //重置表单
			//$("#addUserForm input").not(":submit").val(""); //重置表单
		});
		
		return false; //阻止form的默认行为
	});
	
});
</script>
<h1>添加栏目</h1>
<hr>
<form action="addCategory.action" method="post" id="addCategoryForm">
	栏目名称:<input type="text" name="name"/><br/>
	栏目编号:<input type="text" name="code"/><br/>
	<input type="submit" value="添加"/><br/>
</form>
