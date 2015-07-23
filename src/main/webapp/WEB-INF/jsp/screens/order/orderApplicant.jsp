<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../common/common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<script type="text/javascript">
</script>
</head>

<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<div class="ddxq_top">
<div class="ddlc"><Img src="${ctx }/images/order_zt_bj4.png" /></div>
<jsp:include page="detailHead.jsp" />
</div>
<div class="hy_right_bt">
<ul class="menu1" id="menu">
<li class="hit"><a href="ddxq_hy.html">申请人信息</a></li>
<li class=""><a href="ddxq_hy1.html">企业基本信息</a></li> 
<li class=""><a href="ddxq_hy2.html">基本经营信息</a></li> 
<li class=""><a href="ddxq_hy3.html">抵押物与负债</a></li> 
<li class=""><a href="ddxq_hy4.html">上传资料</a></li> 
</ul>
</div>
<div class="tab" id="tab0" >
<p><span>申请人姓名：</span><input type="text" class="t1" /></p>
<p><span>联系方式：</span><input type="text" class="t1" /></p>
<p><span>电子邮箱：</span><input type="text" class="t1" /></p>
<p><span>申贷期限(月)：</span><input type="text" class="t1" /></p>
<p><span>申贷金额(万)：</span><input type="text" class="t1" /></p>
<p><span>申贷用途(万)：</span><input type="text" class="t1" /></p>
<p><span>可接受最高利率：</span><select class="s1"><option selected="selected">请选择</option><option>基准利率</option></select></p>
<p><span>还款方式：</span><select class="s1"><option selected="selected">请选择</option><option>一次性还款</option></select></p>
<p><span>主要担保方式：</span><select class="s1"><option selected="selected">请选择</option><option>抵押</option></select></p>
<p><span>担保人姓名：</span><input type="text" class="t1" /></p>
<p><span>担保物名称：</span><input type="text" class="t1" /></p>
<p><span>担保金额(万)：</span><input type="text" class="t1" /></p>
<p><span>担保物所在地区：</span><select class="s2"><option selected="selected">请选择</option><option>浙江省</option></select><select class="s2"><option selected="selected">请选择</option><option>杭州市</option></select><select class="s2"><option selected="selected">请选择</option><option>西湖区</option></select></p>
<p><span>担保物是否在本地：</span><input type="text" class="t1" /></p>
<p><input type="button" value="保存" class="b1" /><input type="button" value="下一步" class="b4" /></p>
</div>
 
</div> 
</div>
<jsp:include page="../../common/foot.jsp" />
</div>

</body>
</html>
