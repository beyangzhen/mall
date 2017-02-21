<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付</title>
    
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
	  	<div id="address">
	  		<font size="3px" style="font-weight:bold;">收货地址</font>
	  		<div style="margin-top:5px;"><font size="3px" color="gray">&nbsp;&nbsp;${sessionScope.user.address }</font></div>
	  	</div>
	  	<div id="order">
	  		<table cellpadding="3" cellspacing="1">
		    	<tr>
		    		<td><font size="2px" color="#970102" style="font-weight:bold;">订单信息</font></td>
		    	</tr>
		    	<tr>
		    		<td align="center" width="13%"><font size="2px" color="gray" style="font-weight:bold;">商品</font></td>
		    		<td align="center" width="13%"><font size="2px" color="gray" style="font-weight:bold;">尺码</font></td>
		    		<td align="center" width="13%"><font size="2px" color="gray" style="font-weight:bold;">单价</font></td>
		    		<td align="center" width="13%"><font size="2px" color="gray" style="font-weight:bold;">数量</font></td>
		    		<td align="center" width="13%"><font size="2px" color="gray" style="font-weight:bold;">会员级别</font></td>
		    		<td align="center" width="25%"><font size="2px" color="gray" style="font-weight:bold;">会员折扣</font></td>
		    		<td align="center" width="21%"><font size="2px" color="gray" style="font-weight:bold;">小计</font></td>
	    		</tr>
		    	<tr>
		    		<td align="center"><font size="2px" color="gray">${goods.name }</font></td>
		    		<td align="center"><font size="2px" color="gray">${size }</font></td>
		    		<td align="center"><font size="2px" color="gray">${goods.price }</font></td>
		    		<td align="center"><font size="2px" color="gray">${count }</font></td>
		    		<td align="center"><font size="2px" color="gray">${sessionScope.user.level }</font></td>
		    		<td align="center">
		    			<font size="2px" color="gray">
		    				<c:if test="${sessionScope.user.level == 'M' || sessionScope.user.level == 'A' }">
		    					0.85
		    				</c:if>
		    				<c:if test="${sessionScope.user.level == 'B' }">
		    					0.9
		    				</c:if>
		    				<c:if test="${sessionScope.user.level == 'C' }">
		    					1
		    				</c:if>
		    			</font>
		    		</td>
		    		<td align="center">
		    			<font size="2px" color="#970102" style="font-weight:bold;">
		    				${goods.price * count }*
		    				<c:if test="${sessionScope.user.level == 'M' || sessionScope.user.level == 'A' }">
		    					0.85
		    				</c:if>
		    				<c:if test="${sessionScope.user.level == 'B' }">
		    					0.9
		    				</c:if>
		    				<c:if test="${sessionScope.user.level == 'C' }">
		    					1
		    				</c:if>
		    				<c:if test="${sessionScope.user.level == 'M' || sessionScope.user.level == 'A' }">
		    					=<fmt:formatNumber type="number" value="${goods.price * count * 0.85 }" maxFractionDigits="2" minFractionDigits="2"/>
		    				</c:if>
		    				<c:if test="${sessionScope.user.level == 'B' }">
		    					=<fmt:formatNumber type="number" value="${goods.price * count * 0.9 }" maxFractionDigits="2" minFractionDigits="2"/>
		    				</c:if>
		    				<c:if test="${sessionScope.user.level == 'C' }">
		    					=<fmt:formatNumber type="number" value="${goods.price * count * 1 }" maxFractionDigits="2" minFractionDigits="2"/>
		    				</c:if>
		    			</font>
		    		</td>
		    	</tr>
	    	</table>
	    </div>
	    <div id="money">	
	    	<font size="5px" color="gray" style="font-weight:bold;">实付款：
		    	<font color="#970102">
		    		￥<c:if test="${sessionScope.user.level == 'M' || sessionScope.user.level == 'A' }">
		    			<fmt:formatNumber type="number" value="${goods.price * count * 0.85 }" maxFractionDigits="2" minFractionDigits="2"/>
    				 </c:if>
    				 <c:if test="${sessionScope.user.level == 'B' }">
    				 	<fmt:formatNumber type="number" value="${goods.price * count * 0.9 }" maxFractionDigits="2" minFractionDigits="2"/>
    				 </c:if>
    				 <c:if test="${sessionScope.user.level == 'C' }">
    					<fmt:formatNumber type="number" value="${goods.price * count * 1 }" maxFractionDigits="2" minFractionDigits="2"/>
    				 </c:if>
		    	</font>
	    	</font> 
		</div>  	
		<div style="text-align:center;">
			<c:if test="${sessionScope.user.level == 'M' || sessionScope.user.level == 'A' }">
				<form name="form1" action="pay.action?id=${goods.id }&size=${size }&count=${count }&money=${goods.price * count * 0.85 }" method="post">
			</c:if>
			<c:if test="${sessionScope.user.level == 'B' }">
				<form name="form1" action="pay.action?id=${goods.id }&size=${size }&count=${count }&money=${goods.price * count * 0.9 }" method="post">
			</c:if>
			<c:if test="${sessionScope.user.level == 'C' }">
				<form name="form1" action="pay.action?id=${goods.id }&size=${size }&count=${count }&money=${goods.price * count * 1 }" method="post">
			</c:if>
				<!-- 取出session中token存入表单中 -->
        		<input type="hidden" name="token" value="${token}"/>
				<input id="payButton" name="pay" type="submit" value="支付">
			</form>
		</div>
  </body>
</html>
