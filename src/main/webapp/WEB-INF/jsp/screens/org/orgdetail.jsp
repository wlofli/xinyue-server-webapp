<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网融资机构详情页面</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="interval" value=" "></c:set>
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
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/case?orgid=${org.id }'">成功案例</a></li>
						<li class="hit"><a href="javascript:void(0)">机构档案</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/credit?orgid=${org.id }'">贷款咨询</a></li>
					</ul>
				</div>
				<div class="pro_xq_left_nr">
					<div class="xdjl_xq">
						<div class="jg_tx">
							<c:if test="${empty org.image }" var="orgimage"><img src="${ctx }/images1/jg_icon.jpg" width="180" height="120"/></c:if>
							<c:if test="${not orgimage }"><img src="${showpath }org/${org.image}" width="180" height="120"/></c:if>
							<a href="javascript:void(0)">${org.name }</a>
						</div>
						<div class="xdjl_xx">
							<p>
								<span>成立时间：</span>${org.establish }
							</p>
							<p>
								<span>机构地址：</span>${org.site }
							</p>
							<p>
								<span>业务区域：</span>
								<c:set var="subName"></c:set>
								<c:forEach items="${org.stat }" var="scity">
									<c:set value="${subName}${interval}${scity.subName }" var="subName"></c:set>
								</c:forEach>
								<c:out value="${subName }"></c:out>
							</p>
							<p>
								<span>擅长业务：</span>
								<c:set var="ptName"></c:set>
								<c:forEach items="${org.ptype }" var="otype">
									<c:set value="${ptName}${interval}${otype.name }" var="ptName"></c:set>
								</c:forEach>
								<c:out value="${ptName }"></c:out>
							</p>
							<p>
								<span>机构规模：</span>${org.scaleName }
							</p>
						</div>
					</div>

					<div class="pro_xq_left_bt">
						<span>机构介绍</span>
					</div>
					<div class="pro_jbxq">

						<p>${org.description }
						</p>
					</div>
				</div>
			</div>
			<jsp:include page="orgcommon.jsp"></jsp:include>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
</body>
</html>