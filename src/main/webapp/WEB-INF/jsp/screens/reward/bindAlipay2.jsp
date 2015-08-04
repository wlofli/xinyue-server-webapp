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
</script>
</head>

<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
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
<p class="wdt_905"><span>验证码：</span><input type="text" class="t2" />
<input type="button" class="b2" value="获取验证码" /> <a href="#" class="jbxx">收不到短信/语音验证码?</a> </p>

<p class="wdt_905"><input type="button" onclick="save()" value="下一步" class="b1" /></p>
</form>
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
