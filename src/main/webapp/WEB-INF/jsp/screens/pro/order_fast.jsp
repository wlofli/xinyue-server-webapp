<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common/common.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div id="tck">
	<div class="zx_tck">
		<div class="bt">
			<h1>填写联系方式</h1>
			<a href="javascript:hide()"><img src="${ctx }/images/close.png" /></a>
			<div class="clear"></div>
		</div>
		<div class="nr">
			<div class="nr_left">
				<form action="" method="post" name="" id="stepOne">
				<p>
					<span>手机号码：</span>
					<input type="text" placeholder="请输入手机号码" class="sjh_t required" id="mobile"/>
					<input type="button" class="sjyz_b" value="获取验证码" id="code_btn" onclick="sendCode()"/>
					<input type="hidden" id="hid_product">
					<input type="hidden" id="hid_manager">
				</p>
				<p>
					<span>验证码：</span>
					<input type="text" placeholder="请输入验证码" class="sjyz_t" id="check_c" name="checkCode"/>
				</p>
				<p>
					<input type="button" value="确定" class="tjsj_btn"
						onclick="javascript:zxtck1()" />
				</p>
				</form>
			</div>
			<div class="nr_right">
				<p class="ts_bt">提示</p>
				<p class="ts_nr">请填写您的联系方式，以便信贷经理与您联系</p>

			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>

<div id="tck1">
	<div class="zx_tck">
		<div class="bt">
			<h1>填写申请人资料</h1>
			<a href="javascript:hide2()"><img src="${ctx}/images/close.png" /></a>
			<div class="clear"></div>
		</div>
		<div class="nr">
			<div class="nr_left">
				<sf:form action="" commandName="applicantFast" method="post" id="stepTwo">
					<p><span>联系人姓名：</span>
						<sf:input path="name" cssClass="sjyz_t required"/>
					</p> 
					<p>
						<span>贷款金额：</span>
						<sf:input path="loanAmount" cssClass="sjyz_t required digits"/>
					</p>
					<p>
						<span>贷款期限：</span>
						<sf:input path="loanPeriod" cssClass="sjyz_t required digits"/>
					</p>
					<p>
						<span>职业身份：</span>
						<sf:input path="profession" cssClass="sjyz_t required"/>
<%-- 						<sf:select path="profession" cssClass="sdzl_s required"> --%>
<%-- 							<sf:option value="">请选择</sf:option> --%>
<%-- 							<sf:options items="${professions}" itemValue="key" itemLabel="value"/> --%>
<%-- 						</sf:select> --%>
					</p>
					<p>
						<span>总经营流水/月：</span>
						<sf:input path="monthManagement" cssClass="sjyz_t required digits"/>
					</p>
					<p>
						<span>现金结算经营收入/月：</span>
						<sf:input path="monthCashIncome" cssClass="sjyz_t required digits"/>
					</p>
					<p>
						<span>经营年限：</span>
						<sf:input path="managementLife" cssClass="sjyz_t required digits"/>
					</p>
					<p>
						<span>经营注册地：</span>
						<sf:select path="registerProvince" cssClass="sdzl_s1" id="editP" onchange="getCities()">
							<sf:option value="">请选择</sf:option>
							<sf:options items="${provinces}" itemValue="key" itemLabel="value"/>
						</sf:select>
						<sf:select path="registerCity" cssClass="sdzl_s1" id="editC" onchange="getZones()">
							<sf:option value="">请选择</sf:option>
						</sf:select>
						<sf:select path="registerZone" cssClass="sdzl_s1 required" id="editZ">
							<sf:option value="">请选择</sf:option>
						</sf:select>
					</p>
					<!-- <p><span>是否有本地公积金：</span><select class="sdzl_s"><option></option></select></p> -->
					<p>
						<span>两年内信用：</span>
						<sf:select path="twoYearCredit" cssClass="sdzl_s required">
							<sf:option value="">请选择</sf:option>
							<sf:options items="${twoYearCredits}" itemValue="key" itemLabel="value"/>
						</sf:select>
					</p>
					<!-- <p><span>是否有本地社保：</span><select class="sdzl_s"><option></option></select></p> -->
					<p>
						<span>名下房产类型：</span>
						<sf:select path="houseType" cssClass="sdzl_s required">
							<sf:option value="">请选择</sf:option>
							<sf:options items="${houseTypes}" itemValue="key" itemLabel="value"/>
						</sf:select>
					</p>
					<p>
						<input type="button" value="确定" class="tjsj_btn" onclick="zxtck2()" />
					</p>
				</sf:form>
			</div>
			<div class="nr_right">
				<p class="ts_bt">提示</p>
				<p class="ts_nr">请填写您的联系方式，以便信贷经理与您联系</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div id="tck2">
	<div class="zx_tck">
		<div class="bt">
			<h1>填写公司资料</h1>
			<a href="javascript:hide3()"><img src="${ctx}/images/close.png" /></a>
			<div class="clear"></div>
		</div>
		<div class="nr">
			<div class="nr_left">
				<sf:form action="" commandName="companyFast" method="post" id="stepThree">
				<p>
					<span>公司名称：</span>
					<sf:input path="companyName" cssClass="sjyz_t required" maxlength="60"/>
				</p>
				<p>
					<span>法人代表：</span>
					<sf:input path="legalRepresentative" cssClass="sjyz_t required"/>
				</p>
				<p>
					<span>证件类型：</span>
					<sf:select path="parpersType" cssClass="sdzl_s required">
						<sf:option value="">请选择</sf:option>
						<sf:options items="${parpersTypes}" itemValue="key" itemLabel="value"/>
					</sf:select>
				</p>
				<p>
					<span>证件号码：</span>
					<sf:input path="papersNumber" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>营业执照注册号：</span>
					<sf:input path="businessLicenseNumber" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>公司成立时间：</span>
					<sf:input path="registerTime" cssClass="sjyz_t required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
				</p>
				<p>
					<span>注册资金：</span>
					<sf:input path="registerFund" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>企业性质：</span>
					<sf:select path="companyType" cssClass="sdzl_s required">
						<sf:option value="">请选择</sf:option>
						<sf:options items="${companyTypes}" itemValue="key" itemLabel="value"/>
					</sf:select>
				</p>
				<p>
					<span>所属行业：</span>
					<sf:select path="industry" cssClass="sdzl_s required">
						<sf:option value="">请选择</sf:option>
						<sf:options items="${industries}" itemValue="dicKey" itemLabel="dicVal"/>
					</sf:select>
				</p>
				<p>
					<span>注册地址：</span>
					<sf:input path="registerAddress" cssClass="sjyz_t required"/>
				</p>
				<p>
					<span>实际经营地所属地区：</span>
					<sf:input path="factBusinessArea" cssClass="sjyz_t required"/>
				</p>
				<p>
					<span>年营业额约：</span>
					<sf:input path="yearTurnover" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>近1年开票额约：</span>
					<sf:input path="yearInvoice" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>资产负债率：</span>
					<sf:input path="assetLiability" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>营业额年均增长率：</span>
					<sf:input path="businessGrowth" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>上年度净利润：</span>
					<sf:input path="yearNetProfit" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>员工人数：</span>
					<sf:input path="staffNumber" cssClass="sjyz_t required digits"/>
				</p>
				<p>
					<span>个人信息：</span>
					<sf:input path="personInformation" cssClass="sjyz_t required"/>
				</p>
				<p>
					<input type="button" value="确定" class="tjsj_btn" onclick="javascript:zxtck3()" />
				</p>
				</sf:form>
			</div>
			<div class="nr_right">
				<p class="ts_bt">提示</p>
				<p class="ts_nr">请填写您的联系方式，以便信贷经理与您联系</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>

<div id="login">
	<div class="login1">
		<div class="bt">
			<h1>申请成功</h1>
			<a href="javascript:hide4()"><img src="${ctx }/images/close.png" /></a>
			<div class="clear"></div>
		</div>
		<div class="nr">
			<p style="text-align: center; height: auto; line-height: 50px; font-size: 18px; margin: 20px;">您的申请已经成功提交，我们将在一到两个工作日内跟您联系，请耐心等待！</p>
		</div>
	</div>
</div>
<div id="over"></div>
<script type="text/javascript">

	$(function(){
		$("#stepOne").validate({
			rules:{
				checkCode:{
					required:true,
					remote:{
		                type: "post",
		                url:"${ctx}/common/check/code",
		                data:{
		                	checkCode: function(){return $("#check_c").val();}
		                }
		          }
				}
			},
			messages: {
				checkCode:{
					remote:"<span class='zc_zs'>* 手机验证码错误</span>"
				},
			},
			errorPlacement: function(error, element) {
				error.appendTo(element.parent());
			},
		});

	});
	
	$("#stepTwo").validate({
	});
	$("#stepThree").validate({
	});
	/**
	function sendCode(){
		var r =/^(1[3587][0-9]{1})+\d{8}$/;
		var node = document.getElementById("mobile");
		if(!r.test(node.value)){
			alert("请输入正确格式的手机号码");
			node.focus();
			return;
		}
		$.ajax({
			url:"${ctx}/send/tel/code?phone="+node.value,
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
	*/
	function timer(){
		if (time == 1) {
			$("#code_btn").val("获取验证码");
			$("#code_btn").removeClass("sjyz_b1");
			$("#code_btn").addClass("sjyz_b");
			$("#code_btn").removeAttr("disabled");
			time = 61;
		} else {
			$("#code_btn").removeClass("sjyz_b");
			$("#code_btn").addClass("sjyz_b1");
			$("#code_btn").attr("disabled","disabled");
			time = time - 1;
			$("#code_btn").val(time+"秒后重新获取");
			setTimeout(function(){timer()},1000);
		}
	}
	var tck = document.getElementById("tck");
	var tck1 = document.getElementById("tck1");
	var tck2 = document.getElementById("tck2");
	var tck3 = document.getElementById("login");
	var over = document.getElementById("over");
	function qzxtck() {
		if(arguments.length == 1){
			$("#hid_product").val(arguments[0]);
// 			alert("productid:"+arguments[0]);
		}else{
			$("#hid_product").val(arguments[0]);
			$("#hid_manager").val(arguments[1]);
// 			alert("productid:"+arguments[0]);
// 			alert("manage:"+arguments[1]);
		}
		
		tck.style.display = "block";
		over.style.display = "block";
	}
	function hide() {
		tck.style.display = "none";
		over.style.display = "none";
	}
	function zxtck1() {
		var mobile = $("#mobile").val();
		if($("#stepOne").valid()){
			$.ajax({
				url:'${ctx}/product/checkMobile',
				type:'post', 
				data:{'mobile':mobile},
				success:function(data){
// //					add by lzc 登录判断
// 					if(data == 'register'){
// 						alert("您还未登录");
// 						document.location.href = '${ctx}/login/member';
// 					}
// //					end
// 					else{
						if(data != 'fail'){
							if(confirm("确认要生成订单?")){
								$.ajax({
									url:'${ctx}/product/addOrder',
									data:{'productId':$("#hid_product").val() , 'memberId':data , 'manageId':$("#hid_manager").val()},
									type:'post',
									success:function(datas){
										if(datas != 'fail'){
											alert("订单添加成功");
											document.location.href = '${ctx}/member/order/detail/applicant?id='+datas;
										}else{
											alert("添加失败");
										}
									}
								});
							}
						}else{
// 							alert(1);
							$.ajax({
								url:"${ctx}/order/fast/step/one",
								type:"post",
								data:{
									tel:mobile,
									productId:$("#hid_product").val(),
									managerId:$("#hid_manager").val()
								},
								success:function(data){
// 									alert(data);
									if (data=="true") {
										tck1.style.display = "block";
										tck.style.display = "none";
										over.style.display = "block";
									} else {
										alert("提交失败");
									}
								}
							});
						}
					}
// 				}
			});
		}
	}
	
	function hide2() {
		tck1.style.display = "none";
		over.style.display = "none";
	}

	function zxtck2() {
		if ($("#stepTwo").valid()) {
			$.ajax({
				url:"${ctx}/order/fast/step/two",
				type:"post",
				data:$("#stepTwo").serialize(),
				success:function(data){
					if (data=="true") {
						tck2.style.display = "block";
						tck1.style.display = "none";
						over.style.display = "block";
					} else {
						alert("提交失败");
					}
				}
			});
		}
	}
	function hide3() {
		tck2.style.display = "none";
		over.style.display = "none";
	}
	function zxtck3() {
		if ($("#stepThree").valid()) {
			$.ajax({
				url:"${ctx}/order/fast/step/three",
				type:"post",
				data:$("#stepThree").serialize(),
				success:function(data){
					if (data=="true") {
						tck3.style.display = "block";
						tck2.style.display = "none";
						over.style.display = "block";
					} else {
						alert("提交失败");
					}
				}
			});
		}
	}
	function hide4() {
		tck3.style.display = "none";
		over.style.display = "none";
	}
	var time = 61;
	function sendCode(){
		var tel = $("#mobile").val();
// 		alert(tel);
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
			$("#code_btn").removeClass("sjyz_b1");
			$("#code_btn").addClass("sjyz_b");
			$("#code_btn").removeAttr("disabled");
			time = 61;
		} else {
			$("#code_btn").removeClass("sjyz_b");
			$("#code_btn").addClass("sjyz_b1");
			$("#code_btn").attr("disabled","disabled");
			time = time - 1;
			$("#code_btn").val(time+"秒后重新获取");
			setTimeout(function(){timer()},1000);
		}
	}
	function getCities(){
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
				}
			});
		}
	}
	function getZones(){
		var cityVal = $("#editC option:selected").val();
		$("#editZ").empty();
		var option1= $("<option/>");
		option1.attr("value","");
		option1.html("请选择");
		$("#editZ").append(option1);
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
				}
			});
		}
	}
	
</script>