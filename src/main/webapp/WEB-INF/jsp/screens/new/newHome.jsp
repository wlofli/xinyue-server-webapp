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
<script type="text/javascript" src="${ctx }/js/jquery-1.9.0.min.js"></script>
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
<jsp:include page="../../common/head.jsp" />
</div> 
 
<div class="zx_index">

<div class="nr_center">
<div class="position">
<div class="site"> 


<c:forEach items="${newtype }" var="list"> 
<a href="${ctx }/new/list?index=0&typeId=${list.key}" class="a">${list.value }</a>
</c:forEach>
</div>
</div>

</div>

<div class="zx_index_main">
<div class="zx_index_top">
<div class="zx_index_top_left">
<div class="zx_flash">

<div id="fsD1" class="focus">

	<div id="D1pic1" class="fPic">
		<c:forEach items="${top }" var="list" >
		<div class="fcon">
			<a href="${ctx }/new/detail?id=${list.id}"><img src="${ctx }${showpath}${list.fileDir }${list.fileName }" /></a>
			<span class="shadow"><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></span>
		</div>
		</c:forEach>
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
<c:forEach items="${newtype }" var="list" begin="0" end="0">
<div class="zx_rm_bt"><span>${list.value }</span><a href="${ctx }/new/list?typeId=${list.key}">更多&gt;</a></div>
</c:forEach>
<ul class="menu1">
	<c:forEach items="${firstnewlist }" var="list" >
	<li>
		<a href="${ctx }/new/detail?id=${list.id}" class="litpic1"><img src="${ctx }${showpath}${list.fileDir}${list.fileName}" width="115px" /></a>
		<div class="xq">
		<a href="${ctx }/new/detail?id=${list.id}" class="bt">${list.title }</a>
		<p>
		${list.showTitle }<a href="${ctx }/new/detail?id=${list.id}" class="more">[详情]</a>
		</p>
		</div>
	</li>
	</c:forEach>
</ul>

</div>
<div class="zx_index_top_right"> 
<div class="sc_dk">
<div class="sc_dk_bt"><span>我要贷款</span></div>
<div class="sc_dk_nr">
<p><span>产品类别：</span><select class="dk_s" ></select></p>
<p><span>贷款金额：</span><select class="dk_s" ></select></p>
<p><span>贷款期限：</span><select class="dk_s" ></select></p>
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
<script>
function turnList(typeid){
// 	alert("in");
	$.ajax({
		   url:"${ctx}/new/newlistjson?id=" + typeid,
		   method:"post",
		   async:true,
		   success:function(data){
		   	var jsonData = eval('('+data+')');
		   	if(jsonData.result == "fail"){
		   		alert("该新闻没没有内容");
		   		return;
		   	}else{
		   		var new_one = "<div class='zxxq_top'><ul class='zxxq_lit_ul'>";
		   		for( i = 0; i <= 0; i++){
					new_one += "<li class='h1_li'><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'><img src='${ctx}/images1/cp_icon1.png' width='368' height='200' />";
					new_one += "<span>" + jsonData.newlist[i].title + "</span></a></li>";
		   		}
		   		for( i = 1; i <= 2; i++){
		   			new_one += "<li class='h" + (i + 1) + "_li'><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>";
		   			new_one += "<img src='${ctx}/images1/cp_icon1.png' width='178' /><span>" + jsonData.newlist[i].title + "</span></a></li>";
		   		}
		   		new_one += "</ul><ul class='zxxq_wz_ul'>";
		   		for( i = 3; i <= 8; i++){
		   			if(i == 3){
		   				new_one += "<li class='wz_ul_h'><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a></li>";
		   			}else{
		   				new_one += "<li><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a></li>";
		   			}
		   		}
		   		for( i = 9; i<= 13; i++){
		   			if(i == 9){
		   				new_one += "<li class='wz_ul_h mar_top'><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a></li>";
		   			}else{
		   				new_one += "<li><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a></li>";
		   			}
		   		}
		   		new_one += "</ul><div class='clear'></div></div><div class='zxxq_bottom'><ul class='zxxq_bot_left'>";
		   		new_one += "<li class='b_h_li'>";
		   		for( i = 14; i<= 14; i++){
		   			new_one += "<a class='b_h_li_lit' href='new_xq.html'><img src='${ctx}/images1/zx_img.jpg' width='80' height='70' /></a>";
		   			new_one += "<div class='xq'><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a><span>" + jsonData.newlist[i].showTitle + "</span></div>";
		   		}
		   		new_one += "</li>";
		   		for( i = 15; i<= 20; i++){
		   			new_one += "<li><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a></li>";
		   		}
		   		new_one += "</ul>";
		   		new_one += "<ul class='zxxq_bot_left'>";
		   		for( i = 21; i<=21; i++){
		   			new_one += "<li class='b_h_li'><a class='b_h_li_lit' href='new_xq.html'><img src='${ctx}/images1/zx_img.jpg' width='80' height='70' /></a>";
		   			new_one += "<div class='xq'><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a><span>" + jsonData.newlist[i].showTitle + "</span></div>";
		   			new_one += "</li>";
		   		}
		   		for( i = 22; i<= 27; i++){
		   			new_one += "<li><a href='${ctx }/new/detail?id=" + jsonData.newlist[i].id + "'>" + jsonData.newlist[i].title + "</a></li>";
		   		}
		   		new_one += "</ul><div class='clear'></div></div>";
		   		$("#tab0").empty();
// 		   		alert("go");
				$("#tab0").append(new_one);
		   		$("#more").attr("href","${ctx }/new/list?typeId=" + typeid);
		   		$(".newType").removeClass("hit");
		   		$("#"+typeid).addClass("hit");
		   	}
		  }
	});
// 	window.location.href="${ctx}/new/list?index=0&typeId= " + typeid;
}
</script>
<ul class="menu1" id="menu">

<!-- menu li -->

<c:forEach items="${newtype }" var="list" varStatus="vs" begin="1">
<li class="<c:if test="${vs.count == 1 }">hit</c:if> newType" id="${list.key }">
<a href="javascript:turnList('${list.key}')">${list.value }</a></li>
</c:forEach>
<!-- <div class="clear"></div> -->
</ul>
<c:forEach items="${newtype }"  var="list" begin="1" end="1">
<a href="${ctx }/new/list?typeId=${list.key}" class="more" id="more">更多&gt;</a>
</c:forEach>
</div>
<div class="zx_bottom_left_nr">
<div class="zxxq" id="tab0">
<div class="zxxq_top">

<ul class="zxxq_lit_ul">
<c:forEach items="${secondnewlist }" varStatus="vs" var="list" begin="0" end="0" >
<li class="h${vs.count }_li"><a href="${ctx }/new/detail?id=${list.id}">
	<img src="${ctx}${showpath}${list.fileDir}${list.fileName}" width="368" height="200" />
	<span>${list.title }</span>
</a></li>
</c:forEach>
<c:forEach items="${secondnewlist }" varStatus="vs" var="list" begin="1" end="2" >
<li class="h${vs.count + 1 }_li"><a href="${ctx }/new/detail?id=${list.id}">
	<img src="${ctx}${showpath}${list.fileDir}${list.fileName}" width="178" />
	<span>${list.title }</span>
</a></li>
</c:forEach>
</ul>
<ul class="zxxq_wz_ul">
<c:forEach items="${secondnewlist }"  var="list" begin="3" end="8" varStatus="vs">
	<li class="<c:if test="${vs.first }">wz_ul_h</c:if>"><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></li>
</c:forEach>
<c:forEach items="${secondnewlist }"  var="list" begin="9" end="13" varStatus="vs">
	<li class="<c:if test="${vs.first }">wz_ul_h mar_top</c:if>"><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></li>
</c:forEach>
</ul>
<div class="clear"></div>
</div>
<div class="zxxq_bottom">
<ul class="zxxq_bot_left">
<li class="b_h_li">
<c:forEach  items="${secondnewlist }"  var="list" begin="14" end="14" varStatus="vs">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}${showpath}${list.fileDir}${list.fileName}" width="80" height="70" />
</a>
<div class="xq">
<a href="${ctx }/new/detail?id=${list.id}">${list.title }</a>
<span>${list.showTitle }</span>
</div>
</c:forEach>
</li>
<c:forEach  items="${secondnewlist }"  var="list" begin="15" end="20" >
<li><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></li>
</c:forEach>
 </ul>
<ul class="zxxq_bot_left">
<c:forEach  items="${secondnewlist }"  var="list" begin="21" end="21" varStatus="vs">
<li class="b_h_li">
<a class="b_h_li_lit" href="new_xq.html">
<img src="${ctx}${showpath}${list.fileDir}${list.fileName}" width="80" height="70" /></a>
<div class="xq">
<a href="${ctx }/new/detail?id=${list.id}">${list.title }</a>
<span>${list.showTitle }</span>
</div>
</li>
</c:forEach>
<c:forEach  items="${secondnewlist }"  var="list" begin="22" end="27" varStatus="vs">
<li><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></li>
</c:forEach>
 </ul>
<div class="clear"></div>
</div>
</div>
</div>

</div>
<div class="zx_bottom_right">
<div class="ad_new1">
<c:forEach items="${advertise2 }" var="list" begin="0" end="0">
<a href="${list.url }"><img src="${ctx}${showpath}${list.thumbnail}" /></a>
</c:forEach>
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
<c:forEach items="${advertise1 }" var="list" begin="0" end="0">
<a href="${list.url }"><img src="${ctx}${showpath}${list.thumbnail}" height="300" /></a>
</c:forEach>
</div> 
</div>
<div class="clear"></div>
</div>
</div>
</div>
<jsp:include page="../../common/foot_main.jsp" />
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