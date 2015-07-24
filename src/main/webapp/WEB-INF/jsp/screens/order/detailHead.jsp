<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@include file="../../common/common.jsp" %>
<div class="ddxq_top">
<div class="ddlc">
<c:choose>
	<c:when test="${order.status == '需求填写中' }">
		<img src="${ctx }/images/order_zt_bj.png" />
	</c:when>
	<c:when test="${order.status == '等待新越网审核'}">
		<img src="${ctx }/images/order_zt_bj1.png" />
	</c:when>
	<c:when test="${order.status == '放款成功' }">
		<img src="${ctx }/images/order_zt_bj4.png" />
	</c:when>
	<c:when test="${order.status == '新越网审核中' || order.status == '新越网审核通过' || order.status == '新越网审核不通过' }">
		<img src="${ctx }/images/order_zt_bj2.png" />
	</c:when>
	<c:otherwise>
		<img src="${ctx }/images/order_zt_bj3.png" />
	</c:otherwise>
</c:choose></div>
<div class="ddxq_nr">
<span>订单号:<strong>${order.code }</strong></span>
<span>订单提交时间:<strong><fmt:formatDate value="${order.createdTime }" pattern="yyyy-MM-dd h:m"/></strong></span>
<span>申请人姓名:<strong>${order.applicatPerson }</strong></span>
<span>联系方式:<strong>${order.linkPhone }</strong></span>
<span>产品名称:<a href="#">${order.productName }</a></span>
<span>产品所属机构:<strong>${order.bank }</strong></span>
<span>企业名称:<strong>${order.companyInfo }</strong></span>
<span>所在地区:<strong>${order.province }${order.city }${order.zone }</strong></span>
</div>
</div>