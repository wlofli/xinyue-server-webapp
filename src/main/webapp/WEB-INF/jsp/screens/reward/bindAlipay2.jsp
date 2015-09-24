<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-绑定支付宝</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
<script type="text/javascript">
function save(){
	$("#form").submit();
}
function send(){
	$.ajax({
		url:'${ctx}/member/commonctr/sendnote',
		type:'post',
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			if(data == 'success'){
				alert("发送成功");
				timer();
			}else{
				alert("发送失败");
			}
		}
	});
}

var time = 61;
function timer(){
	if (time == 1) {
		$("#verify_code").val("获取验证码");
		$("#verify_code").removeClass("b3");
		$("#verify_code").addClass("b2");
		$("#verify_code").removeAttr("disabled");
		time = 61;
	} else {
		$("#verify_code").removeClass("b2");
		$("#verify_code").addClass("b3");
		$("#verify_code").attr("disabled","disabled");
		time = time - 1;
		$("#verify_code").val(time+"秒后重新获取");
		setTimeout(function(){timer()},1000);
	}
}

</script>
</head>

<body class="h_bj">
<div class="container">
<%@include file="../../common/head.jsp" %>
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right"> 
<div class="hy_right_bt">
<span>验证手机号</span>
</div>

<div class="tab">
<div class="bdzfb2"></div>
<form action="${ctx }/reward/bindalipay2" method="post" id="form">
<p class="wdt_905"><span>已绑定手机：</span><span class="ytxx_hy">${phone }</span></p>
<p class="wdt_905"><span>验证码：</span><input type="text" name="authcode" class="t2" />
<input type="button" onclick="send()" class="b2" id="verify_code" value="获取验证码" /> <a href="#" class="jbxx">收不到短信/语音验证码?</a> </p>

<p class="wdt_905"><input type="button" onclick="save()" value="下一步" class="b1" /></p>
</form>
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
