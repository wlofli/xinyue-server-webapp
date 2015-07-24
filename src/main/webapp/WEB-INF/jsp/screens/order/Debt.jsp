<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
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
<jsp:include page="detailHead.jsp" />
</div>
<div class="hy_right_bt">
<ul class="menu1" id="menu">
<li class=""><a href="ddxq_hy.html">申请人信息</a></li>
<li class=""><a href="ddxq_hy1.html">企业基本信息</a></li> 
<li class=""><a href="ddxq_hy2.html">基本经营信息</a></li> 
<li class="hit"><a href="ddxq_hy3.html">抵押物与负债</a></li> 
<li class=""><a href="ddxq_hy4.html">上传资料</a></li> 
</ul>
</div>
<div class="tab">
<p class="qiye_bt"><strong>未抵押的不动产</strong></p>
<p><span>厂房：</span><input type="text" class="t1" /></p>
<p><span>土地：</span><input type="radio" name="sex" class="r1"/><span class="r1_sex">是</span><input type="radio" name="sex" class="r1 m_l_20"/><span class="r1_sex">否</span><input type="radio" name="sex" class="r1 m_l_20" checked="checked"/><span class="r1_sex">保密</span></p>
<p><span>办公楼：</span><input type="text" class="t1" /></p>
<p><span>店铺：</span><input type="text" class="t1" /></p>
<p><span>法人私有财产：</span><input type="text" class="t1" /></p>
<p><span>机器设备：</span><input type="text" class="t1" /></p>
<p class="qiye_bt"><strong>负债</strong></p>
<p><span>公司资产负债率(%)：</span><input type="text" class="t1" /></p>
<p><span>公司收入负债比(%)：</span><input type="text" class="t1" /></p>
<p><span>抵押物情况：</span><select class="s1"><option selected="selected">请选择</option></select></p>
<p><span>第一还款来源年收入(万)：</span><input type="text" class="t1" /></p>
<p><span>是否有上下游企业：</span><select class="s1"><option selected="selected">请选择</option></select></p>
<p><span>企业净资产：</span><input type="text" class="t1" /></p>
<p><span>企业净资产流动比(%)：</span><input type="text" class="t1" /></p>
<p><span>企业主资产：</span><input type="text" class="t1" /></p>
<p><input type="button" value="保存" class="b1" /><input type="button" value="下一步" class="b4" /></p>
</div>
</div>
</div>
<div class="footer">
   <p><a href="#">关于新越网</a>  | <a href="#">服务条款</a> | <a href="#">法律声明</a> |  <a href="#">隐私保护</a> |  <a href="#">联系我们</a>  | <a href="#">帮助中心</a> | <a href="#">加入我们</a>  |  <a href="#">友情链接</a></p>
    <p>浙ICP备11022285号  www.91loan.cn © 2012-2014     新越网网站所有权归杭州摩科信息技术有限公司所有      客服电话：0571-86707362    </p>
</div>
</div>

</body>
</html>
