<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
var record = ${outline.awardRemain};


function save(){
	$("#form").valid();
	if($("#withdrawPrice").val() > record){
		alert("提现金额必须小于或等于奖励账户余额");
		return;
	}
	
	
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
<div class="hy_top">
<div class="bt"><strong>推荐奖励提现</strong></div>
<div class="nr">
<span class="f_l_s">奖励账户余额：<strong>${outline.awardRemain }</strong>元</span>
<span class="f_r_s">累计奖励金额：<strong>${outline.rewardTotal }</strong>元</span>
<span class="f_r_s">累计奖励提现金额：<strong>${outline.withdrawTotal }</strong>元</span></div>
</div> 
<div class="tab">
<form action="${ctx }/reward/addwithdraw" id="form" method="post">
<p><span>提现金额：</span><input type="text" id="withdrawPrice" name="withdrawPrice" class="t1 number required" /><span class="yts">提现金额必须小于或等于奖励账户余额</span></p>
<p>
<input type="button" value="确认提现" name="withdrawPrice" onclick="save()"  class="b1" /></p>
</form>
</div>

</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>