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
			<div class="find_pw1"></div>
			<div class="c_f">
				<sf:form action="${ctx}/login/find/psw?step=2" commandName="pswInfo" method="post" id="pswForm">
					<div class="f_wbk">
						<span class="f_bt">手机号码：</span><sf:input path="contactPhone" cssClass="f_yzm" disabled="true" id="tel"/>
						<input type="button" class="btn_sjyz" value="获取验证码" id="code_btn" onclick="sendCode()" />
					</div>
					<div class="f_wbk">
						<span class="f_bt">手机验证码：</span>
						<input id="check_c" name="checkCode" value="" class="f_sjh" />
					</div>
					<div class="f_tj">
						<input type="submit" value="下一步" class="f_btn" />
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
			checkCode:{
				required:true,
				remote:{
                    type: "post",
                    url:"${ctx}/common/check/code",
                    data:{
                    	checkCode: function(){return $("#check_c").val();}
                    }
              }
			}
		},
		messages: {
			checkCode:{
				remote:"<span class='zc_zs'>* 手机验证码错误</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
});
function sendCode(){
	var tel = $("#tel").val();
	if (tel == "") {
		alert("请填写手机号！");
		return;
	}
	$.ajax({
		url:"${ctx}/send/tel/code?phone="+tel,
		type:"post",
		success:function(data){
			if (data=="true") {
				timer();
			} else {
				alert("验证码发送失败！");
			}
		}
	});
}
var time = 61;
function timer(){
	if (time == 1) {
		$("#code_btn").val("获取验证码");
		$("#code_btn").removeClass("btn_sjyz1");
		$("#code_btn").addClass("btn_sjyz");
		$("#code_btn").removeAttr("disabled");
		time = 61;
	} else {
		$("#code_btn").removeClass("btn_sjyz");
		$("#code_btn").addClass("btn_sjyz1");
		$("#code_btn").attr("disabled","disabled");
		time = time - 1;
		$("#code_btn").val(time+"秒后重新获取");
		setTimeout(function(){timer()},1000);
	}
}
</script>
</html>