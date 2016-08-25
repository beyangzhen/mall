 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- jquery  jquery.form 异步提交 -->
<script>
$(function(){
	var form = $("#addArticleForm");
	form.off();
	form.on("submit",function(){
		form.ajaxSubmit(function(){
			alert("添加成功！");
			form[0].reset(); //重置表单
			//$("#addArticleForm input").not(":submit").val(""); //重置表单
		});

		return false; //阻止form的默认行为
	});
});

</script>
<h1>信息发布</h1>
<hr>
<form action="addArticle.action" method="post" id="addArticleForm">
	信息标题：	<input type="text" name="title"/><br/>
	信息作者：	<input type="text" name="author"/><br/>
	所属栏目：	<select name="c_id">
				<option value="">-----请选择-----</option>
				<c:forEach items="${categoryList }" var="c">
					<option value="${c.id }">${c.name }</option>
				</c:forEach>
			</select><br/>
	信息内容：
			<textarea name="content" rows="5" cols="20"></textarea>
			<br/>
	<input type="submit" value="添加"/>
</form>
