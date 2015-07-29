<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-手机验证</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
$(function(){
	
	$("#member_verify_form").validate({
		rules: {
			password:{
				required:true,
				remote:{
					type:"post",
					url:"${ctx}/member/commonctr/chkpwd",
					data:{
						password:function(){return $("#password").val();}
					} 
				}
			},
			confirmpwd:"required",
			confirmpwds: {
				equalTo:"#confirmpwd"
			}
		},
		messages: {
			password:{
				remote:"<span class='zc_zs'>* 原密码错误</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
});
</script>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="tree.jsp"%>
			<div class="hy_right">
				<div class="hy_right_bt">
					<span>手机验证</span>
				</div>
				<div class="tab">
					<s:form commandName="member" method="post" id="member_verify_form">
					<p>
						<span>已认证手机号：</span><s:input path="confirmPhone" class="t1" readonly="true"/>
						<a href="javascript:void(0)" class="xgsjh">修改手机号</a>
					</p>
					<div class="sjxg">
						<p>
							<span>输入新手机号：</span><s:input path="contactPhone" id="common_tel" type="mobile" class="t1 required"/>
						</p>
						<p>
							<span>输入验证码：</span><s:input path="code" class="t2 required"/>
							<input type="button" class="b2" id="verify_code" value="获取验证" onclick="send()"/>
						</p>
						<p>
							<input type="button" value="确认修改" class="b1"
								onclick="javascript:update()" />
						</p>
					</div>
					</s:form>
				</div>
			</div>

			<script type="text/javascript">
				$(document).ready(function() {
					$("a.xgsjh").click(function() {
						$("div.sjxg").slideToggle("slow");
					});
				});
			</script>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>

	<div id="login">
		<div class="login1">
			<div class="bt">
				<h1>手机验证</h1>
				<a href="javascript:hide()"><img src="${ctx }/images/close.png" /></a>
				<div class="clear"></div>
			</div>
			<div class="nr">
				<p>
					<i class="tc_icon"><img src="${ctx }/images/f_p_cg.png"
						style="width: 35px; height: 35px;" /></i><span id="verify_info">恭喜您，18853493223已经通过验证</span>
				</p>
				<p>
					<a href="javascript:void(0)" onclick="hide()" class="qd_btn">确定</a>
				</p>
			</div>
		</div>
	</div>
	<div id="over"></div>
	<script type="text/javascript">
		var login = document.getElementById("login");
		var over = document.getElementById("over");
		function show1() {
			login.style.display = "block";
			over.style.display = "block";
		}
		function hide() {
			login.style.display = "none";
			over.style.display = "none";
		}
		
		function send(){
			var tel = $("#common_tel").val();
			if (!/^(1[3587][0-9]{1})+\d{8}$/.test(tel)) {
				alert("请填写手机号！");
				return;
			}
			$.ajax({
				url:'${ctx}/member/commonctr/tel',
				type:'post',
				dataType:'json',
				contentType:'application/json',
				data:JSON.stringify(tel),
				success:function(data){
					if(data == 'success'){
						alert("发送成功");
						timer();
					}else{
						alert("发送失败");
					}
				}
			});
		}
		var time = 61;
		function timer(){
			if (time == 1) {
				$("#verify_code").val("获取验证码");
				$("#verify_code").removeClass("b3");
				$("#verify_code").addClass("b2");
				$("#verify_code").removeAttr("disabled");
				time = 61;
			} else {
				$("#verify_code").removeClass("b2");
				$("#verify_code").addClass("b3");
				$("#verify_code").attr("disabled","disabled");
				time = time - 1;
				$("#verify_code").val(time+"秒后重新获取");
				setTimeout(function(){timer()},1000);
			}
		}
		
		function update(){
			if($("#member_verify_form").valid()){
				$.ajax({
					url:'${ctx}/member/commonctr/updatetel',
					type:'post',
					data:$("#member_verify_form").serialize(),
					success:function(data){
						if(data == 'success'){
							var tel = $("#common_tel").val();
							$("#verify_info").html("恭喜您,"+tel+"已经通过验证");
							show1();
						}else{
							$("#verify_info").html("抱歉，您输入的验证码不正确，或已经超时，请重新获取验证码。");
							show1();
						}
					}
				});
			}
		}
		
	</script>
</body>
</html>