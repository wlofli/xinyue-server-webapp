<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	<div class="h_bar">
		<div class="h_b_left">
			<h1>400-860-9280</h1>
			<span>（工作日：9:00-17:30）</span>
			<span>
				<a href="#" class="fx_xl" onmouseover="show('xlfx')" onmouseout="hid('xlfx')"></a>
				<img src="${ctx}/images/weixin.jpg" id="xlfx" style="z-index:999;" width="100" height="90"/>
			</span>
			<span>
				<a href="#" class="fx_wx" onmouseover="show('wxfx')" onmouseout="hid('wxfx')"></a>
				<img src="${ctx}/images/weibo.jpg" id="wxfx" style="z-index:999;" width="100" height="90"/>
			</span>
			<span>
				<a href="http://wpa.qq.com/msgrd?v=3&uin=2740293039&site=qq&menu=yes" target="_blank" class="fx_qq" onmouseover="show('qqfx')" onmouseout="hid('qqfx')"></a>
				<img src="http://wpa.qq.com/pa?p=2:2740293039:51" id="qqfx" style="z-index:999;"/>
			</span>
		</div>
		<div class="h_b_right">
			<c:choose>
				<c:when test="${empty sessionScope.session_member_info}">
					<ul class="menu">
						<li onmouseover="show('xdjl')" onmouseout="hid('xdjl')">
							<a href="#" class="xl">信贷经理</a>
							<ul id="xdjl" class="fnav">
								<li><a href="/credit-manager-web/register/credit/page">入驻平台</a></li>
								<li><a href="/credit-manager-web/login/credit/page">登录平台</a></li>
							</ul>
						</li>
						<li onmouseover="show('pthy')" onmouseout="hid('pthy')">
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
						<li><span>您好，</span><a href="${ctx}/member/list?param=main">${sessionScope.session_member_info.loginName}</a><span>|</span></li>
						<li><a href="${ctx }/member/order/list">我的贷款订单</a><span>|</span></li>
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
			<script type="text/javascript">
				function city() {
					document.getElementById('cityrm').style.display = "block";
				}
				function qxcity() {
					document.getElementById('cityrm').style.display = "none";
				}
			</script>
			<div class="cs_qh">
				<ul>
					<li><span>${city_name}</span></li>
					<li onmouseover="city()" onmouseout="qxcity()"><a href="#"
						class="city_qh" id="cityqh">[切换城市]</a>
						<div class="rm_city" id="cityrm" style="display: none;">
							<div>
								<span>热门城市</span><a href="${ctx}/city/list">更多></a>
							</div>
							<a href="javascript:void(0)" onclick="changeCity('杭州')" target="_self">杭州</a>
						</div>
					</li>
					<li style="clear: both; width: 0; height: 0;"></li>
				</ul>
			</div>
		</div>
		<div class="h_l_right">
			<ul>
				<li id="index"><a href="${ctx}/index">首页</a></li>
				<li id="product"><a href="javascript:void(0)" onclick="document.location.href='${ctx}/product/show'">贷款产品</a></li>
				<li id="org"><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/show'">融资机构</a></li>
				<li id="manager"><a href="${ctx}/manager">信贷经理</a></li>
				<li id="new"><a href="${ctx }/new/homelist">新闻资讯</a></li>
				<li id="help"><a href="${ctx}/help">帮助中心</a></li>
				<li id="question"><a href="javascript:void(0)" onclick="document.location.href='${ctx }/quest/show'">问答中心</a></li>
				<li class="clear"></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<script type="text/javascript">
$(function (){
	var indexType = "${index_type}";
	
	$("#index").removeClass("hit");
	$("#help").removeClass("hit");
	
	$("#"+indexType).addClass("hit");
});
	
function changeCity(name){
// 	alert(encodeURI(encodeURI(name)));
	window.location.href = '${ctx}/city/select?cityName=' + encodeURI(encodeURI(name));
}


</script>