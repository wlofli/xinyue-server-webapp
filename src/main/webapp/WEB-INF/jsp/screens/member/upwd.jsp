<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-修改密码</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
$(function(){
	
	$("#common_pwd_from").validate({
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
			passwordConfirm:"required",
			passwordCheck: {
				equalTo:"#passwordConfirm"
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
					<ul class="menu1" id="menu">
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=basic'">基本信息</a></li>
						<li class="hit"><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=updatepwd'">修改密码</a></li>
					</ul>
				</div>

				<div class="tab">
					<s:form commandName="pwdinfo" method="post" id="common_pwd_form">
					<p>
						<span>旧密码：</span><s:password path="password" class="t1 required"/>
					</p>
					<p>
						<span>新密码：</span><s:password path="passwordConfirm" id="common_confirm_pwd" class="t1 required"/>
					</p>
					<p>
						<span>确认密码：</span><s:password path="passwordCheck" class="t1 required"/>
					</p>
					<p>
						<input type="button" value="确认修改" class="b1" onclick="change()"/>
					</p>
					</s:form>
				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
<script type="text/javascript">
function change(){
	
	if ($("#common_pwd_form").valid()) {
		$.ajax({
			url:"${ctx}/member/commonctr/updatepwd",
			type:"post",
			dataType:'json',
			contentType:'application/json',
			data:JSON.stringify($("#common_confirm_pwd").val()),
			success:function(data){
				if (data=="success") {
					alert("修改成功");
				} else {
					alert("修改失败！");
				}
			}
		});
	}
}
</script>
</body>
</html>