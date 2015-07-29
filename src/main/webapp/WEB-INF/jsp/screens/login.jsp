<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_普通会员登录</title>
<%@ include file="../common/common.jsp" %>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../common/head.jsp"%>
		<div class="center">
			<div class="c_bt">
				<h1>普通会员登录</h1>
				<span>还没有账户？<a href="${ctx}/register/member">立即注册></a></span>
			</div>
			<div class="c_nr">
				<sf:form action="${ctx}/login/submit" commandName="loginInfo" method="post" id="loginForm">
					<div class="wbk">
						<sf:input path="loginName" class="l_yhm required" placeholder="请输入用户名" />
					</div>
					<div class="wbk">
						<sf:password path="password" class="l_mm required" placeholder="请输入密码" />
					</div>
					<div class="yzm">
						<span>验证码:</span><input id="checkCode" value="" class="y" name="checkC" />
						<a href="javascript:void(0)" onClick="document.getElementById('aucode').src='${ctx}/imgauthcode?'+getSec()">
							<img id="aucode" border="0" src="${ctx}/imgauthcode" />
						</a>
					</div>
					<div class="btn">
						<input type="submit" value="确认登录" class="l_btn" />
					</div>
					<div class="mdl">
						<input type="checkbox" class="left" checked="checked"/><span>5天内免登录</span><a
							href="../html_gg/find_password.html" class="f_lj">忘记密码？</a>
					</div>
				</sf:form>
				<div class="smdl">
					<img src="../images/smdl.jpg" /> <span>扫一扫微信直接登录</span>
					<p class="l_fs">
						<span>其他方式登录：</span>
						<a href="#" class="qq"></a>
						<a href="#" class="wx"></a><a href="#" class="xl"></a>
					</p>
				</div>
			</div>
		</div>
		<%@ include file="../common/foot.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$("#loginForm").validate({
		rules:{
			checkC:{
				required:true,
				remote:{
					type: "post",
                    url: "${ctx}/login/check/code",
                    data:{
                    	checkCode: function(){return $("#checkCode").val();}
                    }
				}
			}
		},
		messages: {
			checkC:{
				required:"<span class='zc_zs'>* 请输入验证码</span>",
				remote:"<span class='zc_zs'>* 验证码不正确</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
	
	var message = "${message}";
	if (message != "" && message != null) {
		alert(message);
	}
});

function getSec(){
	var myDate = new Date();
	return myDate.getTime();
}
</script>
</html>