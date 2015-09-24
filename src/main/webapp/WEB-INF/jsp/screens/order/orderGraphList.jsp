<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@include file="../../common/common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-实名认证</title>

<script type="text/javascript">
function changeStatus(){
	$("#searchForm").submit();
}
function changePage(n){
	$("#searchForm").attr("action","${ctx }/order/graph?index=" + n);
	changeStatus();
}
</script>
</head>
<body class="h_bj">
<div class="container">
<%@include file="../../common/head.jsp" %>
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<div class="ddxq_top">
<Ul class="sdlc_ul">
<li class="bt"><img src="../images/sdlc_bt.png" /></li>
<li class="lc_num1"><i></i><p><strong>1</strong><span>填写信息<br />提交申请</span></p></li>
<li class="lc_num2"><i></i><p><strong>2</strong><span>贷款顾问<br />辅导申请</span></p></li>
<li class="lc_num3"><i></i><p><strong>3</strong><span>资料审核<br />确认放款</span></p></li>
<li class="lc_num4"><i></i><p><strong>4</strong><span>贷后服务<br />提高信用</span></p></li> 
</Ul>
</div>
<div class="hy_right_bt">
<ul class="menu1" id="menu">
<li class=""><a href="${ctx }/member/list?param=orderlist">贷款订单列表</a></li>
<li class="hit"><a href="${ctx }/member/list?param=graph">贷款订单图表</a></li>  
</ul>
</div>
<sf:form action="${ctx }/order/graph?index=0" commandName="order" method="post" id="searchForm">
<div class="ssk"> 
<span>订单提交时间：</span>

<sf:input path="startTime" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
&nbsp;&nbsp;--
<sf:input path="endTime"   class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
<input type="button" class="b2" value="查询" onclick="changeStatus()"/>
</div>
</sf:form>
<!--
<div class="kong_ts">
<p>亲，你当前暂无贷款产品订单，我要<a href="#">立即申贷>></a></p>
</div>
 -->
<div class="tab">

<div class="hy_dd_nr">
<c:forEach items="${list }" var="list" varStatus="vs">
<div class="hy_dd_nr1"><span>订单号：<a href="#undone->不知道去哪里">${list.code }</a>&nbsp;&nbsp;&nbsp;&nbsp;订单提交日期：<strong><fmt:formatDate value="${list.createdTime }" pattern="yyyy-MM-dd h:m"/></strong></span> </div>
<div class="hy_dd_nr2">
<img src="../images/cp_tx.png" class="cp_tx" />
<div class="float_l_hy1">
<span>产品名称：<strong>${list.productName }</strong></span>
<span>所属机构：<strong>${list.bank }</strong></span>
<span>订单状态：<strong>${list.status }</strong></span>
</div>
<div class="float_y_hy">
<p>
<c:choose>
	<c:when test="${list.status == '需求填写中' || list.status == '等待新越网审核' }">
		<a class="float_y_hy_a" href="${ctx }/order/detail/document?id=${list.id}">附件补充</a>
		<a class="float_y_hy_a" href="${ctx }/order/detail/applicant?id=${list.id}">完善资料</a>
		<a class="float_y_hy_a" href="${ctx }/order/detail/applicant?id=${list.id}">查看详情</a>
		<a class="float_y_hy_a" href="javascript:deleteOrder('${list.id }')">取消订单</a>
	</c:when>
	<c:otherwise>
		<a class="float_y_hy_a" href="${ctx }/order/detail/applicant?id=${list.id}">查看详情</a>
	</c:otherwise>
</c:choose>
</p>
</div>
<div class="clear"></div>
</div>
<div class="hy_dd_nr3">
<c:choose>
	<c:when test="${list.status == '需求填写中' }">
		<img src="${ctx }/images/order_zt_bj.png" />
	</c:when>
	<c:when test="${list.status == '等待新越网审核'}">
		<img src="${ctx }/images/order_zt_bj1.png" />
	</c:when>
	<c:when test="${list.status == '放款成功' }">
		<img src="${ctx }/images/order_zt_bj4.png" />
	</c:when>
	<c:when test="${list.status == '新越网审核中' || list.status == '新越网审核通过' || list.status == '新越网审核不通过' }">
		<img src="${ctx }/images/order_zt_bj2.png" />
	</c:when>
	<c:otherwise>
		<img src="${ctx }/images/order_zt_bj3.png" />
	</c:otherwise>
</c:choose>
</div>
</c:forEach>
</div>

<!-- <div class="hy_dd_page"><span>共300条记录</span><a href="#" class="dd_page_n">上一页</a><span>第1/8页</span><a href="#" class="dd_page_h">下一页</a></div> -->
<%@ include file="../../common/page.jsp" %>

</div>
 
  
</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
