<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="footer f_bg">
	<div class="f1">
		<ul class="f1_l1">
			<li><span>贷款用户</span></li>
			<li><a href="${ctx}/login/member">登录/注册</a></li>
			<li><a href="${ctx}/help/detail?id=f03e52ac371342ffbbb0c610a7610787">申贷流程</a></li>
			<li><a href="#">推荐会员</a></li>
		</ul>
		<ul class="f1_l2">
			<li><span>信贷经理</span></li>
			<li><a href="http://credit.91loan.cn/register/credit/page">平台入驻</a></li>
			<li><a href="#">实名认证</a></li>
			<li><a href="#">产品推广</a></li>
		</ul>
		<ul class="f1_l3">
			<li><span>安全保障</span></li>
			<li><a href="#">法律声明</a></li>
			<li><a href="#">隐私保护</a></li>
		</ul>
		<ul class="f1_l4">
			<li><span>用心服务</span></li>
			<li><a href="${ctx}/help/detail?id=cef538d2a2ff492082caebf7edd518bf">联系我们</a></li>
			<li><a href="#">网站地图</a></li>
			<li><a href="${ctx}/city/list">城市分站</a></li>
		</ul>
		<div class="kf">
			<p>
				<span>服务热线</span>
				<span class="fwrx">400-860-9280</span>
				<span>(服务时间 9:00 — 17:00 )</span>
			<ul class="fx_ul">
				<li><a href="#" class="fx_b_xl"></a></li>
				<li><a href="#" class="fx_b_wx"></a></li>
				<li><a href="#" class="fx_b_qq"></a></li>
			</ul>
			</p>
		</div>
		<div class="ewm">
			<ul>
				<li class="ewm1"><img src="../images/smdl.jpg" /> <span>手机端浏览</span>
				</li>
				<li class="ewm2"><img src="../images/smdl.jpg" /> <span>微信加关注</span>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<p class="yl">
		友情链接: 
		<c:forEach items="${fsLinks}" var="fsLink" varStatus="vs">
			<a href="#">${fsLink.name}</a>
		</c:forEach>
	</p>
	<p class="tbs">
		<a href="#" class="tbs1"></a>
		<a href="#" class="tbs2"></a>
		<a href="#" class="tbs3"></a>
		<a href="#" class="tbs4"></a>
		<a href="#" class="tbs5"></a>
	</p>
	<p class="f_b">
		<span class="left">
			<a href="#">关于我们</a> | 
			<a href="#">人才招聘</a> | 
			<a href="#">意见反馈</a> | 
			<a href="#">服务条款</a> | 
			<a href="${ctx}/help/center">帮助中心</a>
		</span>
		<span class="right">浙ICP备14020719号 www.91loan.cn ©2015 常年法律顾问：浙江融哲律师事务所</span>
		<div class="clear"></div>
	</p>
</div>