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
			<div class="find_pw2"></div>
			<div class="c_f">
				<sf:form action="${ctx}/login/find/psw?step=3" commandName="pswInfo" method="post" id="pswForm">
					<div class="f_wbk">
						<span class="f_bt">新密码：</span><sf:password path="password" cssClass="f_sjh"/>
						<sf:hidden path="contactPhone"/>
					</div>
					<div class="f_wbk">
						<span class="f_bt">确认密码：</span>
						<input type="password" value="" class="f_sjh" name="passwordConfirm" />
					</div>
					<div class="f_tj">
						<input type="submit" value="确定修改" class="f_btn" />
					</div>
				</sf:form>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#pswForm").validate({
		rules:{
			password:"required",
			passwordConfirm: {
				equalTo:"#password"
			},
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
});
</script>
</html>