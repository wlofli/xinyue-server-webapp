<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-推荐奖励记录</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
<script type="text/javascript">
function withdraw(){
	
}
</script>
</head>

<body class="h_bj">
<div class="container">
<%@include file="../../common/head.jsp" %>
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<div class="hy_top">
<div class="bt"><strong>绑定提现账户</strong></div>
</div> 
<div class="tab">
<ul class="sd_skzh">
<li class="skzh1"><a class="skzh1_a" href="${ctx }/member/reward/addwithdraw2"><i></i><span>提现支付宝</span></a><span class="xytx">已绑定：<strong>188***3223</strong></span></li>
<li class="skzh2"><a class="skzh2_a" href="${ctx }/member/reward/addwithdraw2"><i></i><span>提现银行卡</span></a><span class="xytx">已绑定：中信银行 <strong>6222****3232</strong></span></li>
</ul> 
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>