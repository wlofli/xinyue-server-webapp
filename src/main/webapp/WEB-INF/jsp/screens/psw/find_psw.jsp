<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_找回密码</title>
<%@ include file="../../common/common.jsp" %>
</head>
<body class="bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="center">
			<div class="find_pw"></div>
			<div class="c_f">
				<sf:form action="${ctx}/login/find/psw?step=1" commandName="pswInfo" method="post" id="pswForm">
					<div class="f_wbk">
						<span class="f_bt">手机号码：</span><sf:input path="contactPhone" cssClass="f_sjh" id="tel"/>
					</div>
					<div class="f_wbk">
						<span class="f_bt">验证码：</span>
						<input id="checkCode" value="" class="f_yzm" name="checkC" />
						<a href="javascript:void(0)" onClick="document.getElementById('aucode').src='${ctx}/imgauthcode?'+getSec()">
							<img id="aucode" border="0" src="${ctx}/imgauthcode" class="f_yzm_img"/>
						</a>
					</div>
					<div class="f_tj">
						<input type="submit" value="下一步" class="f_btn" />
					</div>
				</sf:form>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
</body>
<script type="text/javascript">
function getSec(){
	var myDate = new Date();
	return myDate.getTime();
}
$(function(){
	$("#pswForm").validate({
		rules:{
			checkC:{
				required:true,
				remote:{
					type: "post",
                    url: "${ctx}/login/check/code",
                    data:{
                    	checkCode: function(){return $("#checkCode").val();}
                    }
				}
			},
			contactPhone:{
				required:true,
				mobile:true,
				remote:{
					type: "post",
                    url: "${ctx}/login/check/phone",
                    data:{
                    	phone: function(){return $("#tel").val();}
                    }
				}
			}
		},
		messages: {
			checkC:{
				required:"<span class='zc_zs'>* 请输入验证码</span>",
				remote:"<span class='zc_zs'>* 验证码不正确</span>"
			},
			contactPhone:{
				remote:"<span class='zc_zs'>* 该手机号码不存在</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
});
</script>
</html>