<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
<script type="text/javascript">
function save(n){
// 	alert("in");
	if(!checkOrder()){
		return;
	}
	$.ajax({
		url:"${ctx}/order/save/business",
		data:$("#businessForm").serialize(),
		type:'post',
		success:function(data){
			if(data == "success"){
				alert("success");
			}else{
				alert("fail")
			}
		}
	});
	
}

</script>
</head>
<body class="h_bj">
<div class="container">
<%@include file="../../common/head.jsp" %>
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<jsp:include page="detailHead.jsp" />
<div class="tab">
<sf:form action="${ctx }/order/detail/business" commandName="businessInfos" method="post" id="businessForm">
<input type="hidden" name="orderId" value="${order.id }">
<c:forEach begin="0" end="2" varStatus="vs">
<p class="qiye_bt"><strong>${businessInfos.years[vs.index]}</strong></p>
<p><span>年度总销售收入(万)：</span><sf:input path="totalSales[${vs.index}]" class="t1"/></p>
<p><span>年度订单总金额(万)：</span><sf:input path="monthOrderMoneys[${vs.index}]" class="t1"/></p>
<p><span>年度增值税纳额(万)：</span><sf:input path="totalVATs[${vs.index}]" class="t1"/></p>
<p><span>年度月均水费(元)：</span><sf:input path="monthWaterMoneys[${vs.index}]" class="t1"/></p>
<p><span>年度月均电费(元)：</span><sf:input path="monthElectricMoneys[${vs.index}]" class="t1"/></p>
<p><span>年度所得税纳额(万)：</span><sf:input path="totalIncomeTaxs[${vs.index}]" class="t1"/></p>
<sf:hidden path="ids[${vs.index}]"/>
<sf:hidden path="years[${vs.index}]"/>
</c:forEach>
</sf:form>
<p><input type="button" value="保存" class="b1" onclick="save(0)" /><input type="button" value="下一步" class="b4" onclick="save(1)"/></p>
</div>
</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>
</body>
</html>
