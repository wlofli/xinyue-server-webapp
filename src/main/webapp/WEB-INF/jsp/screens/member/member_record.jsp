<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
<title>普通会员_企业档案</title>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="../member/tree.jsp"%>
			<div class="hy_right">
				<div class="hy_top">
					<div class="bt">
						<strong>企业档案</strong>
					</div>
				</div>
				<c:if test="${recordType eq 'applicant'}">
					<%@ include file="../member/applicant.jsp"%>
				</c:if>
				<c:if test="${recordType eq 'company'}">
					<%@ include file="../member/company.jsp"%>
				</c:if>
				<c:if test="${recordType eq 'business'}">
					<%@ include file="../member/business.jsp"%>
				</c:if>
				<c:if test="${recordType eq 'estate'}">
					<%@ include file="../member/realEstate.jsp"%>
				</c:if>
				<c:if test="${recordType eq 'debt'}">
					<%@ include file="../member/debt.jsp"%>
				</c:if>
				<c:if test="${recordType eq 'document'}">
					<%@ include file="../member/document.jsp"%>
				</c:if>
				<%-- <c:if test="${recordType eq 'rating'}">
					<%@ include file="../member/rating.jsp"%>
				</c:if> --%>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>
</html>