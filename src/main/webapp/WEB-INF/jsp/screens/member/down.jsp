<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-用户手册下载</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="tree.jsp"%>
			<div class="hy_right">
				<div class="hy_right_bt">
					<ul class="menu1" id="menu">
						<span>下载中心</span>
					</ul>
				</div>

				<div class="tab">
					<c:forEach items="${finfo.data }" var="file">
						<p class="xzzx">
							<i><img src="${ctx }/images/xy_icon.png" /></i><a class="span">${file.name }</a><a
								href="javascript:void(0)" onclick="document.location.href='${ctx}/member/docctr/filedown?file=${file.fileDir }'" class="down">立即下载</a>
						</p>
					</c:forEach>
				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>

</body>
</html>