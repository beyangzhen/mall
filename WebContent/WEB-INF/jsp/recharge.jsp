<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="theme/1/css/front/styles.css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>   
    
<!-- jquery  jquery.form 异步提交 -->
<script>
$(function(){
	var form = $("#rechargeUserForm");
	form.off();
	form.on("submit",function(){
		form.ajaxSubmit(function(){
			alert("充值成功！");
			// 修改完成后，自动跳转回用户管理页面（模拟点击）
			$(".baseUI li :contains('用户管理')").trigger("click");
		});
		
		return false;
	});
});

</script>
<h1>账户充值</h1>
<hr><br/>
<form action="${pageContext.request.contextPath}/manager/rechargeUser.action" method="post" id="rechargeUserForm">
	<input type="hidden" name="id" value="${user.id }"/>
	<font size="5px" color="gray" style="font-weight:bold;">充值账户:<font color="#970102">${user.username }</font></font><br/>
	<font size="5px" color="gray" style="font-weight:bold;">充值金额:</font><input type="text" name="money" style="height:23px" /><br/>
	<input type="submit" style="background-color:#970102; width:110px; height:30px; color:white; font-size: 18px; font-weight:bold; margin-top:30px;" value="充值"/><br/>
</form>