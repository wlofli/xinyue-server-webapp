<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/common.jsp"%>
<title>普通会员_企业档案</title>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="../member/tree.jsp"%>
			<div class="hy_right">
				<div class="hy_top">
					<div class="bt">
						<strong>企业档案</strong>
					</div>
				</div>
				<c:if test="${recordType eq 'applicant'}">
					<%@ include file="../member/applicant.jsp"%>
				</c:if>
				<c:if test="${recordType eq 'business'}">
					<%@ include file="../member/business.jsp"%>
				</c:if>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
</body>
<script type="text/javascript">
function save(type){
	$.ajax({
		url:"${ctx}/member/save/applicant",
		type:"post",
		data:$("#applicantForm").serialize(),
		success:function(data){
			if (type == 1) {
				if (data== 'true') {
					alert("保存成功");
				} else {
					alert("保存失败");
				}
			}else if (type == 2){
				if (data== 'true') {
					alert("保存成功");
					document.location.href = "${ctx}/member/record/company";
				} else {
					alert("保存失败");
				}
			}
		}
	});
	
}
</script>
</html>