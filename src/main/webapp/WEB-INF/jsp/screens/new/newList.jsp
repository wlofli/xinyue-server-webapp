<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>新越网新闻列表页面</title>
<%@include file="../../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx }/css/jquery.jslides.css" media="screen" />
<script src="../js/tab.js"  type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.jslides.js"></script>

</head>


<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
</div> 
<!--中间部分-->
<div class="nr_main">
<div class="nr_center">
<div class="position">
<div class="site"><i class="site_tb"></i><a href="${ctx }/new/homelist">网站首页</a>&gt;<span>新闻列表</span><div class="clear"></div></div>
</div>

</div>
<div class="pro_xq">
<div class="pro_xq_left">
<ul class="new_list">
<c:forEach items="${newtypelist }" var="list" >
<li>
<p>
<a href="new_xq.html" class="new_lit">
<img src="../images1/cp_icon4.png" width="110px" /></a>
<div class="new_xq">
<p><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a><span><fmt:formatDate value="${list.sendDate }" pattern="yyyy-MM-dd"/></span><div class="clear"></div></p>
<p>${list.showTitle }</p>
</div>
</li> 
</c:forEach>
 
</ul>
<div class="pagelist1">
<script type="text/javascript">
	var typeId = "${typeId}";
	function changePage(n){
// alert("in");
		window.location.href = "${ctx}/new/list?typeId=" + typeId + "&index= " + n;
	}
</script>
<%@include file="page.jsp" %>
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
<div class="zx_bt"><span>最新资讯</span><a href="${ctx }/new/list">更多&gt;</a><div class="clear"></div></div>
<div class="zx_lb">
<ul>
<c:forEach items="${newlist }" var="list" >
<Li><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></Li>
</c:forEach>
</ul>
</div>

</div>
<div class="ad_mk1">
<c:forEach items="${advertise1 }" var="list" varStatus="vs" begin="0"  end="0">
<a href="${list.url }">
<img src="${ctx }/${list.thumbnail}" /></a>
</c:forEach>
</div>

</div>
<div class="clear"></div>
</div>

</div>
<!--中间部分-->
<jsp:include page="../../common/foot_main.jsp" />

 
</body>
</html>
