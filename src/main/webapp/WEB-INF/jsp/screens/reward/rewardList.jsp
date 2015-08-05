<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<%@include file="../../common/common.jsp" %>
<title>普通会员-推荐奖励记录</title>
<link rel="icon" href="../images/moke.ico" />
<script type="text/javascript">
function getList(){
	$("#searchForm").submit();
}


function changePage(n){
	$("#searchForm").attr("action","${ctx }/reward/reward/list?index="+n);
	getList();
}



</script>
</head>

<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<div class="hy_top">
<div class="bt"><strong>推荐奖励提现</strong></div>
<div class="nr"><span class="f_l_s">奖励账户余额：<strong>${outline.remainingSum }</strong>元</span>
<a href="${ctx }/member/list?param=appwithdraw" class="f_l_s">申请提现</a>
<span class="f_r_s">累计奖励金额：<strong>${outline.rewardTotal }</strong>元</span>
<span class="f_r_s">累计奖励提现金额：<strong>${outline.withdrawTotal }</strong>元</span></div>
</div>
<div class="hy_right_bt">
<ul class="menu1" id="menu">
<li class="hit"><a href="${ctx }/member/list?param=reward">奖励记录</a></li>
<li class=""><a href="${ctx }/member/list?param=withdraw">提现记录</a></li>  
</ul>
</div>
<sf:form action="${ctx }/reward/reward/list" commandName="search" method="post" id="searchForm">
<div class="ssk"><span>开始日期：</span>
<sf:input path="startTime" class="t1"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
<span>结束日期：</span>
<sf:input path="endTime" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
<input type="button" class="b2" value="查询" onclick="getList()"/></div>
</sf:form>
<!--
<div class="kong_ts">
<p>亲，你还没有推荐会员哦，<a href="#">立即推荐>></a></p>
</div>-->
<div class="tab">
<table class="sczl_table">
<thead>
<tr>
<td colspan="2">时间</td>
<td colspan="2">来源</td>
<td colspan="2">订单号</td>
<td colspan="2">会员姓名</td>
<td colspan="2">会员手机号</td>
<td colspan="3">备注</td>
<td colspan="2">流水号</td>
<td colspan="2">奖励金额</td>
<td colspan="2">奖励余额</td> 
</tr>
</thead>
<tbody class="h_z">
<c:forEach items="${rewardList }" var="list" varStatus="vs">
<tr>
<td colspan="2"><fmt:formatDate value="${list.rewardTime }" pattern="yyyy-MM-dd"/></td>
<td colspan="2">${list.rewardType }</td>
<td colspan="2">${list.id }</td>
<td colspan="2">${member.contactName }</td>
<td colspan="2">${member.contactPhone }</td>
<td colspan="3">${list.remark } </td>
<td colspan="2">${list.sericalNumber }</td>
<td colspan="2">${list.rewardAmount }</td>
<td colspan="2">${list.currentAmount }</td>
</tr>
</c:forEach>
</tbody>
 
</table>
<%@ include file="../../common/page.jsp" %>
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
