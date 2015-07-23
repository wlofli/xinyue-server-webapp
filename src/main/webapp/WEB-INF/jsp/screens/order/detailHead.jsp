<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<div class="ddxq_top">
<div class="ddlc"><Img src="${ctx }/images/order_zt_bj4.png" /></div>
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