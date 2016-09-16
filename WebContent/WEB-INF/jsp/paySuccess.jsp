<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="theme/1/css/front/styles.css">
	
	<script type="text/javascript">
		var name;
	
		window.onload=function() { //用window的onload事件，窗体加载完毕的时候
			name = document.getElementsByName('name')[0].value;
			var money = document.getElementById('money').value;
			alert("您将支付一笔金额：￥" + money);
		};	
	
		function toGoodsInfo() {
			window.location.href = "toGoods.action?name=" + name;
		}
	</script>

  </head>
  
  <body>
   	 <h1>恭喜您，支付成功！</h1>
   	 <input name ="name" type="hidden" value="${goods.name }">
   	 <input id ="money" type="hidden" value="${money }">
  	 <input id="confirmButton" type="button" value="确定" onClick="toGoodsInfo()">
  </body>
</html>
