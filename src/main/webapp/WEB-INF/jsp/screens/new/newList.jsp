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
<script type="text/javascript" src="${ctx }/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.jslides.js"></script>

</head>


<body class="h_bj">
<div class="container">
<%@include file="../../common/head.jsp" %>
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
<c:choose>
	<c:when test="${empty list.fileName }">
		<img src="${ctx}/images1/cp_icon1.png" width="110px" height="75px" />
	</c:when>
	<c:otherwise>
		<img src="${list.fileDir }${list.fileName }" width="110px" height="75px" />
	</c:otherwise>
</c:choose>
</a>
<div class="new_xq">
<p><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a>
<span><fmt:formatDate value="${list.modifiedTime }" pattern="yyyy-MM-dd"/></span><div class="clear"></div></p>
<p>${list.showTitle }</p>
</div>
</li> 
</c:forEach>
 
</ul>
<div class="pagelist1">
<script type="text/javascript">
	var typeId = "${typeId}";
	function changePage(n){
alert(n);
		window.location.href = "${ctx}/new/list?typeId=" + typeId + "&index= " + n;
		
	}
</script>
<%@include file="page.jsp" %>
</div>
</div>
<jsp:include page="../../common/right_detail.jsp"></jsp:include>

<div class="clear"></div>
</div>

</div>
<!--中间部分-->
<%@ include file="../../common/foot_main.jsp"%>


 
</body>
</html>
