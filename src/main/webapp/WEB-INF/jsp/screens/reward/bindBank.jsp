<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-绑定银行卡</title>
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
<span>绑定银行卡</span>
</div>

<div class="tab">
<div class="bdyhk1"></div>
<form action="${ctx }/reward/bindbank" method="post" id="form">
<p class="wdt_905"><span>银行卡号码：</span><input type="text" class="t1" /><span class="zs1">您已设置真实姓名为："刘**"，银行卡开户名必须与此一致才能顺利汇款<!--<a href="jbxx_hy.html" target="_blank" class="jbxx">查看详情</a>--></span></p>
<p class="wdt_905"><span>绑定银行：</span><img src="../images/zfb1.png" /><span class="yts">如果银行不对，请检查卡号或更换银行卡</span> </p>
<p class="wdt_905"><input type="button" value="确认绑定" onclick="save()"  class="b1" /></p>
</form>
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
