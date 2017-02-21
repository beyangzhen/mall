<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="top">  
	<div class="topbg">
		<div class="logo_sign">
			<div class="logo"></div>  
			<div class="sign">
				<c:if test="${sessionScope.user.level == 'M' }">
					<span>欢迎您，<a href="toUserInfor.action?username=${sessionScope.user.username }">${sessionScope.user.username }</a> 【管理员】</span>
					<span class="sp_home"><a href="toIndex.action">首页</a></span>
					<span class="sp_backstage"><a href="manager/toIndex.action">后台管理</a></span>
					<span class="sp_signout"><a href="cancel.action">注销</a></span>
				</c:if>
				<c:if test="${sessionScope.user.level == 'A' || sessionScope.user.level == 'B' || sessionScope.user.level == 'C' }">
					<span>欢迎您，<a href="toUserInfor.action?username=${sessionScope.user.username }">${sessionScope.user.username }</a> 【大众会员】</span>
					<span class="sp_home"><a href="toIndex.action">首页</a></span>
					<span class="sp_signout"><a href="cancel.action">注销</a></span>
				</c:if>
				<c:if test="${sessionScope.user == null }">
					<span class="sp_home"><a href="toIndex.action">首页</a></span>
					<span class="sp_home"><a href="toLogin.action">您好，请登录</a></span>
				</c:if>
			</div>
		</div>
		<div class="nav">
			<ul class="navUI">
				<li><a href="toIndex.action" style="text-decoration: none">首页</a></li>
				<c:forEach var="c" items="${categoryList }" varStatus="status">
				<%-- <li><a href="#">${c.name }</a></li> --%>
					
					<!-- 菜单栏 -->
					<li>	
				  		<table>
				  			<tr>
					  		 	<td style="vertical-align:top">
				  					<c:if test="${1 == status.count}">
					  		 	    	<!-- 菜单 -->
					  		 	    	<div onmouseover="showSubmenu('submenu1', 'menu1');" onmouseout="hideSubmenu('submenu1', 'menu1');">
					  	    				<div id="menu1" style="height:39px; text-align:center;"><a href="#" style="text-decoration: none">${c.name }</a></div>
					  	    				<!-- 子菜单 -->
					  	    				<div id="submenu1" style="background-color:gray; width:160px; x-index:2; position:absolute;"> 
					  	    				<!-- x-index和position是让隐藏菜单在其他div的正上方显示 -->							
												<ul style="padding:0px; margin:0px;"> <!-- 消除ul前面默认的空格(table,ul前默认都有空格) -->	
													<li><a form href="toGoodsList.action">外套</a></li>
													<li><a form href="#">毛衣</a></li>
													<li><a form href="#">T恤</a></li>
													<li><a form href="#">夹克</a></li>
													<li><a form href="#">羽绒服</a></li>
												</ul>
											</div>
						  				</div>
						  			</c:if>
					  			</td>
						  		<td style="vertical-align:top">
					  				<c:if test="${2 == status.count}">
						  				<div onmouseover="showSubmenu('submenu2', 'menu2');" onmouseout="hideSubmenu('submenu2', 'menu2');">
					  	    				<div id="menu2" style="height:39px; text-align:center;"><a href="#" style="text-decoration: none">${c.name }</a></div> 	
					  	    				<div id="submenu2" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
												<ul style="padding:0px; margin:0px;">
													<li><a form href="#">连衣裙</a></li>
													<li><a form href="#">毛针织</a></li>
													<li><a form href="#">风衣</a></li>
													<li><a form href="#">T恤</a></li>
													<li><a form href="#">卫衣</a></li>
												</ul>
											</div>    	
						  				</div>
						  			</c:if>
					  			</td>
						  		<td style="vertical-align:top">
						  			<c:if test="${3 == status.count}">
						  				<div onmouseover="showSubmenu('submenu3', 'menu3');" onmouseout="hideSubmenu('submenu3', 'menu3');">
					  	    				<div id="menu3" style="height:39px; text-align:center;"><a href="#" style="text-decoration: none">${c.name }</a></div>	
					  	    				<div id="submenu3" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
												<ul style="padding:0px; margin:0px;">
													<li><a form href="#">板鞋</a></li>
													<li><a form href="#">帆布鞋</a></li>
													<li><a form href="#">皮鞋</a></li>
													<li><a form href="#">懒人鞋</a></li>
													<li><a form href="#">马丁靴</a></li>
												</ul>
											</div>    	
						  				</div>
							  		</c:if>
								</td>
						  		<td style="vertical-align:top">
							  		<c:if test="${4 == status.count}">
						  				<div onmouseover="showSubmenu('submenu4', 'menu4');" onmouseout="hideSubmenu('submenu4', 'menu4');">
					  	    				<div id="menu4" style="height:39px; text-align:center;"><a href="#" style="text-decoration: none">${c.name }</a></div>
							  	    		<div id="submenu4" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
								  				<ul style="padding:0px; margin:0px;">
								  					<li><a form href="#">单肩包</a></li>
													<li><a form href="#">双肩包</a></li>
													<li><a form href="#">斜挎包</a></li>
													<li><a form href="#">手提包</a></li>
													<li><a form href="#">旅行箱</a></li>
								  				</ul>
							  				</div>
						  				</div>
							  		</c:if>
					  			</td>
					  			<td style="vertical-align:top">
							  		<c:if test="${5 == status.count}">
						  				<div onmouseover="showSubmenu('submenu5', 'menu5');" onmouseout="hideSubmenu('submenu5', 'menu5');">
								  	    	<div id="menu5" style="height:39px; text-align:center;"><a href="#" style="text-decoration: none">${c.name }</a></div>
									  	    <div id="submenu5" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
										  		<ul style="padding:0px; margin:0px;">
										  			<li><a form href="#">手机</a></li>
													<li><a form href="#">电脑</a></li>
													<li><a form href="#">相机</a></li>
													<li><a form href="#">蓝牙耳机</a></li>
													<li><a form href="#">U盘 </a></li>
										  		</ul>
									  		</div>
									  	</div>
							  		</c:if>
					  			</td>
					  			<td style="vertical-align:top">
							  		<c:if test="${6 == status.count}">
						  				<div onmouseover="showSubmenu('submenu6', 'menu6');" onmouseout="hideSubmenu('submenu6', 'menu6');">
								  	    	<div id="menu6" style="height:39px; text-align:center;"><a href="#" style="text-decoration: none">${c.name }</a></div>
									  	    <div id="submenu6" style="background-color:gray; width:160px; x-index:2; position:absolute;">			
										  		<ul style="padding:0px; margin:0px;">
										  			<li><a form href="#">坚果</a></li>
													<li><a form href="#">巧克力</a></li>
													<li><a form href="#">膨化食品</a></li>
													<li><a form href="#">牛肉干</a></li>
													<li><a form href="#">酸奶 </a></li>
										  		</ul>
									  		</div>
									  	</div>
							  		</c:if>
					  			</td>
					  		</tr>
					  	</table>  
				    </li>	
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<!-- <script>
	$(function() {
		$(".infor").off();
		$(".infor").on("click", function() {
			var username = $(this).attr("val");
			$.post("toUserInfor.action", {username:username}, function() {

			});
		});
	});
</script> -->

<script type="text/javascript">
	window.onload=function() //用window的onload事件，窗体加载完毕的时候
	{
	    var sm = document.getElementById("submenu1");
		sm.style.display = "none"; //页面打开时不显示 子菜单
		var sm = document.getElementById("submenu2");
		sm.style.display = "none"; //页面打开时不显示 子菜单
		var sm = document.getElementById("submenu3");
		sm.style.display = "none"; //页面打开时不显示 子菜单
		var sm = document.getElementById("submenu4");
		sm.style.display = "none"; //页面打开时不显示 子菜单
		var sm = document.getElementById("submenu5");
		sm.style.display = "none"; //页面打开时不显示 子菜单
		var sm = document.getElementById("submenu6");
		sm.style.display = "none"; //页面打开时不显示 子菜单
	};

	function showSubmenu(submenu, menu) {
		var sm = document.getElementById(submenu);
		sm.style.display = "block"; //显示子菜单
		var m = document.getElementById(menu);
		m.style.background = "gray"; //背景块变色
	}
	
	function hideSubmenu(submenu, menu) {
		var sm = document.getElementById(submenu);
		sm.style.display = "none"; //隐藏子菜单
		var m = document.getElementById(menu);
		m.style.background = "#B80F17"; //背景块变色
	}
</script>
