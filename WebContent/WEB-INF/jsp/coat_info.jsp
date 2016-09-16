<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="theme/1/css/front/styles.css">
	
	<script type="text/javascript">
		var count;  // 购买数量
		var amount; // 库存
		
		// 商品数量减少控件
		function sub() {
			count = document.getElementsByName("count")[0].value;
			
			if(parseInt(count) > 1) {
				count --;
				document.getElementsByName("count")[0].value = count;
			}
		}
		
		// 商品数量增加控件
		function add() {
			amount = document.getElementsByName("amount")[0].value;		
			count = document.getElementsByName("count")[0].value; //返回的是String类型
			
			if(parseInt(count) < parseInt(amount)) {
				count ++;
				document.getElementsByName("count")[0].value = count;
			}
		}
		
		// 限制用户输入的商品数量
		function limit() {
			var amount = document.getElementsByName("amount")[0].value;
			count = document.getElementsByName("count")[0].value; //返回的是String类型
			
			if(parseInt(count) <= 0) {
				document.getElementsByName("count")[0].value = 1;
			}
			else if(parseInt(count) > parseInt(amount)) {
				alert("当前库存：" + amount);
				document.getElementsByName("count")[0].value = amount;
			}
		}
		
		// 提交订单前，检查用户是否登录
		function checkLogin() {
			alert("提交订单前，请您先登录！");
			window.location.href = "toLogin.action";
		}
		
		/*
		function gainSize_Amount() {
			var name = document.getElementsByName('name')[0].value;
			var count = document.getElementById("count").value;
			var size = document.getElementsByName('size');
            for (var i = 0; i < size.length; i++) {
                if (size[i].checked == true) {
                	var size = size[i].value;
                }
            }
			
			window.location.href = "toPay.action?name=name&size=size&count=count";
		}
		*/
		
	</script>
	
  </head>
  
  <body>  
  	<div id="navigate">
  		<ul>
  			<li id="li"><a id="navigate_item" style="margin-top:10px; color:white; font-weight:bold;" href="toIndex.action">首页</a></li>
  		</ul>
  	</div>
    <div id="goodsInfo">
    	<table cellpadding="0" cellspacing="30">
    		<tr>
    			<c:forEach var="g" items="${goodsList }" varStatus="status">
	    			<td id="tdNoborder" style="vertical-align:top;">
	    				<c:if test="${status.count == 1}">
		    				<img src="theme/1/images/front/coat_0<fmt:formatNumber type="number" value="${g.id/4 + 1 }" maxFractionDigits="0"/>.jpg" width="414px" height="460px">
			    		</c:if>
	    			</td>
    				<td id="tdNoborder" style="vertical-align:top;">
    					<c:if test="${status.count == 1}">
		    				<div style="background-color:gainsboro; height:80px; color:#970102; font-size:29px; font-weight:bold;">
		    					<font size="2px" color="gray" style="font-weight:bold;">价格：</font>
		    					<font size="5px" style="margin-left:160px;">￥</font>${g.price }
		    				</div>
	    				</c:if>
	    				<div style="margin-top:130px;">
	    					<!-- onsubmit="limit();"防止用户输入后直接回车提交 -->
	    					<form id="form" name="form1" action="toPay.action" method="post" onsubmit="limit();"> 
	    						<!-- 隐藏域，提交处(如:struts)获取商品name 或  便于js中获取商品name -->
	    						<input name="name" type="hidden" value="${g.name }"/> 
	    						<input name="amount" type="hidden" value=" ${g.amount }"/> 
	    						<c:if test="${status.count == 1}">
				    				<font size="2px" color="gray" style="font-weight:bold;">尺码：&nbsp;</font>
					    				<input name="size" type="radio" value="S" checked>165/84A/S&nbsp;
					    				<input name="size" type="radio" value="M">170/92A/M&nbsp;
					    				<input name="size" type="radio" value="L">175/100A/L&nbsp;
					    				<input name="size" type="radio" value="XL">180/108B/XL&nbsp;<br><br><br>
					    		</c:if>
					    		<c:if test="${'S' == g.size}">
				    				<font size="2px" color="gray" style="font-weight:bold;">数量：&nbsp;&nbsp;</font>
				    				<input type="button" value="-" onclick="sub();" style="height:26px; width:24px;">
			    					<input id="count" name="count" type="text" value="1" size="3"  onblur="limit();" style="text-align:center; height:26px; width:40px;">
			    					<input type="button" value="+" onclick="add();" style="height:26px; width:24px;">
			    					<font size="2px" color="gray">&nbsp;件（库存剩余 ${g.amount }件）</font><br><br><br><br><br>
			    				</c:if>
			    				<%-- 
			    				<c:if test="${'M' == g.size}">
				    				<font size="2px" color="gray" style="font-weight:bold;">数量&nbsp;&nbsp;&nbsp;</font>
			    					<input id="amount" name="amount" type="text" size="3" style="height:26px;"><font size="2px" color="gray">&nbsp;件（库存剩余 ${g.amount }件）</font><br><br><br><br>
			    				</c:if>
			    				<c:if test="${'L' == g.size}">
				    				<font size="2px" color="gray" style="font-weight:bold;">数量&nbsp;&nbsp;&nbsp;</font>
			    					<input id="amount" name="amount" type="text" size="3" style="height:26px;"><font size="2px" color="gray">&nbsp;件（库存剩余 ${g.amount }件）</font><br><br><br><br>
			    				</c:if>
			    				<c:if test="${'XL' == g.size}">
				    				<font size="2px" color="gray" style="font-weight:bold;">数量&nbsp;&nbsp;&nbsp;</font>
			    					<input id="amount" name="amount" type="text" size="3" style="height:26px;"><font size="2px" color="gray">&nbsp;件（库存剩余 ${g.amount }件）</font><br><br><br><br>
			    				</c:if> 
			    				--%>
			    				<c:if test="${status.count == 1}">
				    				<c:if test="${sessionScope.user != null }">
				    					<input name="buy" type="submit" value="立即购买" id="buyButton">
				    				</c:if>
				    				<c:if test="${sessionScope.user == null }">
				    					<input name="buy" type="button" value="立即购买" id="buyButton" onClick="checkLogin();">
				    				</c:if>
			    				</c:if>
			    			</form>
		    			</div>
    				</td>
    			</c:forEach>
    		</tr>
    	</table>
    </div>
  </body>
</html>
