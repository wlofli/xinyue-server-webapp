<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员_实名认证</title>
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
<script type="text/javascript">
function show1(type)
{
   clearFile();
   switch (type) {
	case "bl":
		$("#h1_title").html("营业执照");
		break;
	case "oc":
		$("#h1_title").html("组织机构代码");
		break;
	case "tr":
		$("#h1_title").html("税务登记证");
		break;
	case "ida":
		$("#h1_title").html("身份证正面");
		break;
	case "idn":
		$("#h1_title").html("身份证反面");
		break;
	case "idp":
		$("#h1_title").html("法人手持身份证照片");
		break;
	default:
		type = "";
		hide();
		break;
	}
   imgType = type;
   $("#login").css("display","block");
   $("#over").css("display","block");
}
function hide()
{
   $("#login").css("display","none");
   $("#over").css("display","none");
}
function hideM()
{
	$("#login1").css("display","none");
	$("#over").css("display","none");
	
	document.location.href = "${ctx}/member/auth/wait";
}
function showM(){
	$("#login1").css("display","block");
	$("#over").css("display","block");
}
</script>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="../member/tree.jsp"%>
			<div class="hy_right">
				<div class="ddxq_top">
					<Ul class="sdlc_ul">
						<li class="bt"><img src="${ctx}/images/smrz_bt.png" /></li>
						<li class="rz_num1"><i></i>
						<p>
								<strong>1</strong><span>填写信息<br />提交申请
								</span>
							</p></li>
						<li class="rz_num2"><i></i>
						<p>
								<strong>2</strong><span>专业审核人员<br />进行信息预审
								</span>
							</p></li>
						<li class="rz_num3"><i></i>
						<p>
								<strong>3</strong><span>国家权威机构<br />数据库交互验证
								</span>
							</p></li>
						<li class="rz_num4"><i></i>
						<p>
								<strong>4</strong><span>企业实名<br />认证成功
								</span>
							</p></li>
					</Ul>
				</div>
				<div class="hy_right_bt">
					<ul class="menu1" id="menu">
						<span>实名认证</span>
					</ul>
				</div>
				<div class="tab">
					<sf:form action="${ctx}/member/auth/submit" commandName="authInfo" method="post" id="authForm" enctype="multipart/form-data">
						<p class="qiye_bt">
							<strong>基本信息</strong>
						</p>
						<p>
							<span>公司名称：</span>
							<sf:input path="companyName" cssClass="t1 required"/>
							<sf:hidden path="code"/>
						</p>
						<p>
							<span>营业执照注册号：</span>
							<sf:input path="zone" cssClass="t1" id="bl_num"/>
						</p>
						<p>
							<span>法人姓名：</span>
							<sf:input path="legalPersonName" cssClass="t1 required"/>
						</p>
						<p>
							<span>法人身份证号码：</span>
							<sf:input path="legalPersonID" cssClass="t1"/>
						</p>
						<p>
							<span>法人手机号：</span>
							<sf:input path="legalPersonTel" cssClass="t1 required telphone" id="lp_tel" onblur="moveMes()"/>
							<input type="button" class="b2" value="获取验证码" id="code_btn" onclick="sendCode()"/>
							<span class='zc_zs' id="no_tel"></span>
						</p>
						<p>
							<span>输入手机验证码：</span>
							<input id="check_c" name="checkCode" value="" class="t1" />
						</p>
						<p>
							<span>注册地址：</span>
							<sf:input path="registerAddress" cssClass="t1 required"/>
						</p>
						<p>
							<span>注册日期：</span>
							<sf:input path="companyRegDate" cssClass="t1 required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
						</p>
						<p>
							<span>注册资金(万)：</span>
							<sf:input path="regFund" cssClass="t1 required digits"/>
						</p>
						<p class="qiye_bt">
							<strong>联系方式</strong>
						</p>
						<p>
							<span>联系人姓名：</span>
							<sf:input path="contactPerson" cssClass="t1 required"/>
						</p>
						<p>
							<span>联系人性别：</span>
							<sf:radiobutton path="contactSex" value="1" cssClass="r1"/><span class="r1_sex">男</span>
							<sf:radiobutton path="contactSex" value="2" cssClass="r1"/><span class="r1_sex">女</span>
							<sf:radiobutton path="contactSex" value="3" cssClass="r1"/><span class="r1_sex">保密</span>
						</p>
						<p>
							<span>联系人电话：</span>
							<sf:input path="contactTel" cssClass="t1 required telphone"/>
						</p>
						<p>
							<span>联系人邮箱：</span>
							<sf:input path="contactEmail" cssClass="t1 required email"/>
						</p>
						<p>
							<span>联系人地址：</span>
							<sf:input path="contactAddress" cssClass="t1 required"/>
						</p>
						<p>
							<span>邮编：</span>
							<sf:input path="postCode" cssClass="t1 required"/>
						</p>
						<p class="qiye_bt">
							<strong>执照上传</strong>
						</p>
						<div class="zzsc_p">
							<ul class="zzsc_ul">
								<li class="zzsc_li">
									<span>营业执照</span>
									<c:choose>
										<c:when test="${empty authInfo.businessLicense}">
											<img src="${ctx}/images/yyzz_icon.png" id="img_bl" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_bl_1" style="display:block;">
												<input type="button" onclick="javascript:show1('bl')" value="立即上传" class="sc_btn" />
											</div>
											<div class="zs_li_cz" id="div_bl_2" style="display:none;">
												<span>已上传</span><a href="javascript:void(0);" onclick="show1('bl')">修改</a>
											</div>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}${authInfo.businessLicense}" id="img_bl" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_bl_2">
												<span>已上传</span><a href="javascript:void(0);" onclick="show1('bl')">修改</a>
											</div>
										</c:otherwise>
									</c:choose>
									<sf:hidden path="businessLicense" id="hid_bl"/>
								</li>
								<li class="zzsc_li">
									<span>组织机构代码</span>
									<c:choose>
										<c:when test="${empty authInfo.organizationCode}">
											<img src="${ctx}/images/zzjgdm_icon.png" id="img_oc" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_oc_1">
												<input type="button" onclick="javascript:show1('oc')" value="立即上传" class="sc_btn" />
											</div>
											<div class="zs_li_cz" id="div_oc_2" style="display: none">
												<span>已上传</span><a href="javascript:show1('oc')">修改</a>
											</div>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}${authInfo.organizationCode}" id="img_oc" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_oc_2">
												<span>已上传</span><a href="javascript:show1('oc')">修改</a>
											</div>
										</c:otherwise>
									</c:choose>
									<sf:hidden path="organizationCode" id="hid_oc"/>
								</li>
								<li class="zzsc_li">
									<span>税务登记证</span>
									<c:choose>
										<c:when test="${empty authInfo.taxRegistration}">
											<img src="${ctx}/images/swdjz_icon.png" id="img_tr" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_tr_1">
												<input type="button" onclick="javascript:show1('tr')" value="立即上传" class="sc_btn" />
											</div>
											<div class="zs_li_cz" id="div_tr_2" style="display: none">
												<span>已上传</span><a href="javascript:show1('tr')">修改</a>
											</div>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}${authInfo.taxRegistration}" id="img_tr" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_tr_2">
												<span>已上传</span><a href="javascript:show1('tr')">修改</a>
											</div>
										</c:otherwise>
									</c:choose>
									<sf:hidden path="taxRegistration" id="hid_tr"/>
								</li>
							</ul>
						</div>
						<p class="qiye_bt">
							<strong>证件上传</strong>
						</p>
						<div class="zzsc_p">
							<ul class="zzsc_ul">
								<li class="zzsc_li">
									<span>身份证正面</span>
									<c:choose>
										<c:when test="${empty authInfo.identityCarda}">
											<img src="${ctx}/images/sfz1_icon.png" id="img_ida" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_ida_1">
												<input type="button" onclick="javascript:show1('ida')" value="立即上传" class="sc_btn" />
											</div>
											<div class="zs_li_cz" id="div_ida_2" style="display: none">
												<span>已上传</span><a href="javascript:show1('ida')">修改</a>
											</div>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}${authInfo.identityCarda}" id="img_ida" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_ida_2">
												<span>已上传</span><a href="javascript:show1('ida')">修改</a>
											</div>
										</c:otherwise>
									</c:choose>
									<sf:hidden path="identityCarda" id="hid_ida"/>
								</li>
								<li class="zzsc_li">
									<span>身份证反面</span>
									<c:choose>
										<c:when test="${empty authInfo.identityCardn}">
											<img src="${ctx}/images/sfz2_icon.png" id="img_idn" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_idn_1">
												<input type="button" onclick="javascript:show1('idn')" value="立即上传" class="sc_btn" />
											</div>
											<div class="zs_li_cz" id="div_idn_2" style="display: none">
												<span>已上传</span><a href="javascript:show1('idn')">修改</a>
											</div>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}${authInfo.identityCardn}" id="img_idn" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_idn_2">
												<span>已上传</span><a href="javascript:show1('idn')">修改</a>
											</div>
										</c:otherwise>
									</c:choose>
									<sf:hidden path="identityCardn" id="hid_idn"/>
								</li>
								<li class="zzsc_li">
									<span>法人手持身份证照片</span>
									<c:choose>
										<c:when test="${empty authInfo.identityCardp}">
											<img src="${ctx}/images/frhsfz_icon.png" id="img_idp" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_idp_1">
												<input type="button" onclick="javascript:show1('idp')" value="立即上传" class="sc_btn" />
											</div>
											<div class="zs_li_cz" id="div_idp_2" style="display: none">
												<span>已上传</span><a href="javascript:show1('idp')">修改</a>
											</div>
										</c:when>
										<c:otherwise>
											<img src="${imgPath}${authInfo.identityCardp}" id="img_idp" width="164px" height="105px"/>
											<div class="zs_li_cz" id="div_idp_2">
												<span>已上传</span><a href="javascript:show1('idp')">修改</a>
											</div>
										</c:otherwise>
									</c:choose>
									<sf:hidden path="identityCardp" id="hid_idp"/>
								</li>
							</ul>
						</div>
						<p>
							<input type="button" value="提交申请" class="b1" onclick="authSubmit()"/>
						</p>
					</sf:form>
				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
	<div id="login">
		<div class="login1">
			<div class="bt">
				<h1 id="h1_title"></h1>
				<a href="javascript:hide()"><img src="${ctx}/images/close.png" /></a>
				<div class="clear"></div>
			</div>
			<div class="nr">
				<p><span class="zs">图片大小为大于或等于300kb，文件为jpg、png或gif </span></p>
				<p><input type="file" id="id_file" name="authFiles" class="file"/></p>
				<p><span class="zs1" id="img_err"></span></p>
				<p><a href="javascript:void();" onclick="uploadFile()" class="qd_btn">上传文件</a></p>
			</div>
		</div>
	</div>
	<div id="login1">
		<div class="login1">
			<div class="bt">
				<h1>实名认证提示</h1>
				<a href="javascript:hideM()"><img src="${ctx}/images/close.png" /></a>
				<div class="clear"></div>
			</div>
			<div class="nr">
				<p>
					<i class="tc_icon">
						<img src="${ctx}/images/f_p_cg.png" style="width: 35px; height: 35px;" />
					</i>
					<span>
						您好，实名认证信息已经成功提交，新越网将在2-3个工作日内进行审核。你也可以拨打客服电话联系我们：
						<strong>4008609280</strong>或
						<strong>0571-88079229</strong>。
					</span>
				</p>
				<p>
					<a href="#" class="qd_btn" onclick="hideM()">我知道了</a>
				</p>
			</div>
		</div>
	</div>
	<div id="over"></div>
</body>
<script type="text/javascript">
var time = 61;
var imgType = "";
$(function () {
	$("#authForm").validate({
		rules :{
			legalPersonID:{
				required:true,
				rangelength:[18,18]
			},
			checkCode:{
				required:true,
				remote:{
		            type: "post",
		            url:"${ctx}/common/check/code",
		            data:{
		            	checkCode: function(){return $("#check_c").val();}
		            }
		      	}
			},
			zone:{
				required:true,
				digits:true,
				rangelength:[15,15],
				remote:{
		            type: "post",
		            url:"${ctx}/common/check/bl",
		            data:{
		            	bl: function(){return $("#bl_num").val();}
		            }
		      	}
			},
			postCode:{
				required:true,
				digits:true,
				rangelength:[6,6]
			}
		},
		messages: {
			legalPersonID:{
				rangelength:"<span class='zc_zs'>* 身份证不正确</span>"
			},
			checkCode:{
				remote:"<span class='zc_zs'>* 手机验证码错误</span>"
			},
			zone:{
				rangelength:"<span class='zc_zs'>* 营业执照注册号不正确</span>",
				remote:"<span class='zc_zs'>* 营业执照注册号不正确</span>"
			},
			postCode:{
				rangelength:"<span class='zc_zs'>* 邮编不正确</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
	
	var message = "${message}";
	if (message == "true") {
		showM();
	} else if(message == "false"){
		alert("实名认证保存失败，请联系管理员");
	}
});

function sendCode(){
	var tel = $("#lp_tel").val();
	if (tel == "") {
		$("#no_tel").html("* 请填写手机号");
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
		$("#code_btn").removeClass("b3");
		$("#code_btn").addClass("b2");
		$("#code_btn").removeAttr("disabled");
		time = 61;
	} else {
		$("#code_btn").removeClass("b2");
		$("#code_btn").addClass("b3");
		$("#code_btn").attr("disabled","disabled");
		time = time - 1;
		$("#code_btn").val(time+"秒后重新获取");
		setTimeout(function(){timer()},1000);
	}
}

function moveMes(){
	$("#no_tel").html("");
}

function authSubmit(){
	var bl = $("#hid_bl").val();
	var oc = $("#hid_oc").val();
	var tr = $("#hid_tr").val();
	var ida = $("#hid_ida").val();
	var idn = $("#hid_idn").val();
	var idp = $("#hid_idp").val();
	
	if ($("#authForm").valid()) {
		if (bl != "" && oc !="" && tr != "" && ida != "" && idn != "" && idp != "") {
			$("#authForm").submit();
		} else {
			alert("有文件未上传！");
			return;
		}
	}
}

function uploadFile(){
	var type = "";
	var fileVal = $("#id_file").val();
	var fileSize = document.getElementById("id_file").files[0].size;
	$("#img_err").html("");
	if (fileVal == "") {
		$("#img_err").html("请选择文件");
		return;
	}
	if (fileVal != "") {
		type = fileVal.split(".");
		if (type[1].toLowerCase() != "jpg" && type[1].toLowerCase() != "png" && type[1].toLowerCase() != "gif") {
			$("#img_err").html("图片大小超过300kb或者格式不正确，请重新选择1");
			return;
		}else if (fileSize/1000 > 300) {
			$("#img_err").html("图片大小超过300kb或者格式不正确，请重新选择2");
			return;
		}
	}
	
	$.ajaxFileUpload({
		url:'${ctx}/member/auth/file/add?suffix='+type[1],
		secureuri:false,
		fileElementId:'id_file',
		dataType:'json',
		success:function(data){
			if (data != "fail") {
				alert("上传成功");
				hide();
				data = eval(data);
				$("#hid_"+imgType).val(data[0].name);
				$("#img_"+imgType).attr("src",data[0].path);
				
				$("#div_"+imgType+"_1").css("display","none");
				$("#div_"+imgType+"_2").css("display","block");
			}
		}
	});
}

function clearFile(){
	var file = $("#id_file") ;  
	file.after(file.clone().val(""));
	file.remove();
}

</script>
</html>