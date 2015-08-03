<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
$(function(){
	
	var nav = "${nav}";
	$(".left_nav .f_nav li").each(function(){
		$(this).removeClass("hit");
	});
// 	alert(nav);
    $("#"+nav).addClass("hit");
//     warn,可能会在 div left_nav增加多余的hit 问题不大 add by lzc
    $("#"+nav).parent().parent().addClass("hit");
	
	$(".left_nav .f_nav li #a").click(function(){ 
		$(this).parent().find('.f_nav_ful').removeClass("menu_chioce");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('.f_nav_ful').slideToggle();
		$(this).parent().find('.f_nav_ful').addClass("menu_chioce");
	});
});

</script>

<div class="position">
<span>当前位置：</span><a href="#">网站首页</a>-<span>会员中心</span>
</div>
<div class="left_nav">
<ul class="f_nav">
<li class="f_nav_head"><span>会员中心</span></li>
<li id="main"><a id="a" href="${ctx }/member/list?param=main">我的主页</a>
<!-- <ul class="f_nav_ful"> -->
<%-- <li id="main"><a href="${ctx }/member/list?param=main">我的主页</a></li> --%>
<!-- </ul> -->
</li>
<li><a id="a">基本信息设置</a>
<ul class="f_nav_ful">
<li id="basci"><a href="${ctx }/member/list?param=basic">基本信息</a></li>
<li id="updatepwd"><a href="${ctx }/member/list?param=updatepwd">修改密码</a></li>
<li id="tel"><a href="${ctx }/member/list?param=tel">手机验证</a></li>
</ul>
</li>
<li id="authentication"><a href="${ctx}/member/list?param=authentication">实名认证</a></li>
<li><a id="a">贷款订单</a>
<ul class="f_nav_ful">
<li id="orderlist"><a href="${ctx }/member/list?param=orderlist">贷款订单列表</a></li>
<li id="graph"><a href="${ctx }/member/list?param=graph">贷款订单图表</a></li>
</ul>
</li>
<li id="companyrecord"><a href="${ctx}/member/list?param=companyrecord">企业档案</a></li>
<li id="down"><a id="a" href="${ctx }/member/list?param=down">下载中心</a></li>
<li><a id="a">收藏管理</a>
<ul class="f_nav_ful">
<li id="product"><a href="${ctx }/member/list?param=product">产品收藏</a></li>
<li id="org"><a href="${ctx }/member/list?param=org">机构收藏</a></li>
</ul>
</li>
<li><a id="a">分享推荐会员</a>
<ul class="f_nav_ful">
<li id="recommend"><a href="${ctx }/member/list?param=recommend">推荐会员</a></li>
<li id="member"><a href="${ctx }/member/list?param=member">推荐普通会员列表</a></li>
<li id="credit"><a href="${ctx }/member/list?param=credit">推荐信贷经理列表</a></li>
</ul>
</li>
<li><a id="a">推荐奖励提现</a>
<ul class="f_nav_ful">
<li id="reward"><a href="${ctx }/member/list?param=reward">推荐奖励记录</a></li>
<li id="withdraw"><a href="${ctx }/member/list?param=withdraw">推荐奖励提现</a></li>
<li id="bind"><a href="${ctx }/member/list?param=bind">绑定提现账号</a></li>
<li id="appwithdraw"><a href="${ctx }/member/list?param=appwithdraw">申请提现</a></li>
</ul>
</li>
<li id="question"><a href="${ctx }/member/list?param=question">问答管理</a></li>

</ul>
</div>

