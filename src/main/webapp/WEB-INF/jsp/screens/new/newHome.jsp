<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>新越网新闻资讯首页</title>
<%@include file="../../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx }/css/jquery.jslides.css" media="screen" />
<script src="${ctx }/js/tab.js"  type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/scroll.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx }/js/koala.min.1.5.js"></script>
<script type="text/javascript">

$(function() {
var $this = $("#anli");
var scrollTimer;
$this.hover(function() {
clearInterval(scrollTimer);
}, function() {
scrollTimer = setInterval(function() {
scrollNews($this);
}, 2000);
}).trigger("mouseleave");


function turnList(typeid){
	window.location.href="${ctx}/new/newlist?index=0&typeId= " + typeid;
}



function scrollNews(obj) {
var $self = obj.find("ul");
var lineHeight = $self.find("li:first").height();
$self.animate({
"marginTop": -lineHeight + "px"
}, 600, function() {
$self.css({
marginTop: 0
}).find("li:first").appendTo($self);
})
}
}) 

</script>
<script type="text/javascript" src="../js/jquery.jslides.js"></script>

</head>

<body class="h_bj">
<div class="container">
<div class="header">
<div class="h_bar">
<div class="h_b_left"><h1>400-860-9280</h1><span>（工作日：9:00-17:30）</span>
<span>
<a href="#" class="fx_xl" onmouseover="show('xlfx')" onmouseout="hid('xlfx')"></a>
<img src="../images/fx_xl.png" id="xlfx" style="z-index:999;"/>
</span>
<span>
<a href="#" class="fx_wx" onmouseover="show('wxfx')" onmouseout="hid('wxfx')"></a>
<img src="../images/fx_wx.png" id="wxfx" style="z-index:999;"/>
</span>
<span>
<a href="#" class="fx_qq" onmouseover="show('qqfx')" onmouseout="hid('qqfx')"></a>
<img src="../images/fx_qq.png" id="qqfx" style="z-index:999;"/>
</span>
</div>
<div class="h_b_right">
<ul class="menu">
<li onmouseover="show('xdjl')" onmouseout="hid('xdjl')">
<a href="#" class="xl">信贷经理</a>
<ul id="xdjl" class="fnav">
<li><a href="#">入驻平台</a></li>
<li><a href="#">登录平台</a></li>
</ul>
</li>
<li onmouseover="show('pthy')" onmouseout="hid('pthy')">
<a href="#" class="xl">普通会员</a>
<ul id="pthy" class="fnav">
<li><a href="#">注册会员</a></li>
<li><a href="#">登录平台</a></li>
</ul>
</li>
<li><a href="#">新手指南</a>
</li>
</ul>
</div>
<div class="clear"></div>
</div>
<div class="h_logo">
<div class="h_l_left">
<a href="#"><img src="${ctx}/images/logo.jpg" /></a>

<script type="text/javascript">
 function show1(){
	document.getElementById('cityqh').style.backgroundImage="url(images/city_qh1.jpg)";
	document.getElementById('cityrm').style.display="block";
	}
 function hide1(){
	document.getElementById('cityqh').style.backgroundImage="url(images/city_qh.jpg)";
	document.getElementById('cityrm').style.display="none";
	}
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
 
<div class="zx_index">

<div class="nr_center">
<div class="position">
<div class="site"> 

<a href="${ctx }/new/newlist?index=0&typeId=${hotnew.id}" class="a">${hotnew.name }</a>
<c:forEach items="${othernew }" var="list"> 
<a href="${ctx }/new/newlist?index=0&typeId=${list.key}" class="a">${list.value }</a>
</c:forEach>
<!-- <a href="new_list1.html" class="a">银行资讯</a>   -->
<!-- <a href="gonglve_list.html" class="a">贷款攻略</a>   -->
<!-- <a href="new_list2.html" class="a">融资正常法规</a>   -->
<!-- <a href="new_list3.html" class="a">中小企业观察</a>  -->
</div>
</div>

</div>

<div class="zx_index_main">
<div class="zx_index_top">
<div class="zx_index_top_left">
<div class="zx_flash">

<div id="fsD1" class="focus">

	<div id="D1pic1" class="fPic">
		<div class="fcon">
			<a href=""><img src="${ctx}/images1/cp_icon2.png" /></a>
			<span class="shadow"><a href="">红三</a></span>
		</div>
		<div class="fcon">
			<a href=""><img src="${ctx}/images1/cp_icon1.png" /></a>
			<span class="shadow"><a href="">佟大</a></span>
		</div>
		<div class="fcon">
			<a href=""><img src="${ctx}/images1/cp_icon3.png" /></a>
			<span class="shadow"><a href="">21岁</a></span>
		</div>
		<div class="fcon">
			<a href=""><img src="${ctx}/images1/cp_icon4.png" /></a>
			<span class="shadow"><a href="">金喜</a></span>
		</div>
	</div>
	
	<div class="fbg">
		<div class="D1fBt" id="D1fBt">
			<a href="javascript:void(0)" class="current"><i>1</i></a>
			<a href="javascript:void(0)"><i>2</i></a>
			<a href="javascript:void(0)"><i>3</i></a>
			<a href="javascript:void(0)"><i>4</i></a>
		</div>
	</div>
	
	<span class="prev"></span>
	<span class="next"></span>
	
</div>


<script type="text/javascript">
Qfast.add('widgets', { path: "${ctx}/js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
Qfast(false, 'widgets', function () {
	K.tabs({
		id: 'fsD1',   //焦点图包裹id  
		conId: "D1pic1",  //** 大图域包裹id  
		tabId:"D1fBt",  
		tabTn:"a",
		conCn: '.fcon', //** 大图域配置class       
		auto: 1,   //自动播放 1或0
		effect: 'fade',   //效果配置
		eType: 'click', //** 鼠标事件
		pageBt:true,//是否有按钮切换页码
		bns: ['.prev', '.next'],//** 前后按钮配置class                          
		interval: 3000  //** 停顿时间  
	}) 
})  
</script>

</div>
</div>
<div class="zx_index_top_center"> 
<div class="zx_rm_bt"><span>热门资讯</span><a href="new_list.html">更多&gt;</a></div>
<ul class="menu1">
	<c:forEach items="${hotnewlist }" var="list" >
	<li>
		<a href="new_xq.html" class="litpic1"><img src="${ctx }${list.fileDir}${list.fileName}" width="115px" /></a>
		<div class="xq">
		<a href="new_xq.html" class="bt">${list.title }</a>
		<p>
		${list.showTitle }<a href="${ctx }/new/detail?id=${list.id}" class="more">[详情]</a>
		</p>
		</div>
	</li>
	</c:forEach>
	<li>
		<a href="new_xq.html" class="litpic1"><img src="${ctx}/images1/zx_img.jpg" width="115px"  /></a>
		<div class="xq">
		<a href="new_xq.html" class="bt">如何避免“被贷款”</a>
		<p>
		      近期，山西大部分地方农民在家不知不觉就贷款了，如何避免
		“被贷款”。是很多地方农民的重中之重…<a href="new_xq.html" class="more">[详情]</a>
		</p>
		</div>
	</li>
</ul><!--
<ul class="menu2">
<li><a href="new_xq.html">山西大部分地方农民在家不知不觉就贷款了“被贷款”</a></li>
<li><a href="new_xq.html">如何避免“山西大部分地方农民在家不知不觉</a></li>
<li><a href="new_xq.html">是很多地方农民的重中之重“被贷款”</a></li>
<li><a href="new_xq.html">是很多地方农民的重中之重“被贷款”</a></li>
<li><a href="new_xq.html">如何避免山西大部分地方农民在家不知不觉就贷款了”</a></li>
<li><a href="new_xq.html">山西大部分地方农民在家不知不贷款了被贷款”</a></li>
 
</ul>-->

</div>
<div class="zx_index_top_right"> 
<div class="sc_dk">
<div class="sc_dk_bt"><span>我要贷款</span></div>
<div class="sc_dk_nr">
<p><span>产品类别：</span><select class="dk_s" ></select></p>
<p><span>贷款金额：</span><select class="dk_s" ></select></p>
<p><span>单开期限：</span><select class="dk_s" ></select></p>
<p style="margin-top:25px; margin-bottom:7px;"><input type="button" class="dk_sc"  value="搜索贷款"/></p>
</div>
 
</div>

</div>
<div class="clear"></div>

</div>
<div class="zx_index_ad">
<a href="#"><img src="${ctx}/images1/big_ad.png" /></a>
</div>
<div class="zx_index_bottom">
<div class="zx_bottom_left">
<div class="zx_bottom_left_bt">
<ul class="menu1" id="menu">
<c:forEach items="${othernew }" var="list" varStatus="vs" >
<li class="<c:if test="${vs.count == 1 }">hit</c:if>"  onclick="javascript:turnList(${list.key})"><a>${list.value }</a></li>
<!-- <li class="" onclick="javascript:tab_item(1);setmore('new_list1.html')"><a>银行资讯</a></li> -->
<!-- <li class="" onclick="javascript:tab_item(2);setmore('gonglve_list.html')"><a>贷款攻略</a></li> -->
<!-- <li class="" onclick="javascript:tab_item(3);setmore('new_list2.html')"><a>融资政策法规</a></li> -->
<!-- <li class="" style=" border-right:0;" onclick="javascript:tab_item(4);setmore('new_list3.html')"><a>中小企业观察</a></li> -->
</c:forEach>
<!-- <div class="clear"></div> -->
</ul>
<a href="#" class="more" id="more">更多&gt;</a>
</div>
<div class="zx_bottom_left_nr">
<div class="zxxq" id="tab0">
<div class="zxxq_top">


<ul class="zxxq_lit_ul">
<c:forEach items="${firstList }" varStatus="list" begin="0" end="2" >
<li class="h1_li"><a href="${ctx }/new/detail?id=${list.id}"><img src="${ctx}/images1/cp_icon1.png" width="368" height="200"/><span>${list.title }</span></a></li>
</c:forEach>
</ul>

<ul class="zxxq_wz_ul">
<li class="wz_ul_h"><a href="new_xq.html">学者呼吁为小额信贷正名，禁禁商业商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li class="wz_ul_h mar_top"><a href="new_xq.html">学者呼吁为小额信贷正名禁商业，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>

</ul>
<div class="clear"></div>
</div>
<div class="zxxq_bottom">
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<div class="clear"></div>
</div>
</div>
<div class="zxxq" id="tab1" style="display:none">

<div class="zxxq_top">
<ul class="zxxq_lit_ul">
<li class="h1_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="368" height="200"/><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h2_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h3_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>

</ul>

<ul class="zxxq_wz_ul">
<li class="wz_ul_h"><a href="new_xq.html">学者呼吁为小额信贷正名，禁禁商业商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li class="wz_ul_h mar_top"><a href="new_xq.html">学者呼吁为小额信贷正名禁商业，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>

</ul>
<div class="clear"></div>
</div>
<div class="zxxq_bottom">
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<div class="clear"></div>
</div>
</div>
<div class="zxxq" id="tab2" style="display:none">

<div class="zxxq_top">
<ul class="zxxq_lit_ul">
<li class="h1_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="368" height="200"/><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h2_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h3_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>

</ul>

<ul class="zxxq_wz_ul">
<li class="wz_ul_h"><a href="new_xq.html">学者呼吁为小额信贷正名，禁禁商业商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li class="wz_ul_h mar_top"><a href="new_xq.html">学者呼吁为小额信贷正名禁商业，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>

</ul>
<div class="clear"></div>
</div>
<div class="zxxq_bottom">
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<div class="clear"></div>
</div>
</div>
<div class="zxxq" id="tab3" style="display:none">

<div class="zxxq_top">
<ul class="zxxq_lit_ul">
<li class="h1_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="368" height="200"/><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h2_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h3_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>

</ul>

<ul class="zxxq_wz_ul">
<li class="wz_ul_h"><a href="new_xq.html">学者呼吁为小额信贷正名，禁禁商业商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li class="wz_ul_h mar_top"><a href="new_xq.html">学者呼吁为小额信贷正名禁商业，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>

</ul>
<div class="clear"></div>
</div>
<div class="zxxq_bottom">
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<div class="clear"></div>
</div>
</div>
<div class="zxxq" id="tab4" style="display:none">

<div class="zxxq_top">
<ul class="zxxq_lit_ul">
<li class="h1_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="368" height="200"/><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h2_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>
<li class="h3_li"><a href="new_xq.html"><img src="${ctx}/images1/cp_icon1.png" width="178" /><span>学者呼吁为小额信贷正名，禁商业小贷</span></a></li>

</ul>

<ul class="zxxq_wz_ul">
<li class="wz_ul_h"><a href="new_xq.html">学者呼吁为小额信贷正名，禁禁商业商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li class="wz_ul_h mar_top"><a href="new_xq.html">学者呼吁为小额信贷正名禁商业，禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商禁商业小贷</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小贷禁商业小贷</a></li>

</ul>
<div class="clear"></div>
</div>
<div class="zxxq_bottom">
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<ul class="zxxq_bot_left">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}/images1/zx_img.jpg" width="80" height="70" />
</a>
<div class="xq">
<a href="new_xq.html">学者呼吁为小额信贷正名,禁商业小额贷款融资</a>
<span>学者呼吁为小额信贷正名，禁商业吁为小额信贷正名，禁商业…</span>
</div>
</li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
<li><a href="new_xq.html">学者呼吁为小额信贷正名，禁商业小额贷款融资</a></li>
 </ul>
<div class="clear"></div>
</div>
</div>
</div>

</div>
<div class="zx_bottom_right">
<div class="ad_new1">
<a href="#"><img src="${ctx}/images1/ad2.jpg" /></a>
</div> 
<div class="dkjsq" style="border:1px #aaa solid; margin-top:10px;">
<div class="dkjsq_bt" style=" border-bottom:1px #aaa solid;">
<span>贷款计算器</span>
</div>
<ul class="jsq" style="margin-top:10px;">
<li class="jsq">
<a href="#" class="jsq_left"><img src="${ctx}/images1/jsq_icon.png" width="60px" /></a>
<div class="xq">
<a href="#">
房贷担保费计算器
</a>
<span>一分钟算出房贷担保费</span>
</div>
<Div class="clear"></Div>
</li>
<li class="jsq">
<a href="#" class="jsq_left"><img src="${ctx}/images1/jsq_icon1.png" width="60px" /></a>
<div class="xq">
<a href="#">
商业贷款计算器
</a>
<span>算算你的贷款划算否？</span>
</div>
<Div class="clear"></Div>
</li>
<li class="jsq">
<a href="#" class="jsq_left"><img src="${ctx}/images1/jsq_icon2.png" width="60px" /></a>
<div class="xq">
<a href="#">
提前还款计算器
</a>
<span>一分钟算出房贷担保费</span>
</div>
<Div class="clear"></Div>
</li>
<li class="jsq">
<a href="#" class="jsq_left"><img src="${ctx}/images1/jsq_icon4.png" width="60px" /></a>
<div class="xq">
<a href="#">
个人贷款计算器
</a>
<span>算算你的贷款划算否？</span>
</div>
<Div class="clear"></Div>
</li> 
</ul>
</div>

<div class="ad_new2">
<a href="#"><img src="${ctx}/images1/ad1.jpg" height="300" /></a>
</div> 
</div>
<div class="clear"></div>
</div>
</div>
</div>



 

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
<img src="${ctx}/images/smdl.jpg" />
<span>手机端浏览</span>
</li>
<li class="ewm2">
<img src="${ctx}/images/smdl.jpg" />
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
 
 
<!--弹出框内容--> 

   <div id="tck">
       <div class="zx_tck"> 
         <div class="bt"><h1>填写联系方式</h1><a href="javascript:hide()"><img src="${ctx}/images/close.png" /></a><div class="clear"></div></div>
       <div class="nr">  
       <div class="nr_left">
       <p><span>手机号码：</span><input type="text" placeholder="请输入手机号码" class="sjh_t" /><input type="button" class="sjyz_b" value="获取验证码" /></p>
       <p><span>验证码：</span><input type="text" placeholder="请输入验证码" class="sjyz_t" /></p>
       <p><input type="button" value="确定" class="tjsj_btn" /></p>
       </div>
       <div class="nr_right">
       <p class="ts_bt">提示</p>
       <p class="ts_nr">请填写您的联系方式，以便信贷经理与您联系</p>
     
       </div>
       <div class="clear"></div>
       </div>
        </div>
  </div>
  <div id="over"></div>
  
<!--弹出框内容--> 
</body>
</html>

<!--弹出框js内容--> 

 <script type="text/javascript">
 var login=document.getElementById("tck"); 
    var over=document.getElementById("over");
     function zxtck()
     {
        login.style.display = "block";
        over.style.display = "block";
     }
     function hide()
   {
        login.style.display = "none";
        over.style.display = "none";
    }
	 
	 </script>
<!--弹出框js内容--> 