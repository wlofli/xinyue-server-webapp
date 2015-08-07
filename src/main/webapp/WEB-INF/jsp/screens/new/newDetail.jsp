<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>新越网新闻详情页面</title>
</head>

<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/jquery.jslides.css" media="screen" />
<script src="../js/tab.js" runat="server" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.jslides.js"></script>
<body class="h_bj">
<div class="container">
<div class="header">

<div class="h_logo">
<div class="h_l_left">
<a href="#"><img src="../images/logo.jpg" /></a>

<script type="text/javascript">
</script>
<div class="cs_qh">
<ul>
   <li><span>杭州</span></li>
   <li onmouseover="show1()" onmouseout="hide1()"><a href="#" class="city_qh" id="cityqh">[切换城市]</a>
   <div class="rm_city" id="cityrm" style="display:none;"><div><span>热门城市</span><a href="city.html">更多></a></div><a href="#">杭州</a><a href="#">苏州</a><a href="#">上海</a><a href="#">宁波</a><a href="#">苏州</a><a href="#">上海</a><a href="#">宁波</a><a href="#">苏州</a><a href="#">上海</a><a href="#">宁波</a><a href="#">苏州</a><a href="#">上海</a><a href="#">宁波</a></div>
   </li>
   <li style="clear:both; width:0; height:0;"></li>
   </ul></div>
</div>
<div class="h_l_right">
<ul>
<li><a href="index.html">首页</a></li>
<li><a href="pro_list.html">贷款产品</a></li>
<li><a href="jg_list.html">融资机构</a></li>
<li><a href="xdjl_list.html">信贷经理</a></li>
<li class="hit"><a href="news.html">新闻资讯</a></li>
<li><a href="help.html">帮助中心</a></li>
<li><a href="wenda_list.html">问答中心</a></li>
<li class="clear"></li>
</ul>
</div>
<div class="clear"></div>
</div>
</div>

</div>
<div class="container1">
<div id="full-screen-slider">
	<ul id="slides">
		<li style="background:url('../images/01.png') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
		<li style="background:url('../images/02.png') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
		<li style="background:url('../images/03.jpg') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
		<li style="background:url('../images/04.png') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
	</ul>
</div>

<div class="form_sd"> 

</div>
</div>

<div class="container2">
<div class="banner_bottom_gg">税贷通-税收信用“贷”动企业快速发展</div>
</div>
<!--中间部分-->
<div class="nr_main">
<div class="nr_center">
<div class="position">
<div class="site"><i class="site_tb"></i><a href="index.html">网站首页</a>&gt;<a href="new_list.html" class="a">新闻列表</a>&gt;<span>新闻详情</span><div class="clear"></div></div>
</div>

</div>
<div class="pro_xq">
<div class="pro_xq_left">
<div class="new_xq_bt"><span>${news.title }</span></div>
<div class="new_xq_zs"><span><fmt:formatDate value="${news.sendDate }" pattern="yyyy-MM-dd h:m"/> 来源：中国税务报</span></div>
<div class="new_xq_nr">
${news.newContent }
<!-- <p>&nbsp;&nbsp;&nbsp;&nbsp;翻开《鞍山市诚信示范企业优惠政策》这份文件，映入记者眼帘的是整整20个红色印章，20个部门向诚信示范企业提供的优惠政策一一清晰地列在上面。</p> -->
<!-- <p> -->
<!-- &nbsp;&nbsp;&nbsp;&nbsp;“这是鞍山市2013年联合20个部门对诚信示范企业出台的优惠政策，每年还会根据实际情况予以调整。”辽宁省发展改革委副主任于非在接受记者采访时如是说。这仅仅是辽宁省激励诚信企业的一个缩影。2010年以来，辽宁省委、省政府一直秉承守信激励和失信惩戒是一个有机整体的信用管理理念，坚持两手抓、不偏废。充分发挥守信激励机制的引领作用和失信惩戒的强制作用，共同引导和推动社会信用环境改善。 -->
<!-- “为树立诚信典型，激励企业守信经营，健全守信激励机制，营造诚实守信的经济发展环境，辽宁省以诚信示范企业评选作为推进守信联合激励工作的着力点，先后开展了三届诚信示范企业评选活动。”于非介绍说。</p><p> -->
<!-- &nbsp;&nbsp;&nbsp;&nbsp;首届辽宁省诚信示范企业评选工作于2010年启动，辽宁省社会信用体系建设领导小组印发了《辽宁省诚信示范企业创建工作实施意见（试行）》等一系列文件， 授匾表彰了105家诚信示范企业。与此同时，辽宁省信用办出台首届诚信示范企业动态跟踪管理实施意见，并以省领导小组的名义印发《辽宁省诚信示范企业优惠 政策》，汇集16家省（中）直机构的24条联合激励政策，形成了广泛的社会影响。</p><p> -->
<!-- &nbsp;&nbsp;&nbsp;&nbsp;2012年，辽宁省开展了第二届诚信示范企业评选，省政府表彰了156家诚信示范企业，省信用办会同省（中）直22家机构联合出台了包括开通涉税事项“绿色通道”、优先选择便捷通关试点对象等38条激励政策，社会影响力、守信联合激励政策力度均超过第一届。</p> -->
<!-- <img src="../images1/cp_icon1.png" style="display:block; margin:10px auto" /> -->
<!-- <p> -->
<!-- 去年，辽宁省将第三届诚信示范企业评选纳入国家管理范畴，评选工作得到了社会广泛关注和企业的积极响应。全省共有1375家大、中、小型企业参加诚信示范企业评选活动，覆盖农林牧渔业、制造业、建筑业、电力、交通运输等18个行业。</p><p> -->
<!-- &nbsp;&nbsp;&nbsp;&nbsp;“诚信示范企业评选过程本身就是对政府诚信的一次检验，我们一直秉承‘优中选优，公平公正’的原则，以身作则营造‘守信光荣、失信可耻、无信不立’的氛围。”于非说。</p><p> -->
<!-- &nbsp;&nbsp;&nbsp;&nbsp;据介绍，经过辽宁省各市初评、省信用协会资格审查、省（中）直有关部门复核、诚信示范企业评选及跟踪管理系统评分、审核委员会评审、领导小组审核、媒体公示、省政府常务会议审定等环节，最终评定出109家企业，拟于近期召开表彰大会，省政府授牌予以表彰。</p><p> -->
<!-- &nbsp;&nbsp;&nbsp;&nbsp;“这些经营业绩良好、诚信经营理念强、信用管理制度健全、社会贡献突出，并取得较高社会认知度和良好信用记录的企业，为全省树立了企业诚信楷模形象。”于 非表示，通过评选，辽宁省商务环境大幅改善。良好的信用记录让企业受益匪浅，越来越多的企业开始重视诚实守信，珍惜信用记录，践诺履约意识显著增强，企业 经营风险不断下降。“这无疑将进一步推动‘信用辽宁’建设，提高企业整体竞争力。” -->
<!-- 据了解，辽宁省还在重点建设工程招标投标领域推行企业信用报告制度，企业通过诚实守信经营，获得较高信用评级，从而获得竞争优势。“万家企业诚信联盟”活 动的开展，形成了自我约束、自我激励的会盟机制。企业经审查确认加入诚信联盟后，可在税收管理、企业年检、金融服务等方面享受相关政策优惠。</p><p> -->
<!-- &nbsp;&nbsp;&nbsp;&nbsp;“社会信用体系建设是一项复杂的长期工作，任重而道远。辽宁的守信联合激励工作刚刚起步，需要做的工作很多。”于非表示，下一步将探索开展“辽宁省诚信人 物评选”，制定联合激励政策，向社会传递“诚信立身、信用兴业”正能量。同时做好第三届诚信示范企业宣传激励工作，逐项落实38条联合激励政策。“相信辽 宁必将以更加优良的信用环境，更加浓郁的诚信氛围，凝聚推动新一轮老工业基地全面振兴的新动力。”于非说。 -->

<!-- </p> -->
<div class="fx_new"><span>分享到：</span>
<div class="bshare-custom icon-medium">
<div class="bsPromo bsPromo2"></div>
<a title="分享到QQ空间" class="bshare-qzone"></a>
<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
<a title="分享到腾讯微博" class="bshare-qqmb"></a>
<a title="分享到网易微博" class="bshare-neteasemb"></a>
<a title="分享到朋友网" class="bshare-qqxiaoyou" href="javascript:void(0);"></a>
<a title="分享到微信" class="bshare-weixin" href="javascript:void(0);"></a>
<a title="分享到QQ好友" class="bshare-qqim" href="javascript:void(0);"></a>
<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span style="float: none;" class="BSHARE_COUNT bshare-share-count">0</span></div>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script></div>
<div class="clear"></div>
</div>
<div class="new_link">
<p><span>上一篇：</span><a href="${ctx }/new/detail?id=${before.key}">${before.value }</a></p>
<p><span>下一篇：</span><a href="${ctx }/new/detail?id=${after.key}">${after.value }</a></p>
</div>


</div>
<div class="pro_xq_right">
<div class="p_r_dk">
<div class="dk_bt"><span>我要贷款</span></div>
<div class="dk_nr">
<p><span>产品类别：</span><select class="lb_s"><option></option></select></p>
<p><span>贷款金额：</span><select class="lb_s"><option></option></select></p>
<p><span>贷款期限：</span><select class="lb_s"><option></option></select></p>
<p><span>贷款用途：</span><select class="lb_s"><option></option></select></p>
<p class="mar_bot"><input type="button" class="lb_b" value="搜索产品" /></p>
</div>
</div>
<div class="rm_zx">
<div class="zx_bt"><span>最新资讯</span><a href="#">更多&gt;</a><div class="clear"></div></div>
<div class="zx_lb">
<ul>
<Li><a href="#">新越网新版2.0版本上线了</a></Li>
<Li><a href="#">沪指站上4000点 后市如何布局</a></Li>
<Li><a href="#">中国泡沫最后的输家是谁 A股暴跌的最大</a></Li>
<Li><a href="#">马云为股市背了黑锅 暴跌其实只怪自己</a></Li>
<Li><a href="#">税来啦!房地产税日益临近</a></Li>
<Li><a href="#">6月最新十大房价涨幅最高城市</a></Li>
<Li><a href="#">6月70城市房价最新数据出炉</a></Li>
<Li><a href="#">新越网新版2.0版本上线了</a></Li>
<Li><a href="#">宁波贷款、宁波贷款公司、宁波</a></Li>
<Li><a href="#">公务员基本工资调整 无抵押贷</a></Li>
</ul>
</div>

</div>
<div class="ad_mk1">
<a href="#">
<img src="../images1/ad1.jpg" /></a>
</div>

</div>
<div class="clear"></div>
</div>

</div>
<!--中间部分-->
<div class="footer f_bg">
<div class="f1">
<ul class="f1_l1">
<li><span>贷款用户</span></li>
<li><a href="#">登录/注册</a></li>
<li><a href="#">申贷流程</a></li>
<li><a href="#">推荐会员</a></li>
</ul>
<ul class="f1_l2">
<li><span>信贷经理</span></li>
<li><a href="#">平台入驻</a></li>
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
<li><a href="#">联系我们</a></li>
<li><a href="#">网站地图</a></li>
<li><a href="#">城市分站</a></li>
</ul>
<div class="kf">
<p>
<span>服务热线</span>
<span class="fwrx">400-860-9280</span>
<span>( 服务时间  9:00 — 17:00 )</span>
<ul class="fx_ul">
<li><a href="#" class="fx_b_xl"></a></li>
<li><a href="#" class="fx_b_wx"></a></li>
<li><a href="#" class="fx_b_qq"></a></li>
</ul>
</p>
</div>
<div class="ewm">
<ul>
<li class="ewm1">
<img src="../images/smdl.jpg" />
<span>手机端浏览</span>
</li>
<li class="ewm2">
<img src="../images/smdl.jpg" />
<span>微信加关注</span>
</li>
</ul>
</div>
<div class="clear"></div>
</div>
   <p class="yl">友情链接: <a href="#">太平洋资产管理(集团)</a><a href="#">和讯金融</a><a href="#">融360</a><a href="#">金融界财股网</a><a href="#">理财房贷利率网</a><a href="#">贷之家</a><a href="#">商业贷款计算器</a><a href="#">希财网</a><a href="#">金评媒</a><a href="#">希财网</a></p>
   <p class="tbs"><a href="#" class="tbs1"></a><a href="#" class="tbs2"></a><a href="#" class="tbs3"></a><a href="#" class="tbs4"></a><a href="#" class="tbs5"></a></p>
   
    <p class="f_b"><span class="left"><a href="#">关于我们</a> | <a href="#">人才招聘</a> | <a href="#">意见反馈</a> | <a href="#">服务条款</a> | <a href="#">帮助中心</a> </span><span class="right">浙ICP备14020719号 www.91loan.cn ©2005-2026  常年法律顾问：浙江融哲律师事务所</span><div class="clear"></div></p>
</div>
 
</body>
</html>
