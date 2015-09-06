<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网融资机构详情页面</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
	</div>

	<!--
<div class="container1">
<div id="full-screen-slider">
	<ul id="slides">
		<li style="background:url('../images/01.png') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
		<li style="background:url('../images/02.png') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
		<li style="background:url('../images/03.jpg') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
		<li style="background:url('../images/04.png') no-repeat center top"><a href="#" target="_blank">新越网</a></li>
	</ul>
</div>

<div class="form_sd"> 
<dl>
<dt>快速申贷</dt>
<dd><span class="bt_span">企业名称：</span><input type="text" class="sd_input" placeholder="请输入企业名称" /></dd>
<dd><span class="bt_span">所属地区：</span><select class="sd_select1"><option>选择省</option></select><select class="sd_select1"><option>选择市</option></select><select class="sd_select1"><option>区/县</option></select></dd>
<dd><span class="bt_span">贷款额度：</span><input type="text" class="sd_input"  /><span class="dw">万元</span></dd>
<dd><span class="bt_span">联系人姓名：</span><input type="text" class="sd_input"  placeholder="请输入联系人姓名" /></dd>
<dd><span class="bt_span">联系手机：</span><input type="text" class="sd_input1"  placeholder="请输入联系人手机" /><input type="button" class="sd_yzsj_btn" value="获取验证码" /><!--<input type="button" class="sd_yzsj_btn1" value="重新获取28s" /></dd>
<dd><span class="bt_span">手机验证码：</span><input type="text" class="sd_input"  placeholder="请输入手机验证码" /></dd>
<dd><input type="button" class="sd_btn" value="提交申请"/></dd>
</dl>
</div>
</div>

<div class="container2">
<div class="banner_bottom_gg">税贷通-税收信用“贷”动企业快速发展</div>
<ul class="hzms_ul">
<li><a href="#"><i class="icon1"></i><span>合作融资机构<br /><strong>20322</strong>个</span></a></li>
<li><a href="#"><i class="icon2"></i><span>合作融资产品<br /><strong>20322</strong>个</span></a></li>
<li><a href="#"><i class="icon3"></i><span>累计融资金额<br /><strong>20322</strong>元</span></a></li>
<li class="b_r_none"><a href="#"><i class="icon4"></i><span>累计服务企业<br /><strong>20322</strong>家</span></a></li>
<div class="clear"></div>
</ul>
</div>-->
	<!--中间部分-->
	<div class="nr_main">
		<div class="nr_center">
			<div class="position">
				<div class="site">
					<i class="site_tb"></i><a href="javascript:void(0)">网站首页</a>&gt;<a
						href="javascript:void(0)" onclick="document.location.href='${ctx}/org/show'" class="a">融资机构</a>&gt;<span>融资机构详情-${org.shortName }</span>
					<div class="clear"></div>
				</div>
			</div>

		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="pro_xq_left_bt">
					<ul class="menu1">
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/show'">机构首页</a></li>
						<li class="hit"><a href="javascript:void(0)">贷款产品</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/case?orgid=${org.id }'">成功案例</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/org?orgid=${org.id }'">机构档案</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/credit?orgid=${org.id }'">贷款咨询</a></li>
					</ul>
				</div>
				<div class="pro_xq_left_nr">
					<div class="tj_xdjl">
						<span>贷款产品</span>
					</div>
					<ul class="tj_xd_lb">
						<c:forEach items="${pagepro.data }" var="pro">
							<li><a href="javascript:void(0)" class="lit"><img
									src="${ctx }/images1/${pro.logo}" height="90px" /></a>
	
								<div class="xd_js">
									<a href="javascript:void(0)" class="name">${pro.name }</a>
									<div class="clear"></div>
									<span>贷款额度：${pro.credit }万</span><span>产品类型：${pro.typeName }</span>
									<div class="clear"></div>
								</div> <a href="javascript:void(0)" class="sq_btn">立即申请</a></li>
						</c:forEach>
					</ul>
					<div class="pagelist1">
						<p:pagecommon url="${ctx }/org/pro?orgid=${org.id }&topage=" pageData="${pagepro }"></p:pagecommon>
					</div>
				</div>
			</div>
			<div class="pro_xq_right">
				<div class="p_r_dk">
					<div class="dk_bt">
						<span>我要贷款</span>
					</div>
					<div class="dk_nr">
						<p>
							<span>产品类别：</span><select class="lb_s"><option></option></select>
						</p>
						<p>
							<span>贷款金额：</span><select class="lb_s"><option></option></select>
						</p>
						<p>
							<span>贷款期限：</span><select class="lb_s"><option></option></select>
						</p>
						<p class="mar_bot">
							<input type="button" class="lb_b" value="搜索产品" />
						</p>
					</div>
				</div>
				<div class="rm_zx">
					<div class="zx_bt">
						<span>贷款咨询</span>
						<div class="clear"></div>
					</div>
					<div class="tw_form">
						<form>
							<input type="text" class="tw_t1" placeholder="请输入关键字" /><input
								type="button" value="搜索" class="tw_ss" /><input type="button"
								value="提问" class="tw_ss_btn" />
							<div class="clear"></div>
						</form>
					</div>

				</div>
				<div class="dkjsq" style="margin-top: 10px; border: 1px #aaa solid;">
					<div class="dkjsq_bt" style="border-bottom: 1px #eee dashed">
						<span>贷款计算器</span>
					</div>
					<ul class="jsq" style="padding: 10px 0;">
						<li class="jsq"><a href="#" class="jsq_left"><img
								src="../images1/jsq_icon.png" width="60px" /></a>
							<div class="xq">
								<a href="#"> 房贷担保费计算器 </a> <span>一分钟算出房贷担保费</span>
							</div>
							<Div class="clear"></Div></li>
						<li class="jsq"><a href="#" class="jsq_left"><img
								src="../images1/jsq_icon1.png" width="60px" /></a>
							<div class="xq">
								<a href="#"> 商业贷款计算器 </a> <span>算算你的贷款划算否？</span>
							</div>
							<Div class="clear"></Div></li>
						<li class="jsq"><a href="#" class="jsq_left"><img
								src="../images1/jsq_icon2.png" width="60px" /></a>
							<div class="xq">
								<a href="#"> 提前还款计算器 </a> <span>提前还款帮你省了多少利息</span>
							</div>
							<Div class="clear"></Div></li>
						<li class="jsq"><a href="#" class="jsq_left"><img
								src="../images1/jsq_icon2.png" width="60px" /></a>
							<div class="xq">
								<a href="#"> 个人贷款计算器 </a> <span>帮您算算你的个人个人最高贷款额度是多少</span>
							</div>
							<Div class="clear"></Div></li>
					</ul>
				</div>
				<div class="ad_mk1">
					<a href="#"> <img src="../images1/ad1.jpg" /></a>
				</div>
			</div>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	<script type="text/javascript">
		function changePage(url , topage){
			var uri = url+topage;
			
			document.location.href=uri;
		}
	</script>
</body>
</html>