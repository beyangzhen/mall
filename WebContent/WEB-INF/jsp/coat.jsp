<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="theme/1/css/front/styles.css">


  </head>

  <body>
  	
    <div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px; color:white; font-weight:bold;" href="toIndex.action">首页</a></li>
  		</ul>
  	</div>
  	<c:forEach var="g" items="${goodsList }" varStatus="status">
  		<div id="goods">
	  		<c:if test="${g.type == '外套'}">
	  			<c:if test="${g.id%4 == 1}">
				  	<div style="float: left; margin: 28px;">
				  		<a href="toGoods.action?name=${g.name }">
				  			<img src="theme/1/images/front/coat_0<fmt:formatNumber type="number" value="${g.id/4 + 1 }" maxFractionDigits="0"/>.jpg" width="220px" height="255px" style="border:2px solid lightgray;">
				  		</a>
				  		<div id="price" style="width:208px; margin-top:10px;"><font size="2px">￥</font>${g.price }</div>
				  	</div>
				</c:if>
			</c:if>
		</div>
  	</c:forEach>
  </body>
</html>
