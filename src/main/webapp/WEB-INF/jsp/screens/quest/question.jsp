<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-问答管理</title>
<%@ include file="../../common/common.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="../member/tree.jsp"%>
			<div class="hy_right">
				<div class="hy_right_bt">
					<span>我的提问</span>
				</div>

				<div class="tab">
					<ul class="wdlb">
						<c:forEach items="${questpage.data }" var="quest">
							<li class="b_b_n">
								<div class="wd_left">
									<c:choose>
										<c:when test="${quest.sign == '审核通过' }">
										<a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/detail?questid=${quest.id}'">${quest.title }</a>
										</c:when>
										<c:otherwise>
										<a href="javascript:void(0)" >${quest.title }</a>
										</c:otherwise>
									</c:choose>
									
									<p>
										<span class="wds">${quest.createtime }</span><span class="wds">回复：${quest.num }个</span>
									</p>
								</div> <span class="wd_right">${quest.sign }</span>
							</li>
						</c:forEach>
					</ul>

					<p:page url="${ctx }/member/questionctr/show" pageData="${questpage}"></p:page>


				</div>

			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
<script type="text/javascript">
	function changePage(url, topage) {
	
		document.href.location=url+topage;
		
	}
</script>
</body>
</html>