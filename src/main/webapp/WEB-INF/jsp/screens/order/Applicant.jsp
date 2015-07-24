<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../common/common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<script type="text/javascript">
$(function () {
	var valP = $("#editP").val();
	var valC = $("#editC").val();
	var valZ = $("#editZ").val();
	
	if(valP != "" && valP != 0){
		getCities(valC);
	}
	if (valC != "") {
 		getZones(valC,valZ);
	}
});

function getCities(val){
	var provinceVal = $("#editP option:selected").val();
	
	$("#editC").empty();
	var option= $("<option/>");
	option.attr("value","");
	option.html("请选择");
	$("#editC").append(option);
	$("#editZ").empty();
	var option1= $("<option/>");
	option1.attr("value","");
	option1.html("请选择");
	$("#editZ").append(option1);
	
	if (provinceVal != "") {
		$.ajax({
			url:"${ctx}/get/cities?type=tc&id="+provinceVal,
			success:function(data){
				var jsonData = eval(data);
				for(var i=0;i<jsonData.length;i++){
					var city=jsonData[i];
					option= $("<option/>");
					option.attr("value",city.key);
					option.html(city.value);
					$("#editC").append(option);
				};
				if(val != ""){
					$("#editC").val(val);
				}
			}
		});
	}
}
function getZones(val1,val2){
	var cityVal = $("#editC option:selected").val();
	
	$("#editZ").empty();
	var option1= $("<option/>");
	option1.attr("value","");
	option1.html("请选择");
	$("#editZ").append(option1);
	
	if (cityVal == "") {
		cityVal = val1;
	}
	
	if (cityVal != "") {
		$.ajax({
			url:"${ctx}/get/zones?type=tz&id="+cityVal,
			success:function(data){
				var jsonData = eval(data);
				for(var i=0;i<jsonData.length;i++){
					var zone=jsonData[i];
					option= $("<option/>");
					option.attr("value",zone.key);
					option.html(zone.value);
					$("#editZ").append(option);
				};
				if(val2 != ""){
					$("#editZ").val(val2);
				}
			}
		});
	}
}

function save(n){
	alert("in");
	$.ajax({
		url:"${ctx}//order/save/applicant",
		data:$("#applicantForm").serialize(),
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
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<div class="ddxq_top">
<jsp:include page="detailHead.jsp" />
</div>
<div class="hy_right_bt">
<ul class="menu1" id="menu">
<li class="hit"><a href="ddxq_hy.html">申请人信息</a></li>
<li class=""><a href="ddxq_hy1.html">企业基本信息</a></li> 
<li class=""><a href="ddxq_hy2.html">基本经营信息</a></li> 
<li class=""><a href="${ctx }/order/detail/debt?id=${order.id}">抵押物与负债</a></li> 
<li class=""><a href="ddxq_hy4.html">上传资料</a></li> 
</ul>
</div>
<div class="tab" id="tab0" >

<sf:form action="${ctx}/order/save/applicant" commandName="applicationInfo" method="post" id="applicantForm">
<sf:hidden path="id" />
<input type="hidden" name="orderId" value="${order.id }">
<p><span>申请人姓名：</span><sf:input path="name" cssClass="t1" /></p>
<p><span>联系方式：</span><sf:input path="phone" cssClass="t1" /></p>
<p><span>电子邮箱：</span><sf:input path="email" cssClass="t1" /></p>
<p><span>申贷期限(月)：</span><sf:input path="limitDate" cssClass="t1" /></p>
<p><span>申贷金额(万)：</span><sf:input path="money" cssClass="t1" /></p>
<p><span>可接受最高利率：</span><sf:select path="interestRate" cssClass="s1">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${maxRateList}" itemValue="key" itemLabel="value" />
			</sf:select></p>
<p><span>还款方式：</span><sf:select path="repayType" cssClass="s1">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${repayList}" itemValue="key" itemLabel="value" />
			</sf:select></p>
<p><span>主要担保方式：</span><sf:select path="guaranteeType" cssClass="s1">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${guaranteeList}" itemValue="key"
					itemLabel="value" />
			</sf:select></p>
<p><span>担保人姓名：</span><sf:input path="guaranteePerson" cssClass="t1" /></p>
<p><span>担保物名称：</span><sf:input path="guaranteeGoods" cssClass="t1" /></p>
<p><span>担保金额(万)：</span><sf:input path="guaranteeMoney" cssClass="t1" /></p>
<p><span>担保物所在地区：</span><sf:select path="guaranteeProvince" cssClass="s2" id="editP"
				onchange="getCities('')">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${provinceList}" itemValue="key"
					itemLabel="value" />
			</sf:select>
			<sf:select path="guaranteeCity" cssClass="s2" id="editC"
				onchange="getZones('','')">
				<sf:option value="">请选择</sf:option>
			</sf:select>
			<sf:select path="guaranteeZone" cssClass="s2" id="editZ">
				<sf:option value="">请选择</sf:option>
			</sf:select></p>
<p><span>担保物是否在本地：</span><sf:select path="isLocation" cssClass="s1">
				<sf:option value="">请选择</sf:option>
				<sf:option value="1">是</sf:option>
				<sf:option value="0">否</sf:option>
			</sf:select></p>
<p><input type="button" value="保存" class="b1"  onclick="save(1)"/><input type="button" value="下一步" class="b4" onclick="save(2)"/></p>
</sf:form>
</div>

 
</div> 
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>