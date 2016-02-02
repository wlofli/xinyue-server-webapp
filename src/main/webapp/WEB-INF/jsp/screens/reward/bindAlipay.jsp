<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<%@include file="../../common/common.jsp" %>
<title>普通会员-绑定支付宝</title>
<link rel="icon" href="../images/moke.ico" />
<script type="text/javascript">
function save(){
	$("#form").submit();
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
<span>绑定支付宝</span>
</div>

<div class="tab">
<div class="bdzfb1"></div>
<form action="${ctx }/member/reward/bindalipay" method="post" id="form">
<p class="wdt_905"><span>支付宝账号：</span><input type="text" name="account" class="t1" />
<span class="yts">您已设置真实姓名为：刘某某，支付宝开户名必须与此一致才能顺利打款.</span></p>
<p class="wdt_905"><input type="button" onclick="save()"  value="确认绑定" class="b1" /></p>
</form>
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
