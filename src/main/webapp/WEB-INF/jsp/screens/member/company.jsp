<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="hy_right_bt">
	<ul class="menu1" id="menu">
		<li class=""><a href="${ctx}/member/record/applicant">申请人信息</a></li>
		<li class="hit"><a href="${ctx}/member/record/company">企业基本信息</a></li>
		<li class=""><a href="${ctx}/member/record/business">基本经营信息</a></li>
		<li class=""><a href="${ctx}/member/record/estate">抵押物信息</a></li>
		<li class=""><a href="${ctx}/member/record/debt">负债信息</a></li>
		<li class=""><a href="${ctx}/member/record/document">上传资料</a></li>
<%-- 		<li class=""><a href="${ctx}/member/record/rating">评级信息</a></li> --%>
	</ul>
</div>
<div class="tab">
	<sf:form action="${ctx}/member/company/save" commandName="companyInfo" method="post" id="companyForm">
		<p class="qiye_bt">
			<i><img src="${ctx}/images/zk_icon.png" id="tb1" /></i>
			<strong onclick="javascript:st1('jbxx1');javascript:gtb()" style="cursor: pointer">企业基本信息</strong>
		</p>
		<div id="jbxx1" class="jbxx" style="display: none;">
			<p>
				<span>公司名称：</span>
				<sf:input path="companyName" class="t1" />
			</p>
			<p>
				<span>法人代表：</span>
				<sf:input path="legalPerson" class="t1" />
			</p>
			<p>
				<span>证件类型：</span>
				<sf:select path="paperType" class="s1">
					<sf:option value="0">请选择</sf:option>
					<sf:options items="${idTypeList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>证件号码：</span>
				<sf:input path="paperNumber" class="t1" />
			</p>
			<p>
				<span>营业执照注册号：</span>
				<sf:input path="licenseeNumber" class="t1" />
			</p>
			<p>
				<span>工商注册时间：</span>
				<sf:input path="companyRegisterDate" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
			</p>
			<p>
				<span>是否有年检记录：</span>
				<sf:select path="yearCheck" class="s1">
					<sf:option value="1">是</sf:option>
					<sf:option value="0">否</sf:option>
				</sf:select>
			</p>
			<p>
				<span>最近一次年检时间：</span>
				<sf:input path="yearCheckDate" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
			</p>
			<p>
				<span>注册资本(万)：</span>
				<sf:select path="registerFundType" class="s1">
					<sf:options items="${capitalList}" itemValue="key" itemLabel="value"/>
				</sf:select>
				<sf:input path="registerFund" class="t1" />
			</p>
			<p>
				<span>实收资本(万)：</span>
				<sf:select path="factFundType" class="s1">
					<sf:options items="${capitalList}" itemValue="key" itemLabel="value"/>
				</sf:select>
				<sf:input path="factFund" class="t1" />
			</p>
			<p>
				<span>企业性质：</span>
				<sf:select path="companyType" class="s1">
					<sf:option value="0">请选择</sf:option>
					<sf:options items="${companyNatureList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>注册地址：</span>
				<sf:input path="registerAddress" class="t1" />
			</p>
			<p>
				<span>企业所属地区：</span>
				<sf:select path="companyProvince" class="s2" id="editP" onchange="getCities('')">
					<sf:option value="">请选择</sf:option>
					<sf:options items="${provinceList}" itemValue="key" itemLabel="value"/>
				</sf:select>
				<sf:select path="companyCity" class="s2" id="editC" onchange="getZones('','')">
					<sf:option value="">请选择</sf:option>
				</sf:select>
				<sf:select path="companyZone" class="s2" id="editZ">
					<sf:option value="">请选择</sf:option>
				</sf:select>
				<sf:hidden path="companyProvinceHid" id="hid_c_p"/>
				<sf:hidden path="companyCityHid" id="hid_c_c"/>
				<sf:hidden path="companyZoneHid" id="hid_c_z"/>
			</p>
			<p>
				<span>经营范围：</span>
				<sf:textarea path="businessRange" class="t3"/>
			</p>
			<p>
				<span>组织机构代码：</span>
				<sf:input path="organizationCode" class="t1" />
			</p>
			<p>
				<span>企业电户号：</span>
				<sf:input path="companyEdoorNum" class="t1" />
			</p>
			<p>
				<span>公司联系电话：</span>
				<sf:input path="companyTel" class="t1" />
			</p>
			<p>
				<span>公司传真号码：</span>
				<sf:input path="companyFax" class="t1 " />
			</p>
			<p>
				<span>营业执照到期日：</span>
				<sf:input path="licenseeDeadLine" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
			</p>
			<p>
				<span>工商登记类型：</span>
				<sf:select path="licenseeType" class="t1 required">
					<sf:option value="0">请选择</sf:option>
					<sf:options items="${businessRegList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>机构类型：</span>
				<sf:select path="organizationType" class="t1 required">
					<sf:option value="0">请选择</sf:option>
					<sf:options items="${agencyTypeList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>国税号：</span>
				<sf:input path="taxCodeN" class="t1" />
			</p>
			<p>
				<span>地税号：</span>
				<sf:input path="taxCode" class="t1" />
			</p>
			<sf:hidden path="id"/>
			<p>
<!-- 				<input type="button" value="上一步" class="b4" onclick="saveCom('p')" /> -->
				<input type="button" value="保存" class="b4" onclick="saveCom('s')" />
<!-- 				<input type="button" value="下一步" class="b4" onclick="saveCom('n')" /> -->
			</p>
		</div>
	</sf:form>
	<%@ include file="../member/hold.jsp"%>
	<%@ include file="../member/control.jsp"%>
</div>
<script type="text/javascript">

	var c1 = 1;
	var c2 = 1;
	var c3 = 1;
	function gtb() {
		if (c1 == 0) {
			c1 = 1;
			document.getElementById("tb1").src = "${ctx}/images/sq_icon.png";
		} else {
			c1 = 0;
			document.getElementById("tb1").src = "${ctx}/images/zk_icon.png";
		}
	}

	function gtb1() {
		if (c2 == 1) {
			c2 = 0;
			document.getElementById("tb2").src = "${ctx}/images/zk_icon.png";
		} else {
			c2 = 1;
			document.getElementById("tb2").src = "${ctx}/images/sq_icon.png";
		}
	}

	function gtb2() {
		if (c3 == 1) {
			c3 = 0;
			document.getElementById("tb3").src = "${ctx}/images/zk_icon.png";
		} else {
			c3 = 1;
			document.getElementById("tb3").src = "${ctx}/images/sq_icon.png";
		}
	}
	function st1(jbxx1) {
		$("#jbxx1").slideToggle("slow");
	}
	function st(jbxx2) {
		$("#jbxx2").slideToggle("slow");
	}
	function st2(jbxx3) {
		$("#jbxx3").slideToggle("slow");
	}

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
	
	function saveCom(type){
		$("#companyForm").attr("action","${ctx}/member/company/save?type="+type);
		$("#companyForm").submit();
	}
	
	function saveHold(type){
		$("#holdForm").attr("action","${ctx}/member/hold/save?type="+type);
		$("#holdForm").submit();
	}
	
	function saveControl(type){
		$("#controlForm").attr("action","${ctx}/member/control/save?type="+type);
		$("#controlForm").submit();
	}
</script>