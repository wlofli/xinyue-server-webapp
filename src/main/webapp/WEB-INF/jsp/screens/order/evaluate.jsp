<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-评价</title>
<%@include file="../../common/common.jsp" %>
<script type="text/javascript" runat="server" src="${ctx}/js/star.js"></script>
<script type="text/javascript">
function save(){
	var star = $("#stars").text().substring(0,1);
	if(star >= 1 && star <= 5){
		$("#leval").val(star);
// 		alert($("#leval").val());
		$.ajax({
		   url:"${ctx}/order/save/evaluate",
		   method:"post",
		   data:$("#form").serialize(),
		   sync:true,
		   success:function(data){
			   if(data == "success"){
				   alert("评价成功");
				   window.location.href="${ctx}/order/detail?id=${order.id}";
			   }else{
				   alert("评价失败");
			   }
		   }
		});
// 		$("#form").submit();
	}else{
		alert("未评星级");
		return;
	}
}

</script>
</head>

<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<div class="hy_top">
<div class="bt"><strong>评价</strong></div></div>
<div class="ddxq_top"> 
<div class="ddxq_nr">
<sf:form action="${ctx }/order/save/evaluate" commandName="order" method="post" id="form">
<sf:hidden path="id"/>
<sf:hidden path="leval"/>
<div id="star"><span>星级：</span>
<ul>
<li><a href="javascript:;">1</a></li>
<li><a href="javascript:;">2</a></li>
<li><a href="javascript:;">3</a></li>
<li><a href="javascript:;">4</a></li>
<li><a href="javascript:;">5</a></li>
</ul>
<span id="stars"></span>
<p></p>
</div>
<div class="ddxq_pj">
<span>内容:</span><textarea class="t1" name="evaluateContent"></textarea>
</div>

<span class="btn_span"><input type="button" class="btn" value="提交评价" onclick="save()"/></span>
</sf:form>
</div>
</div> 
</div> 
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
