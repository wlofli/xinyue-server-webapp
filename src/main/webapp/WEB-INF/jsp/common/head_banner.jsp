<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container1">
	<div id="full-screen-slider">
		<ul id="slides">
			<!-- 大广告 -->
			<c:forEach items="${indexADs}" var="banner" varStatus="vs">
				<li style="background: url('${showPath}${banner.directory}${banner.thumbnail}') no-repeat center top">
					<a href="#" target="_blank">${banner.title}</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="form_sd">
		<dl>
		<sf:form action="${ctx}/fast/loan" commandName="fastLoanInfo" method="post" id="fastForm">
			<dt>快速申贷</dt>
			<dd>
				<span class="bt_span">企业名称：</span>
				<sf:input path="company" cssClass="sd_input" placeholder="请输入企业名称" id="id_company"/>
			</dd>
			<dd>
				<span class="bt_span">所属地区：</span>
				<sf:select path="areaProvince" cssClass="sd_select1" id="sel_p" onchange="getCities()">
					<sf:option value="">选择省</sf:option>
					<sf:options items="${provinces}" itemValue="key" itemLabel="value"/>
				</sf:select>
				<sf:select path="areaCity" cssClass="sd_select1" id="sel_c" onchange="getZones()">
					<sf:option value="">选择市</sf:option>
				</sf:select>
				<sf:select path="areaZone" cssClass="sd_select1" id="sel_z">
					<sf:option value="">区/县</sf:option>
				</sf:select>
			</dd>
			<dd>
				<span class="bt_span">贷款额度：</span>
				<sf:input path="credit" cssClass="sd_input" placeholder="万元" id="id_money"/>
			</dd>
			<dd>
				<span class="bt_span">联系人姓名：</span>
				<sf:input path="contactName" cssClass="sd_input" placeholder="请输入联系人姓名" id="id_name"/>
			</dd>
			<dd>
				<span class="bt_span">联系手机：</span>
				<sf:input path="contactPhone" cssClass="sd_input1" placeholder="请输入联系人手机" id="id_tel"/>
				<input type="button" class="sd_yzsj_btn" value="获取验证码" id="code_btn" onclick="getCode()"/>
			</dd>
			<dd>
				<span class="bt_span">手机验证码：</span>
				<input type="text" class="sd_input" placeholder="请输入手机验证码" id="id_check"/>
			</dd>
			<dd>
				<input type="button" class="sd_btn" value="提交申请" onclick="fastSubmit()"/>
			</dd>
		</sf:form>
		</dl>
	</div>
</div>
<div class="container2">
	<div class="banner_bottom_gg">税贷通-税收信用“贷”动企业快速发展</div>
	<ul class="hzms_ul">
		<li><a href="#"><i class="icon1"></i><span>合作融资机构<br />
				<strong>${organizationCount}</strong>个
			</span></a></li>
		<li><a href="#"><i class="icon2"></i><span>合作融资产品<br />
				<strong>${productCount}</strong>个
			</span></a></li>
		<li><a href="#"><i class="icon3"></i><span>累计融资金额<br />
				<strong>20322</strong>元
			</span></a></li>
		<li class="b_r_none"><a href="#"><i class="icon4"></i><span>累计服务企业<br/>
				<strong>${companyCount}</strong>家
			</span></a></li>
	</ul>
</div>
<script type="text/javascript">
var time = 61;
function fastSubmit(){
	if ($("#id_company").val() != "" && $("#sel_z").val() != "" && $("#id_money").val() != "" && $("#id_name").val() != "" && $("#id_tel").val() != "") {
		$.ajax({
			url:"",
			data:{checkCode:$("#id_check").val()},
			success:function(data){
				if (data != "true") {
					alert("手机验证码不正确");
				}else{
					$("#fastForm").submit();
				}
			}
		});
	}else {
		alert("请正确填写相关信息");
	}
}
function getCities(){
var provinceVal = $("#sel_p option:selected").val();
	
	$("#sel_c").empty();
	var option= $("<option/>");
	option.attr("value","");
	option.html("选择市");
	$("#sel_c").append(option);
	$("#sel_z").empty();
	var option1= $("<option/>");
	option1.attr("value","");
	option1.html("区/县");
	$("#sel_z").append(option1);
	
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
					$("#sel_c").append(option);
				};
			}
		});
	}
}
function getZones(){
var cityVal = $("#sel_c option:selected").val();
	
	$("#sel_z").empty();
	var option1= $("<option/>");
	option1.attr("value","");
	option1.html("区/县");
	$("#sel_z").append(option1);
	
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
					$("#sel_z").append(option);
				};
			}
		});
	}
}
function getCode(){
	var tel = $("#tel").val();
	if (tel == "") {
		alert("请填写手机号！");
		return;
	}
	$.ajax({
		url:"${ctx}/send/tel/code?phone="+tel,
		type:"post",
		success:function(data){
			if (data=="true") {
				timer();
			} else {
				alert("验证码发送失败！");
			}
		}
	});
}
function timer(){
	if (time == 1) {
		$("#code_btn").val("获取验证码");
		$("#code_btn").removeClass("sd_yzsj_btn1");
		$("#code_btn").addClass("sd_yzsj_btn");
		$("#code_btn").removeAttr("disabled");
		time = 61;
	} else {
		$("#code_btn").removeClass("sd_yzsj_btn");
		$("#code_btn").addClass("sd_yzsj_btn1");
		$("#code_btn").attr("disabled","disabled");
		time = time - 1;
		$("#code_btn").val(time+"秒后重置");
		setTimeout(function(){timer()},1000);
	}
}
</script>