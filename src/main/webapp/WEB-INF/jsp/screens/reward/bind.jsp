<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-推荐奖励记录</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
<script type="text/javascript">


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
<li class="skzh1"><a class="skzh1_a" href="${ctx }/reward/addbind?type=alipay"><i></i><span>绑定支付宝</span></a><span class="xytx">新越网，可提现到支付宝</span></li>
<li class="skzh2"><a class="skzh2_a" href="${ctx }/reward/addbind?type=bank"><i></i><span>绑定银行卡</span></a>
<span class="xytx">新越网，可提现到银行卡。支持上百家银行，<a href="#undone">点此查看</a></span></li>
</ul> 
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
