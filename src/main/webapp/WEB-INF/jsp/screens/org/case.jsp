<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网融资机构详情页面</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
	</div>

	<!--中间部分-->
	<div class="nr_main">
		<div class="nr_center">
			<div class="position">
				<div class="site">
					<i class="site_tb"></i><a href="javascript:void(0)">网站首页</a>&gt;<a
						href="javascript:void(0)" onclick="document.location.href='${ctx}/org/show'" class="a">融资机构</a>&gt;<span>融资机构详情-${org.shortName }</span>
					<div class="clear"></div>
				</div>
			</div>

		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="pro_xq_left_bt">
					<ul class="menu1">
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/detail?orgid=${org.id }'">机构首页</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/pro?orgid=${org.id }'">贷款产品</a></li>
						<li class="hit"><a href="javascript:void(0)">成功案例</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/org?orgid=${org.id }'">机构档案</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/credit?orgid=${org.id }'">贷款咨询</a></li>
					</ul>
				</div>
				<div class="pro_xq_left_nr">
					<div class="tj_xdjl">
						<span>成功案例</span>
					</div>
					<ul class="tj_xd_lb">
						<c:forEach items="${pagecase.data }" var="cases">
							<li><span class="dkje"><strong>${cases.loanAmount }</strong>万</span>
								<div class="xd_js">
									<span>申请产品:</span><a href="javascript:void(0)" class="name">${cases.productName }</a><span>信贷经理：${cases.creditManagerName }</span>
									<div class="clear"></div>
									<span>放款时长：${cases.loanDays }天</span><span>贷款人：${cases.applicantCompany }</span>
									<div class="clear"></div>
									<span>详细描述：${cases.description }</span>
									<div class="clear"></div>
								</div> <span class="fksj">放款时间：${cases.loanDate }</span></li>
						</c:forEach>
					</ul>

					<div class="pagelist1">
						<p:pagecommon url="${ctx }/org/case?orgid=${orgid}&topage=" pageData="${pagepro }"></p:pagecommon>
					</div>
				</div>
			</div>
			<jsp:include page="orgcommon.jsp"></jsp:include>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	<script type="text/javascript">
		function changePage(url , topage){
			var uri = url+topage;
			
			document.location.href=uri;
		}
	</script>
</body>
</html>