<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_找回密码</title>
<%@ include file="../../common/common.jsp" %>
</head>
<body class="bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="center">
			<div class="find_pw3"></div>
			<div class="c_f">
				<div class="f_m_cg">
					<h1>恭喜您，密码修改成功！</h1>
					<a href="${ctx}/login/member">返回登录 ></a>
				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
</body>
</html>