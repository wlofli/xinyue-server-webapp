<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="../../common/common.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<script type="text/javascript"> 
$(function() {
	var valP = $("#editP").val();
	var valC = $("#editC").val();
	var valZ = $("#editZ").val();

	if (valP != "" && valP != 0) {
		getCities(valC);
	}
	if (valC != "") {
		getZones(valC, valZ);
	}
	
	var message = "${message}";
	if (message != null && message != "") {
		alert(message);
	}
	var tab = "${tab}";
	switch (tab) {
	case "1":
		c1 = 0;
		gtb();
		break;
	case "2":
		c2 = 0;
		gtb1();
		break;
	case "3":
		c3 = 0;
		gtb2();
		var op = "${operation}";
		if (op == "p") {
			document.location.href = "${ctx}/member/record/applicant";
		}else if (op == "n") {
			document.location.href = "${ctx}/member/record/business";
		}
		break;
	default:
		break;
	}
});

function getCities(val) {
	var provinceVal = $("#editP option:selected").val();

	$("#editC").empty();
	var option = $("<option/>");
	option.attr("value", "");
	option.html("请选择");
	$("#editC").append(option);
	$("#editZ").empty();
	var option1 = $("<option/>");
	option1.attr("value", "");
	option1.html("请选择");
	$("#editZ").append(option1);

	if (provinceVal != "") {
		$.ajax({
			url : "${ctx}/get/cities?type=tc&id=" + provinceVal,
			success : function(data) {
				var jsonData = eval(data);
				for (var i = 0; i < jsonData.length; i++) {
					var city = jsonData[i];
					option = $("<option/>");
					option.attr("value", city.key);
					option.html(city.value);
					$("#editC").append(option);
				}
				;
				if (val != "") {
					$("#editC").val(val);
				}
			}
		});
	}
}
function getZones(val1, val2) {
	var cityVal = $("#editC option:selected").val();

	$("#editZ").empty();
	var option1 = $("<option/>");
	option1.attr("value", "");
	option1.html("请选择");
	$("#editZ").append(option1);

	if (cityVal == "") {
		cityVal = val1;
	}

	if (cityVal != "") {
		$.ajax({
			url : "${ctx}/get/zones?type=tz&id=" + cityVal,
			success : function(data) {
				var jsonData = eval(data);
				for (var i = 0; i < jsonData.length; i++) {
					var zone = jsonData[i];
					option = $("<option/>");
					option.attr("value", zone.key);
					option.html(zone.value);
					$("#editZ").append(option);
				}
				if (val2 != "") {
					$("#editZ").val(val2);
				}
			}
		});
	}
}

function save(n){
	if(!checkOrder()){
		return;
	}
	if($("#companyForm").valid()){
		$.ajax({
			   url:"${ctx}/member/order/save/company",
			   method:"post",
			   data:$("#companyForm").serialize(),
			   async:true,
			   success:function(data){
				   if(data == "success"){
					   alert("保存成功");
					   if(n == 1){
							window.location.href = "${ctx }/member/order/detail/business?id=${order.id}";
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
<sf:form action="${ctx }/member/order/save/company"  method="post" id="companyForm">
<input type="hidden" name="orderId" value="${order.id }"/>
<input type="hidden" name="companyInfo.id" value="${companyInfo.id }"/>
<p><span>公司名称：</span><input type="text" name="companyInfo.companyName" value="${companyInfo.companyName }" class="t1 required" /></p>
<p><span>法人代表：</span><input type="text" name="companyInfo.legalPerson" value="${companyInfo.legalPerson }" class="t1 required" /></p>
<p><span>证件类型：</span>
<select name="companyInfo.paperType" class="s1 required">
<option value="0">请选择</option>
<c:forEach items="${idTypeList }" var="list">
<option <c:if test="${companyInfo.paperType == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>证件号码：</span><input type="text" name="companyInfo.paperNumber" value="${companyInfo.paperNumber }" class="t1 required" /></p>
<p><span>营业执照注册号：</span><input type="text" name="companyInfo.licenseeNumber" value="${companyInfo.licenseeNumber }" class="t1 required" /></p>
<p><span>工商注册时间：</span><input type="text" name="companyInfo.companyRegisterDate" value="${companyInfo.companyRegisterDate }" class="t1 required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>是否有年检记录：</span><select name="companyInfo.yearCheck" class="s1 required">

<option value="1" <c:if test="${companyInfo.yearCheck == 1 }">selected="selected"</c:if> >是</option>
<option value="0" <c:if test="${companyInfo.yearCheck == 0 }">selected="selected"</c:if> >否</option>
</select></p>
<p><span>最近一次年检时间：</span><input type="text" value="${companyInfo.yearCheckDate }" name="companyInfo.yearCheckDate" class="t1 required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>注册资本(万)：</span><select name="companyInfo.registerFundType" class="s1 required">
<c:forEach items="${capitalList }" var="list" varStatus="vs">
<option value="${list.key }" <c:if test="${companyInfo.registerFundType == list.key }">selected="selected"</c:if> >${list.value }</option>
</c:forEach>
</select>
<input type="text" class="t1 required" name="companyInfo.registerFund" value="${companyInfo.registerFund }" /></p>
<p><span>实收资本(万)：</span><select name="companyInfo.factFundType"  class="s1">
<c:forEach items="${capitalList }" var="list" >
<option <c:if test="${companyInfo.factFundType == list.key }">selected</c:if>  value="${list.key }">${list.value }</option>
</c:forEach>
</select><input type="text" name="companyInfo.factFund" value="${companyInfo.factFund }" class="t1 required" /></p>
<p><span>企业性质：</span><select class="s1" name="companyInfo.companyType">
<option value="0">请选择</option>
<c:forEach items="${companyNatureList }" var="list">
<option <c:if test="${companyInfo.companyType == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>

<p><span>注册地址</span><input type="text" value="${companyInfo.registerAddress }" name="companyInfo.registerAddress" class="t1 required" /></p>
<p><span>企业所属地区：</span><select name="companyInfo.companyProvince" class="s2 required" id="editP" onchange="getCities('')" >
<option value="">请选择</option>
<c:forEach items="${provinceList }" var="list">
                              
<option value="${list.key }" <c:if test="${list.key == companyInfo.companyProvince }">selected="selected"</c:if> >${list.value }</option>
</c:forEach>
</select><select name="companyInfo.companyCity" class="s2 required" id="editC" onchange="getZones('','')">
<option value="">请选择</option>
<c:forEach items="${cityList }" var="list">
	<option value="${list.key }" <c:if test="${list.key == companyInfo.companyCity }">selected="selected"</c:if> >${list.value }</option>
</c:forEach>
</select><select name="companyInfo.companyZone" class="s2 required" id="editZ">
<option value="">请选择</option>
<c:forEach items="${zoneList }" var="list">
	<option value="${list.key }" <c:if test="${list.key == companyInfo.companyZone }">selected="selected"</c:if> >${list.value }</option>
</c:forEach>
</select></p>
<input type="hidden" name="companyInfo.companyProvinceHid" value="${companyInfo.companyProvinceHid }" id="hid_c_p"/>
<input type="hidden" name="companyInfo.companyCityHid" value="${companyInfo.companyCityHid }" id="hid_c_c"/>
<input type="hidden" name="companyInfo.companyZoneHid" value="companyInfo.companyZoneHid" id="hid_c_z"/>
<p><span>经营范围：</span><textarea name="companyInfo.businessRange" class="t3 required">${companyInfo.businessRange }</textarea></p>
<p><span>组织机构代码：</span><input name="companyInfo.organizationCode" type="text" value="${companyInfo.organizationCode }" class="t1 required" /></p>
<p><span>企业电户号：</span><input type="text" name="companyInfo.companyEdoorNum" value="${companyInfo.companyEdoorNum }" class="t1 required" /></p>
<p><span>公司联系电话：</span><input type="text" name="companyInfo.companyTel" value="${companyInfo.companyTel }" class="t1 required" /></p>
<p><span>公司传真号码：</span><input type="text" name="companyInfo.companyFax" value="${companyInfo.companyFax }" class="t1 required" /></p>
<p><span>营业执照到期日：</span><input type="text" name="companyInfo.licenseeDeadLine" value="${companyInfo.licenseeDeadLine }" class="t1 required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  /></p>
<p><span>工商登记类型：</span><select class="s1" name="companyInfo.licenseeType">
<option value="0">请选择</option>
<c:forEach items="${businessRegList }" var="list">
<option <c:if test="${companyInfo.licenseeType == list.key }">selected</c:if>  value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>机构类型：</span><select name="companyInfo.organizationType" class="s1">
<option value="0">请选择</option>
<c:forEach items="${agencyTypeList }" var="list">
<option <c:if test="${companyInfo.organizationType == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>国税号：</span><input type="text" name="companyInfo.taxCodeN" value="${companyInfo.taxCodeN }" class="t1 required" /></p>
<p><span>地税号：</span><input type="text" name="companyInfo.taxCode" value="${companyInfo.taxCode }" class="t1 required" /></p> 






<p class="qiye_bt"><strong>公司控股信息</strong></p>
<c:forEach begin="0" end="1" varStatus="vs">
<input type="hidden" name="hold.ids[${vs.index }]" value="${hold.ids[vs.index] }"/>
<p><span>股东控股方式：</span>
<select name="hold.holdTypes[${vs.index}]" class="s1">
<option value="">请选择</option>
<c:forEach items="${holdTypeList }" var="list">
<option <c:if test="${hold.holdTypes[vs.index] == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>实际控制人之<c:if test="${vs.index+1 eq 1}">一</c:if><c:if test="${vs.index+1 eq 2}">二</c:if>：
</span><input type="text" name="hold.controlPersons[${vs.index}]" value="${hold.controlPersons[vs.index] }"  class="t1" /></p>
<p><span>证件类型：</span>
<select class="s1" name="hold.paperTypes[${vs.index}]">
<option value="">请选择</option>
<c:forEach items="${idTypeList }" var="list">
<option <c:if test="${hold.paperTypes[vs.index] == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>证件号码：</span><input type="text" name="hold.paperNumbers[${vs.index}]" value="${hold.paperNumbers[vs.index] }" class="t1" /></p>
<p><span>从业年限(年)：</span><input type="text" name="hold.workYears[${vs.index}]" value="${hold.workYears[vs.index] }" class="t1" /></p>
<p><span>学历：</span>
<select class="s1" name="hold.educations[${vs.index}]">
<option value="">请选择</option>
<c:forEach items="${educationTypeList }" var="list">
<option <c:if test="${hold.educations[vs.index] == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>婚姻情况：</span>
<select class="s1" name="hold.marriages[${vs.index}]">
<option value="">请选择</option>
<c:forEach items="${marriageTypeList }" var="list">
<option <c:if test="${hold.marriages[vs.index] == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
</c:forEach>






<p class="qiye_bt"><strong>公司治理信息</strong></p>
<input type="hidden" name="control.id" value="${control.id }"/>
<p><span>所属行业：</span><select class="s1 required" name="control.industry">
<option value="">请选择</option>
<c:forEach items="${industry }" var="list">
<option <c:if test="${control.industry == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>持续经营开始时间：</span><input type="text" class="t1 required" value="${control.businessStartDate }" name="control.businessStartDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  /></p>
<p><span>主要经营地点：</span>
<input type="radio" name="control.businessArea" <c:if test="${control.businessArea ==  1}">checked</c:if> value="1" class="r1" /><span class="r1_sex">本地</span>
<input type="radio" name="control.businessArea" <c:if test="${control.businessArea ==  0}">checked</c:if> value="0" class="r1" /><span class="r1_sex">外地</span></p>
<p><span>主要产品销售区域：</span>
<select name="control.saleArea" class="s1 required">
<option value="">请选择</option>
<c:forEach items="${businessAreaList }" var="list">
<option <c:if test="${control.saleArea == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>是否固定营业场所：</span>
<input type="radio" name="control.fixedBusinessPlace" <c:if test="${control.fixedBusinessPlace ==  1}">checked</c:if> value="1" class="r1" /><span class="r1_sex">是</span>
<input type="radio" name="control.fixedBusinessPlace" <c:if test="${control.fixedBusinessPlace ==  0}">checked</c:if> value="0" class="r1" /><span class="r1_sex">否</span></p>
<p><span>进入园区或市场年限：</span>
<input type="text" class="t1 required" name="control.interYear" value="${control.interYear }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>财务报表审计类型：</span>
<select name="control.auditType" class="s1 required">
<option value="" >请选择</option>
<c:forEach items="${auditTypeList }" var="list">
<option <c:if test="${control.auditType == list.key }">selected</c:if> value="${list.key }">${list.value }</option>
</c:forEach>
</select></p>
<p><span>员工人数：</span><input type="text" class="t1 required" name="control.peopleNumber" value="${control.peopleNumber }"/></p> 
<p><span>是否有贷款卡：</span>
<input type="radio" name="control.haveLoanCard" <c:if test="${control.haveLoanCard ==  1}">checked</c:if> value="1" class="r1" /><span class="r1_sex">是</span>
<input type="radio" name="control.haveLoanCard" <c:if test="${control.haveLoanCard ==  0}">checked</c:if> value="0" class="r1" /><span class="r1_sex">否</span></p>
<p><span>贷款卡卡号：</span><input type="text" class="t1 required" value="${control.loanCardNumber }" name="control.loanCardNumber" /></p>
<p><input type="button" value="保存" class="b1" onclick="save(0)"/><input type="button" value="下一步" class="b4" onclick="save(1)" /></p>
</sf:form>
</div>
</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
