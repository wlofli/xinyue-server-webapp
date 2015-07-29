<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
<script type="text/javascript">
$(function(){
	$(".left_nav .f_nav li #a").click(function(){ 
		$(this).parent().find('.f_nav_ful').removeClass("menu_chioce");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('.f_nav_ful').slideToggle();
		$(this).parent().find('.f_nav_ful').addClass("menu_chioce");
	});
})

</script>
</head>
<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<jsp:include page="detailHead.jsp" />
<div class="tab">
<table class="sczl_table">
<thead>
<tr>
<td colspan="1">序号</td>
<td colspan="4">资料类型</td>
<td colspan="3">上传文件</td>
<td colspan="2">上传时间</td>
</tr>
</thead>
<tbody>
<tr>
<td colspan="1">1</td>
<td colspan="4">税务登记证(副本)</td>
<td colspan="3"><a href="#" class="zlsc_btn">选择文件</a> <input type="file" class="hidden" /><a href="#" class="zlsc1_btn">上传文件</a></td>
<td colspan="2">  </td>
</tr>

<tr>
<td colspan="1">1</td>
<td colspan="4">配偶身份证</td>
<td colspan="3"><span class="zlysc">已上传</span><a href="#" class="zlsc1_btn">重新上传</a></td>
<td colspan="2">2015-05-12</td>
</tr>
</tbody>
</table>
<div class="hy_dd_page"><span>共20条记录</span><a href="#" class="dd_page_n">上一页</a><span>第1/2页</span><a href="#" class="dd_page_h">下一页</a></div>
<p><input type="button" value="上一步" class="b1" /><input type="button" value="提交" class="b4" /></p>

</div>
  
</div>
</div>

<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
