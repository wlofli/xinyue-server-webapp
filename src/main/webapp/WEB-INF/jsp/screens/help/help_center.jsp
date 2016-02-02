<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_帮助中心</title>
<%@ include file="../../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
	</div>
	<div class="nr_main">
		<div class="nr_center">
			<div class="position">
				<div class="site">
					<i class="site_tb"></i>
					<a href="index.html">网站首页</a>&gt;
					<a href="help.html" class="a">帮助中心</a>&gt;
					<span>${helpShow.name}</span>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="pro_xq_left_bt">
					<span id="id_title">${helpShow.name}</span>
				</div>
				<div class="pro_jbxq" id="id_contact">
					${helpShow.content}
				</div>
			</div>
			<div class="pro_xq_right">
				<div class="wd_fl">
					<div class="wd_bt">
						<span>帮助中心</span>
					</div>
					<div class="wd_lb">
						<dl class="wd_fl1">
							<c:forEach items="${helpers}" var="helpT" varStatus="vs">
								<dd id="id_right_${vs.index}">
									<a href="${ctx}/help/detail?id=${helpT.code}">${helpT.name}</a>
								</dd>
							</c:forEach>
						</dl>
						<div class="clear"></div>
					</div>
				</div>
				<div class="ad_mk1">
					<c:choose>
						<c:when test="${empty advert.thumbnail }">
							<a href="#"><img src="${ctx}/images1/ad1.jpg" /></a>
						</c:when>
						<c:otherwise>
							<a href="${advert.url}"><img src="${showPath}${advert.directory}${advert.thumbnail}" height="422" width="400"/></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@ include file="../../common/foot_main.jsp"%>
</body>
</html>