<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_普通会员注册</title>
<%@ include file="../common/common.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="../common/head.jsp"%>
		<div class="center">
			<div class="c_bt">
				<h1>填写注册信息</h1>
				<span>（全部为必填项）</span>
			</div>
			<div class="c_nr">
				<sf:form action="${ctx}/register/submit" commandName="registerInfo" method="post" id="registerForm">
					<div class="zc_wbk">
						<span class="zc_bt">用户名:</span>
						<sf:input path="loginName" class="text" placeholder="4-20个字符，用户名只能输入数字、字母或中文"/>
						<sf:hidden path="invited"/>
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">密码:</span>
						<sf:password path="password" class="text" />
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">确认密码:</span>
						<input type="password" value="" class="text" name="passwordConfirm" />
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">企业名称:</span>
						<sf:input path="company" class="text required"/>
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">所在地区:</span>
						<sf:select path="provinceid" class="csxz1" id="editP" onchange="getCities()">
							<sf:option value="">--省--</sf:option>
							<sf:options items="${provinces}" itemValue="key" itemLabel="value"/>
						</sf:select>
						<sf:select path="cityid" class="csxz1" id="editC" onchange="getZones()">
							<sf:option value="">--市--</sf:option>
						</sf:select>
						<sf:select path="zoneid" class="csxz1" id="editZ">
							<sf:option value="">--区/县--</sf:option>
						</sf:select>
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">电子邮箱:</span>
						<sf:input path="email" class="text" id="email_id"/>
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">联系人:</span>
						<sf:input path="contactName" class="text required"/>
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">手机号:</span>
						<sf:input path="contactPhone" class="text required mobile" id="tel"/>
					</div>
					<div class="zc_wbk">
						<span class="zc_bt">手机验证码:</span>
						<input id="check_c" name="checkCode" value="" class="text1" />
						<input type="button" class="btn_sjyz" value="获取验证码" id="code_btn" onclick="sendCode()" />
					</div>
					<div class="zc_tk">
						<input type="checkbox" class="left" checked="checked" id="server_chk"/>
						<span>我已阅读并接受<a href="#">《用户服务协议》</a></span>
					</div>
					<div class="zc_btn">
						<input type="button" id="btn_register" value="注 册" class="z_btn" onclick="register()"/>
					</div>
				</sf:form>
				<div class="smdl">
					<img src="../images/smzc.jpg" /> <span>微信扫一扫，直接登录</span>
					<p class="l_fs">
						<span>其他方式登录：</span><a href="#" class="qq"></a><a href="#"
							class="wx"></a><a href="#" class="xl"></a>
					</p>
				</div>
			</div>
		</div>
		<%@ include file="../common/foot.jsp"%>
		
<div id="login" >
       <div class="login1"> 
         <div class="bt"><h1>注册成功</h1><a href="javascript:hide()"><img src="${ctx }/images/close.png" /></a><div class="clear"></div></div>
       <div class="nr"> 
       <p style="text-align:center;"><i class="tc_icon1" ><img src="${ctx }/images/f_p_cg.png" style="width:35px; height:35px;" /></i><span class="zccg_ts">恭喜您已成功注册为新越网会员</span></p>
       <p style="text-align:center;"> 您的新越网专用账号：<a href="${ctx }/member/list?param=main" style="color:#0075a9; font-size:16px;" id="registName"></a> </p>
       <p style="margin:30px 0 30px 0;"><a href="${ctx}/product/show" class="sd_btn">查看产品</a><a href="${ctx}/product/show" class="sd_btn1">我要申贷</a></p>
       </div>
        </div>
</div>
<div id="over"></div>
	</div>
</body>
<script type="text/javascript">
var time = 61;
$(function(){
	$("#registerForm").validate({
		rules: {
			loginName:{
				required:true,
				rangelength:[4,20],
				charstr:true
			},
			password:"required",
			passwordConfirm: {
				equalTo:"#password"
			},
			email:{
				required:true,
				email:true,
				remote:{
					type: "post",
                    url:"${ctx}/register/check/email",
                    data:{
                    	email: function(){return $("#email_id").val();}
                    }
				}
			},
			zoneid:"required",
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
			city:"<span class='zc_zs'>* 请选择所在地区</span>",
			checkCode:{
				remote:"<span class='zc_zs'>* 手机验证码错误</span>"
			},
			loginName:{
				rangelength:"<span class='zc_zs'>* 4~20个字符</span>"
			},
			email:{
				remote:"<span class='zc_zs'>* 该邮箱已被注册</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
});

function sendCode(){
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
		$("#code_btn").removeClass("btn_sjyz1");
		$("#code_btn").addClass("btn_sjyz");
		$("#code_btn").removeAttr("disabled");
		time = 61;
	} else {
		$("#code_btn").removeClass("btn_sjyz");
		$("#code_btn").addClass("btn_sjyz1");
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
	option.html("--市--");
	$("#editC").append(option);
	$("#editZ").empty();
	var option1= $("<option/>");
	option1.attr("value","");
	option1.html("--区/县--");
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
	option1.html("--区/县--");
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

function register(){
	if ($("#registerForm").valid()) {
		if (!$("#server_chk").is(':checked')) {
			alert("请确认用户服务协议");
			return;
		}
		$.ajax({
		   url:"${ctx}/register/submit",
		   type:"post",
		   data:$("#registerForm").serialize(),
		   async:false,
		   success:function(data){
		    	if(data == "success"){
		    		$("#registName").html($("#loginName").val());
		    		$("#btn_register").attr("disabled",true);
		    		$("#login").show();
		   		}else{
				  alert("注册失败"); 
	  		 	}
		   }
		});
// 		$("#registerForm").submit();
	}
}
</script>
</html>