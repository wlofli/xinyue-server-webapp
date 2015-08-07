<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="header">
	<div class="h_bar">
		<div class="h_b_left">
			<h1>400-860-9280</h1>
			<span>（工作日：9:00-17:30）</span> <span> <a href="#" class="fx_xl"
				onmouseover="show('xlfx')" onmouseout="hid('xlfx')"></a> <img
				src="${ctx}/images/fx_xl.png" id="xlfx" style="z-index:999;"/>
			</span> <span> <a href="#" class="fx_wx" onmouseover="show('wxfx')"
				onmouseout="hid('wxfx')"></a> <img src="${ctx}/images/fx_wx.png"
				id="wxfx" style="z-index:999;"/>
			</span> <span> <a href="#" class="fx_qq" onmouseover="show('qqfx')"
				onmouseout="hid('qqfx')"></a> <img src="${ctx}/images/fx_qq.png"
				id="qqfx" style="z-index:999;"/>
			</span>
		</div>
		<div class="h_b_right">
			<c:choose>
				<c:when test="${empty sessionScope.session_member_info}">
					<ul class="menu">
						<li onmouseover="show('xdjl')" onmouseout="hid('xdjl')">
							<a href="#" class="xl">信贷经理</a>
							<ul id="xdjl" class="fnav">
								<li><a href="${ctx}/html_xindai/zhuce.html">入驻平台</a></li>
								<li><a href="${ctx}/html_xindai/login.html">登录平台</a></li>
							</ul>
						</li>
						<li class="hit" onmouseover="show('pthy')" onmouseout="hid('pthy')">
							<a href="#" class="xl">普通会员</a>
							<ul id="pthy" class="fnav">
								<li><a href="${ctx}/register/member">注册会员</a></li>
								<li><a href="${ctx}/login/member">登录平台</a></li>
							</ul>
						</li>
						<li><a href="#">新手指南</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="dlz">
						<li><span>您好，</span><a href="${ctx}/member/home">${sessionScope.session_member_info.loginName}</a><span>|</span></li>
						<li><a href="dkdd_hy.html">我的贷款订单</a><span>|</span></li>
						<li><a href="${ctx}/login/member">退出</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="clear"></div>
	</div>
	<div class="h_logo">
		<div class="h_l_left">
			<a href="#"><img src="${ctx}/images/logo.jpg" /></a>
		</div>
		<div class="h_l_right">
			<ul>
				<li class="hit"><a href="#">首页</a></li>
				<li><a href="#">贷款产品</a></li>
				<li><a href="#">融资机构</a></li>
				<li><a href="#">信贷经理</a></li>
				<li><a href="${ctx }/new/homelist">新闻资讯</a></li>
				<li><a href="#">帮助中心</a></li>
				<li><a href="#">问答中心</a></li>
				<li class="clear"></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>