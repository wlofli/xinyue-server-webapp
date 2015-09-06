<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/pro?orgid=${org.id }'">贷款产品</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/case?orgid=${org.id }'">成功案例</a></li>
						<li class="hit"><a href="javascript:void(0)">机构档案</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/credit?orgid=${org.id }'">贷款咨询</a></li>
					</ul>
				</div>
				<div class="pro_xq_left_nr">
					<div class="xdjl_xq">
						<div class="jg_tx">
							<img src="${ctx }/images1/jg_icon.jpg" /> <a href="javascript:void(0)">${org.name }</a>
						</div>
						<div class="xdjl_xx">
							<p>
								<span>成立时间：</span>${org.establish }
							</p>
							<p>
								<span>机构地址：</span>${org.site }
							</p>
							<p>
								<span>业务区域：</span>${org.area }
							</p>
							<p>
								<span>擅长业务：</span>${org.business }
							</p>
							<p>
								<span>机构规模：</span>${org.scale }
							</p>
						</div>
					</div>

					<div class="pro_xq_left_bt">
						<span>机构介绍</span>
					</div>
					<div class="pro_jbxq">

						<p>${org.description }
						</p>
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
</body>
</html>