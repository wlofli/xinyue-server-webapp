<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
<script type="text/javascript">
$().ready(function(){
	$("#debtForm").validate({
		rules:{
			"debt.isBig":{
				required:true,
			}
		},
		messages:{
			"debt.isBig":"<span class='zc_zs'>* 请选择是否有上下游企业</span>",
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
	
	

});

function save(n){
	if(!checkOrder()){
		return;
	}
	if($("#debtForm").valid()){
		 $.ajax({
			url:"${ctx}/member/order/save/debt",
			data:$("#debtForm").serialize(),
			type:"post",
			async:false,
			success:function(data){
				if(data == "success"){
					alert("保存成功");
					 if(n == 1){
						 window.location.href = "${ctx }/member/order/detail/document?id=${order.id}";
					 }
				}else{
					alert("保存失败");
				}
			}
		 });
		
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
<jsp:include page="detailHead.jsp" />
<div class="tab">
<sf:form action="${ctx }/member/order/save/debt" id="debtForm" commandName="debt">
<input type="hidden" name="orderId" value="${order.id }">
<p class="qiye_bt"><strong>未抵押的不动产</strong></p>
<p><span>厂房：</span><input type="text" name="realEstate.factory" value="${realEstate.factory }" class="t1 number required" /></p>
<p><span>土地：</span><input type="text" name="realEstate.land" value="${realEstate.land }" class="t1 number required"/></p>
<p><span>办公楼：</span><input type="text" name="realEstate.office" value="${realEstate.office }" class="t1 number required" /></p>
<p><span>店铺：</span><input type="text" name="realEstate.shop" value="${realEstate.shop }" class="t1 number required" /></p>
<p><span>法人私有财产：</span><input type="text" name="realEstate.privateProperty" value="${realEstate.privateProperty }" class="t1 number required" /></p>
<p><span>机器设备：</span><input type="text" name="realEstate.equipment" value="${realEstate.equipment }" class="t1 number required" /></p>
<p><span>其他：</span><input type="text" name="realEstate.other" value="${realEstate.other }" class="t1 number required" /></p>
<input type="hidden" name="realEstate.id" value="${realEstate.id }">
<p class="qiye_bt"><strong>负债</strong></p>
<p><span>公司资产负债率(%)：</span><input type="text" name="debt.rate" value="${debt.rate }" class="t1 number required" /></p>
<p><span>抵押物情况：</span>
		<sf:select path="collateral" class="s1 required">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${collateralTypeList}" itemValue="key" itemLabel="value"/>
			</sf:select>
		</p>
<p><span>第一还款来源年收入(万)：</span><input type="text" class="t1 number required" name="debt.repayIncome" value="${debt.repayIncome }"/></p>
<p><span>是否有上下游企业：</span>
<input type="radio" name="debt.isBig" value="1" class="r1" id="isBig"   <c:if test="${debt.isBig eq '1' }">checked</c:if>/>
<span class="r1_sex">是</span>
<input type="radio" name="debt.isBig" class="r1 m_l_20 " id="isBig" value="0" <c:if test="${debt.isBig eq '0' }">checked</c:if>/>
<span class="r1_sex">否</span></p>
<p><span>企业净资产：</span><input type="text" class="t1 number required" name="debt.netAsset" value="${debt.netAsset }"/></p>
<p><span>企业净资产流动比(%)：</span><input type="text" class="t1 number required" name="debt.floatRate" value="${debt.floatRate }"/></p>
<p><span>企业主资产：</span><input type="text" class="t1 number required" name="debt.factAsset" value="${debt.factAsset }"/></p>
<input type="hidden" name="debt.id" value="${debt.id }">
<p><input type="button" value="保存" class="b1" onclick="save(0)"/><input type="button" value="下一步" class="b4" onclick="save(1)" /></p>
</sf:form>
</div>
</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
