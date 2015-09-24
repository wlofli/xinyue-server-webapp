<%@page import="org.apache.xmlbeans.impl.xb.xsdschema.IncludeDocument.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-放款成功订单详情</title>
<%@include file="../../common/common.jsp" %>
<script type="text/javascript">
function save(){
	$("#form").submit();
}
</script>
</head>

<body class="h_bj">
<div class="container">
<%@include file="../../common/head.jsp" %>
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<div class="hy_top">
<div class="bt"><strong>订单确认</strong></div></div>
<div class="ddxq_top">
<div class="ddxq_nr">
<sf:form action="${ctx }/order/detail/evaluate" method="post" id="form">
<input type="hidden" name="id" value="${order.id }"/>
<span>订单号:<strong>${order.code }</strong></span><br />
<span>订单提交时间:<strong><fmt:formatDate value="${order.createdTime }" pattern="yyyy-MM-dd h:m"/></strong></span><br />
 <span>企业名称:<strong>${order.companyInfo}</strong></span><br />
<span>企业申贷额度:<strong>${order.credit }万元</strong></span><br />
<span>申请人姓名:<strong>${order.applicatPerson }</strong></span><br />
<span>联系方式:<strong>${order.linkPhone }</strong></span><br />
<span>产品名称:<a href="#">${order.productName }</a></span><br />
<span>产品所属机构:<strong>${order.bank }</strong></span><br />
<span>所在地区:<strong>${order.province }${order.city }${order.zone }</strong></span><br />
<span>新越网审核通过时间:<strong><fmt:formatDate value="${order.taxAuditeTime }" pattern="yyyy-MM-dd h:m"/></strong></span><br />
<span>新越网审核人员:<strong>${order.taxAuditePerson }</strong></span><br />
<span>信贷经理受理时间:<strong><fmt:formatDate value="${order.blankAuditeTime }" pattern="yyyy-MM-dd h:m"/></strong></span><br />
<span>信贷经理姓名:<strong>${order.blankAuditePerson }</strong></span><br />
<span>放款时间:<strong><fmt:formatDate value="${order.auditeTime }" pattern="yyyy-MM-dd h:m"/></strong></span><br />
<span>放款金额:<strong>${order.creditReal }</strong>万元</span><br />
<c:choose>
	<c:when test="${order.level != null }">
		<span>评价星级:<strong>${order.level }</strong>颗星</span><br />
		<span>评价内容:<strong>${order.evaluateContent }</strong></span><br />
		<span>评价时间:<strong><fmt:formatDate value="${order.evaluationTime }" pattern="yyyy-MM-dd h:m"/></strong></span><br />
	</c:when>
	<c:otherwise>
		<span class="btn_span"><input type="button" class="btn" onclick="save()" value="确定收款" /></span>
	</c:otherwise>
</c:choose>
</sf:form>
</div>
</div> 
 
</div> 
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
