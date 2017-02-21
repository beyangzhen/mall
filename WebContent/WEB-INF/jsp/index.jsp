<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物商城</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/1/css/front/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/1/css/front/styles.css">

<link rel="icon" href="${pageContext.request.contextPath}/theme/1/images/icon/favicon.ico">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>

</head>

<body>
<div id="main">
    <%-- <%@ include file="header.jsp"%> --%>
    <jsp:include page="header.jsp"/>
    
    <!-- 内容栏 -->
	<div id="content" style="x-index:1;">
		<div style="font-weight: bold; margin-top:15px;"><font size="4px">特色市场&nbsp;</font><font size="5px" color="lightgray">FEATURED CHANNEL</font></div>
			<a href="${pageContext.request.contextPath}/toGoods.action?name=外套01"><span style="background-color:white;"><img src="theme/1/images/front/coat_01.jpg" style="width:200px; height:220px;"></span></a>
			<a href="toIndex.action"><span style="background-color:white;"><img src="theme/1/images/front/t-shirt_1.jpg" style="width:200px; height:220px;"></span></a>
			<a href="toIndex.action"><span style="background-color:white;"><img src="theme/1/images/front/shoe_1.jpg" style="width:200px; height:220px;"></span></a>
			<a href="toIndex.action"><span style="background-color:white;"><img src="theme/1/images/front/bag_1.jpg" style="width:200px; height:220px;"></span></a>
			<a href="toIndex.action"><span style="background-color:white;"><img src="theme/1/images/front/computer_1.jpg" style="width:200px; height:220px;"></span></a>
			<a href="toIndex.action"><span style="background-color:white;"><img src="theme/1/images/front/foodstuff_1.jpg" style="width:200px; height:220px;"></span></a>
		<div style="font-weight: bold; margin-top:15px;"><font size="4px">热门品牌&nbsp;</font><font size="5px" color="lightgray">HOT BRAND</font></div>
			<div style="background-color:white;">
				<a href="toIndex.action"><img src="theme/1/images/front/UNIQLO.jpg" style="width:150px; height:80px;"></a>
				<a href="toIndex.action"><img src="theme/1/images/front/NB.jpg" style="width:150px; height:80px;"></a>
				<a href="toIndex.action"><img src="theme/1/images/front/NIKE.jpg" style="width:150px; height:80px;"></a>
				<a href="toIndex.action"><img src="theme/1/images/front/ADIDAS.jpg" style="width:150px; height:80px;"></a>
				<a href="toIndex.action"><img src="theme/1/images/front/APPLE.jpg" style="width:150px; height:80px;"></a>
				<a href="toIndex.action"><img src="theme/1/images/front/SAMSUNG.jpg" style="width:150px; height:80px;"></a>
				<a href="toIndex.action"><img src="theme/1/images/front/Microsoft.jpg" style="width:150px; height:80px;"></a>
			</div>
		<div style="font-weight: bold; margin-top:15px;"><font size="4px">热门市场&nbsp;</font><font size="5px" color="lightgray">HOT CHANNEL</font></div>
 			<div style="background-color:white; height: 100px;">
 			</div>
 	</div>
 	
    <div class="link">
   		<div class="linelink">
    		<span>友情链接：</span><a href="javascript:void(0)">天猫</a><a href="javascript:void(0)">百度</a><a href="javascript:void(0)">腾讯</a><a href="javascript:void(0)">江西理工大学</a>
        </div>
    </div>
    <div class="footer">
    	<div class="foot">
        	<p>江西理工大学 技术支持：<a href="javascript:void(0)">江西理工大学</a>电话：187xxxxxxxx</p>
        </div>
    </div>
</div>
</body>
</html>
