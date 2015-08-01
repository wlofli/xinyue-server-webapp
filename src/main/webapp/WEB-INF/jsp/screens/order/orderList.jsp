<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="../../common/common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-贷款订单</title>
<script type="text/javascript">
	function changeStatus(){
		$("#searchForm").submit();
	}
	
	function changePage(n){
		$("#searchForm").attr("action","${ctx }/order/list?index=" + n);
		changeStatus();
	}
	
	function deleteOrder(id){
		$.ajax({
			url:"${ctx}/order/delete?list=" + id,
			type:'post',
			async:false,
			success:function(data){
				if(data == 'success'){
					alert('取消成功');
					changeStatus();
				}else{
					alert('取消失败');
				}
			}
		});
	}
</script>
</head>

<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />

<div class="hy_right">
<div class="ddxq_top">
<ul class="sdlc_ul">
<li class="bt"><img src="../images/sdlc_bt.png" /></li>
<li class="lc_num1"><i></i><p><strong>1</strong><span>填写信息<br />提交申请</span></p></li>
<li class="lc_num2"><i></i><p><strong>2</strong><span>贷款顾问<br />辅导申请</span></p></li>
<li class="lc_num3"><i></i><p><strong>3</strong><span>资料审核<br />确认放款</span></p></li>
<li class="lc_num4"><i></i><p><strong>4</strong><span>贷后服务<br />提高信用</span></p></li> 
</ul>
</div>
<div class="hy_right_bt">
<ul class="menu1" id="menu">
<li class="hit"><a href="${ctx }/member/list?param=orderlist">贷款订单列表</a></li>
<li class=""><a href="${ctx }/member/list?param=graph">贷款订单图表</a></li>  
</ul>
</div>
<!--
<div class="kong_ts">
<p>亲，你当前暂无贷款产品订单，我要<a href="#">立即申贷>></a></p>
</div>-->
<div class="tab">
<table class="sczl_table">
<thead>
<sf:form action="${ctx }/order/list?index=0" commandName="order" method="post" id="searchForm">
<tr>
<td colspan="1">序号</td>
<td colspan="2">订单号</td>
<td colspan="2">产品名称</td>
<td colspan="2">产品所属机构</td>
<td colspan="2">
<sf:select path="sort" class="s3" onchange="changeStatus()">
	<sf:option value="">订单提交时间</sf:option>
	<sf:option value="0">升序排列</sf:option>
	<sf:option value="1">降序排列</sf:option>
</sf:select>
</td>
<td colspan="1">贷款额度<br />(万元)</td>
<td colspan="2">
<sf:select path="status" class="s3" onchange="changeStatus()">
	<sf:option value="">订单状态</sf:option>
	<sf:options items="${search}" itemLabel="value"  itemValue="key" />
</sf:select>
</td>
<td colspan="2">操作</td>
</tr>
</sf:form>
</thead>
<tbody class="h_z">
<c:forEach items="${list }" var="list" varStatus="vs">
<tr>
<td colspan="1"><c:out value="${vs.count + (page.pageNo)*10}" /></td>
<td colspan="2">${list.code }</td>
<td colspan="2"><a href="undone->不知道去哪">${list.productName }</a></td>
<td colspan="2">${list.bank }</td>
<td colspan="2"><fmt:formatDate value="${list.createdTime }" pattern="yyyy-MM-dd h:m"/></td>
<td colspan="1">${list.credit }</td>
<td colspan="2">${list.status }</td>
<td colspan="2">
<c:choose>
	<c:when test="${list.status == '需求填写中' || list.status == '等待新越网审核' }">
		<a href="${ctx }/order/detail/document?id=${list.id}">附件补充</a>|<a href="${ctx }/order/detail/applicant?id=${list.id}">完善资料</a>
		<a href="${ctx }/order/detail/applicant?id=${list.id}">查看详情</a>|<a href="javascript:deleteOrder('${list.id }')">取消订单</a>
	</c:when>
	<c:otherwise>
		<a href="${ctx }/order/detail/applicant?id=${list.id}">查看详情</a>
	</c:otherwise>
</c:choose>
</td>
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
