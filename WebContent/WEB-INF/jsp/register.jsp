<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="theme/1/css/front/styles.css">
	
	<link rel="icon" href="theme/1/images/icon/favicon.ico">

	<script type="text/javascript">
	
	/* 运用了Ajax技术  */
		var req;
		
		function validate() {
			var idField = document.getElementById("userid"); //获取userid对应的input标签
			var url = "regValidate.jsp?id=" + escape(idField.value); //escape()是转码用的
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest(); //XMLHttpRequest是javascript对象
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			/* 处理该url页面 */
			req.open("GET", url, true); //建立该页面的请求
			req.onreadystatechange = callback; //监视请求状态改变
			req.send(null); //发送该页面的请求
		}
		
		function callback() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					//alert(req.responseText);
					//获取该请求页面处理后的"response对象中"msg标签
					//(如：response.getWrite().println("")的输出信息就会存入responseText中)
					var msg = req.responseXML.getElementsByTagName("msg")[0]; 
					//alert(msg);
			       	setMsg(msg.childNodes[0].nodeValue);
				}
			}
		}
		
		function setMsg(msg) {
			//alert(msg);
			mdiv = document.getElementById("usermsg"); //usermsg是div或span标签内的id属性值
			if(msg == "invalid") {
				mdiv.innerHTML = "<font color='red'>该用户名已存在！</font>";
			} else {
				mdiv.innerHTML = "<font color='green'>该用户名可以使用！</font>";
			}
		}
	</script>
	
	<script type="text/javascript">
		function check(form) {
			span = document.getElementById("pwdmsg"); //pwdmsg是div或span标签内的id属性值
			if(form.password.value == form.password2.value) {
				span.innerHTML = "<font color='green'>密码一致！</font>";
			} else {
				span.innerHTML = "<font color='red'>两次输入的密码不一样！</font>";
			}
		}
	</script>
	
  </head>
  
  <body style="background-image:url(theme/1/images/front/register_bg.jpg); background-repeat: no-repeat; background-position: center; height:620px;"> 
  	<div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px; color:white; font-weight:bold;" href="toIndex.action">首页</a></li>
  		</ul>
  	</div>
  	<div style="margin-top: 20px;">
  		<form name="register" method="post" action="register.action">
	  		<table align="center" cellpadding="4" cellspacing="1" width="45%">
		  		<tr>
		  			<!-- colspan是该列占两个列的位置  -->
		  			<td colspan="2" style="background-color:royalblue; font-weight:bold; color:white;">注册 - 必填内容</td>
		  		</tr>
		  		<tr>
		  			<td width="21%" style="background-color:#F3F6FA;">用户名</td>
		  			<td style="background-color:#F3F6FA;">
		  				<input id="userid" name="username" type="text" placeholder="请输入用户名" size="25" maxlength="25" onblur="validate()">
		  				<span id="usermsg"></span>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td style="background-color:#F3F6FA;">密&nbsp;码</td>
		  			<td style="background-color:#F3F6FA;">
		  				<input name="password" type="text" placeholder="请输入密码" size="25" maxlength="25">
		  			</td>
		  		</tr>
		  		<tr>
		  			<td style="background-color:#F3F6FA;">密码确认</td>
		  			<td style="background-color:#F3F6FA;">
		  				<input name="password2" type="text" placeholder="请再次输入密码" size="25" maxlength="25" onblur="check(register)">
		  				<span id="pwdmsg"></span>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td style="background-color:#F3F6FA;">电话</td>
		  			<td style="background-color:#F3F6FA;">
		  				<input name="phone" type="text" placeholder="请输入电话号码" size="25" maxlength="25">
		  			</td>
		  		</tr>
		  		<tr>
		  			<td valign="top" style="background-color:#F3F6FA;">送货地址</td>
		  			<td style="background-color:#F3F6FA"; color:#000000;">
		  				<textarea name="address" placeholder="请输入送货地址" cols="60" rows="5"></textarea>
		  			</td>
		  		</tr>
		  	</table><br>
		  	<center><input name="submit" type="submit" value="提&nbsp;交" id="registerButton"></center>	
  		</form>
  	</div>
  </body>
</html>
