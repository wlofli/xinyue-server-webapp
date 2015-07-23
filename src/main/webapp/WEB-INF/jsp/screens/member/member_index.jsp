<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../../common/common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员首页</title>

<script type="text/javascript">
var login=document.getElementById("login1");
var over=document.getElementById("over");
function show1()
{
   login.style.display = "block";
   over.style.display = "block";
}
function hide()
{
     login.style.display = "none";
     over.style.display = "none";
 }
 
 var order_i = 0;//订单初始值
 var orderlen = "${order.size()}";
 var list = <%=request.getAttribute("order")%>;
//  var orderlist = eval('('+list+')');
 
 $().ready(function(){
	 alert(list);
 });
 function changePage(){
	 $("#first").attr("disable",false);
	 $("#end").attr("disable",false);
	 if(order_i = 0){
		 $("#first").attr("disable",true);
	 }
	 if(order_i = orderlen){
		 $("#end").attr("disable",true);
	 }
 }
 
function getOrder(n){
	 order_i += n;
// 	 alert(orderlist[0].code);
// 	 alert(orderlist[1].code);
// 	 alert(orderlist[2].code);
// 	 alert(orderlist[3].code);
// 	 alert(orderlist[4].code);
// 	 alert(orderlist[5].code);
// 	 alert(orderlist[6].code);
	 alert(list[0]);
	 alert(orderlist[8]);
	 alert(orderlist[9]);
	 alert(orderlist[10]);
	 $(".hy_dd_nr1").empty();
	 $(".hy_dd_nr1").append("<span>订单号：<a href='#undone->不知道去哪'>${order[1].code }</a>&nbsp;&nbsp;&nbsp;&nbsp;"
	 +"订单提交日期：<strong><fmt:formatDate value='${order[1].createdTime }' pattern='yyyy-MM-dd h:m'/></strong></span>");
	 $(".hy_dd_nr2").empty();
	 $(".hy_dd_nr2").append("<c:choose><c:when test='${order[1].status == &quot;需求填写中&quot; }'><img src='../images/order_zt_bj.png'  /></c:when><c:when test='${order[1].status == &quot;等待新越网审核&quot;}'><img src='../images/order_zt_bj1.png'  /></c:when><c:when test='${order[1].status == &quot;放款成功&quot; }'><img src='../images/order_zt_bj4.png'  /></c:when><c:when test='${order[1].status == &quot;新越网审核中&quot; || order[1].status == &quot;新越网审核通过&quot; || order[1].status == &quot;新越网审核不通过&quot; }'><img src='../images/order_zt_bj2.png' /></c:when><c:otherwise><img src='../images/order_zt_bj3.png'  /></c:otherwise></c:choose>"
	 +"<div class='float_l_hy1'><span>产品名称：<strong>${order[1].productName }</strong></span>"
	 +"<span>所属机构：<strong>${order[1].bank }</strong></span><span>订单状态：<strong>${order[1].status }</strong></span>"
	 +"</div><div class='float_y_hy'><p>"
	 +"<a class='float_y_hy_a' href='#'>附件补充</a><a class='float_y_hy_a' href='#'>完善资料</a>"
	 +"<a class='float_y_hy_a' href='#'>查看详情</a><a class='float_y_hy_a' href='javascript:deleteOrder(&quot;${order[1].id }&quot;)'>取消订单</a></p></div>"
	 +"<div class='clear'></div><div class='hy_dd_nr2'></div>");
	 
}
	function deleteOrder(id){
		$.ajax({
			url:"${ctx}/order/delete?list=" + id,
			type:'post',
			async:false,
			success:function(data){
				if(data == 'success'){
					alert('取消成功');
					window.location.href="${ctx }/member/list?param=main";
				}else{
					alert('取消失败');
				}
			}
		});
	}
 
 
</script>
</head>

<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="tree.jsp"></jsp:include>
<div class="hy_right">
<div class="hy_r_top1">
<img src="${ctx }/images/tx_hy.png" onclick="javascript:show1()" style="cursor:pointer;" />
<div class="float_l_hy">
<span class="yhm">用户名：<strong>${user.contactName }</strong></span>
<span class="yhm"><a href="#" title="个人信息" class="per_icon"></a><a href="#" title="手机验证"  class="tel_icon"></a><a href="#" title="实名认证"  class="sm_icon"></a><a href="#" title="邮箱验证"  class="yx_icon"></a></span>
<div class="clear"></div>
<span>企业名称：<strong>${user.company }</strong></span>
</div>
<ul class="float_y_hy">
<li><a href="#"><strong>200<font>元</font></strong><span>推荐奖励</span></a></li>
<li><a href="#"><strong>12<font>个</font></strong><span>推荐会员</span></a></li>
<li><a href="#"><strong>${order.size()}<font>个</font></strong><span>贷款订单</span></a></li>
<li class="clear"></li>
</ul>
</div>
<div class="hy_r_top2">
<ul class="rz_ul">
<li class="rz_li1"><a href="#"><i></i><span>帐号信息</span></a></li>
<li class="rz_li2"><a href="#"><i></i><span>企业档案</span></a></li>
<li class="rz_li3"><a href="#"><i></i><span>实名认证</span></a></li>
<li class="rz_li4"><a href="#"><i></i><span>下载中心</span></a></li>
<li class="clear"></li>
</ul>
</div>
<div class="hy_r_top3">
<div class="hy_dd_bt"><span>我的贷款订单${order[0] }</span></div>
<div class="hy_dd_nr">
<%-- <c:if test="${order != null }"> --%>
<div class="hy_dd_nr1">
<span>订单号：<a href="#">${order[0].code }</a>&nbsp;&nbsp;&nbsp;&nbsp;
订单提交日期：<strong><fmt:formatDate value="${order[0].createdTime }" pattern="yyyy-MM-dd h:m"/></strong></span> </div>
<div class="hy_dd_nr2">
<c:choose>
	<c:when test="${order[0].status == '需求填写中' }">
		<img src="../images/order_zt_bj.png" />
	</c:when>
	<c:when test="${order[0].status == '等待新越网审核'}">
		<img src="../images/order_zt_bj1.png" />
	</c:when>
	<c:when test="${order[0].status == '放款成功' }">
		<img src="../images/order_zt_bj4.png" />
	</c:when>
	<c:when test="${order[0].status == '新越网审核中' || order[0].status == '新越网审核通过' || order[0].status == '新越网审核不通过' }">
		<img src="../images/order_zt_bj2.png" />
	</c:when>
	<c:otherwise>
		<img src="../images/order_zt_bj3.png" />
	</c:otherwise>
</c:choose>
<div class="float_l_hy1">
<span>产品名称：<strong>${order[0].productName }</strong></span>
<span>所属机构：<strong>${order[0].bank }</strong></span>
<span>订单状态：<strong>${order[0].status }</strong></span>

</div>
<div class="float_y_hy">
<p>
<a class="float_y_hy_a" href="#undone">附件补充</a>
<a class="float_y_hy_a" href="#undone">完善资料</a>
<a class="float_y_hy_a" href="#undone">查看详情</a>
<a class="float_y_hy_a" href="javascript:deleteOrder('${order[0].id }')">取消订单</a></p>
</div>
<div class="clear"></div>
</div>
<%-- </c:if> --%>


<div class="hy_dd_nr3"><img src="${ctx }/images/order_zt_bj3.png" /></div>
</div>
<div class="hy_dd_page"><a href="javascript:getOrder(-1)" id="first" class="dd_page_n">上一条</a><span>第1条/共8条</span><a href="javascript:getOrder(1)" id="end" class="dd_page_h">下一条</a></div>

</div>
<div class="hy_r_top4">
<div class="hy_tjcp_bt">
<span>推荐产品</span>
</div>
<div class="hy_tjcp_nr">
<ul class="tjcp_ul">
<c:forEach items="${product }" var="list" varStatus="vs" >
	<li class="tjcp_li"><a href="#"><img src="${ctx }undone" /><span>产品名称：<strong>${list.name }</strong></span></a></li>
</c:forEach>
<%-- <li class="tjcp_li"><a href="#"><img src="${ctx }/images/tjcp_tb.png" /><span>产品名称：<strong>税贷通</strong></span></a></li> --%>
<%-- <li class="tjcp_li"><a href="#"><img src="${ctx }/images/tjcp_tb1.png" /><span>产品名称：<strong>税贷通1</strong></span></a></li> --%>
<%-- <li class="tjcp_li"><a href="#"><img src="${ctx }/images/tjcp_tb2.png" /><span>产品名称：<strong>税贷通2</strong></span></a></li> --%>
<%-- <li class="tjcp_li"><a href="#"><img src="${ctx }/images/tjcp_tb.png" /><span>产品名称：<strong>税贷通</strong></span></a></li> --%>
</ul>
</div>
</div>
</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

<div id="login1" >
       <div class="login1"> 
         <div class="bt"><h1>修改头像</h1><a href="javascript:hide()"><img src="${ctx }/images/close.png" /></a><div class="clear"></div></div>
       <div class="nr"> 
       <p><input type="file" class="file" class="选择本地文件" /></p>
       <p><a href="#" class="qd_btn">确定</a></p>
       </div>
        </div>
  </div>  
    <div id="over"></div>
 
</body>
</html>

