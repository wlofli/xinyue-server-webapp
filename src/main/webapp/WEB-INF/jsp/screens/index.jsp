<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网</title>
<%@ include file="../common/common.jsp"%>
<script type="text/javascript">
$(function(){
	var message = "${message}";
	if (message != null && message != "") {
		alert(message);
	}
});
</script>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../common/head.jsp"%>
	</div>
	<%@ include file="../common/head_banner.jsp"%>
	<div class="container3">
		<div class="bt">
			<h1>推荐企业贷款产品</h1>
			<span>共有<strong>${productCount}</strong>个产品
			</span><a href="${ctx}/product/list">了解更多&gt;</a>
			<div class="clear"></div>
		</div>
		<div class="nr">
			<div class="cp_sx">
				<ul>
					<li><span>产品类型：</span></li>
					<li><a href="#">信用贷款</a></li>
					<li><a href="#">抵押贷款</a></li>
					<li><a href="#">担保贷款</a></li>
					<li><a href="#">质押贷款</a></li>
					<li><a href="#">票据贷款</a></li>
					<li><a href="#">其他贷款</a></li>
				</ul>
			</div>
			<div class="cp_lb">
				<ul>
					<li><a href="pro_xq.html" class="img"><img
							src="${ctx}/images1/cp_icon1.png" /></a>
						<p>
							产品名称：<a href="pro_xq.html">税贷通</a><br /> 贷款额度：20-300万元<br />
							产品类别：信用类
						</p>
						<p class="txt_c">
							<a href="pro_xq.html" class="cp_xq_btn">查看详情</a><a href="#"
								class="cp_sq_btn">立即申请</a>
						</p></li>
					<li><a href="pro_xq.html" class="img"><img
							src="${ctx}/images1/cp_icon1.png" /></a>
						<p>
							产品名称：<a href="pro_xq.html">税贷通</a><br /> 贷款额度：20-300万元<br />
							产品类别：信用类
						</p>
						<p class="txt_c">
							<a href="pro_xq.html" class="cp_xq_btn">查看详情</a><a href="#"
								class="cp_sq_btn">立即申请</a>
						</p></li>
					<li><a href="pro_xq.html" class="img"><img
							src="${ctx}/images1/cp_icon1.png" /></a>
						<p>
							产品名称：<a href="pro_xq.html">税贷通</a><br /> 贷款额度：20-300万元<br />
							产品类别：信用类
						</p>
						<p class="txt_c">
							<a href="pro_xq.html" class="cp_xq_btn">查看详情</a><a href="#"
								class="cp_sq_btn">立即申请</a>
						</p></li>
					<li class="bj_none"><a href="pro_xq.html" class="img"><img
							src="${ctx}/images1/cp_icon1.png" /></a>
						<p>
							产品名称：<a href="pro_xq.html">税贷通</a><br /> 贷款额度：20-300万元<br />
							产品类别：信用类
						</p>
						<p class="txt_c">
							<a href="pro_xq.html" class="cp_xq_btn">查看详情</a><a href="#"
								class="cp_sq_btn">立即申请</a>
						</p></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="container4">
		<div class="bt">
			<h1>推荐贷款顾问</h1>
			<a href="#">了解更多&gt;</a>
			<div class="clear"></div>
		</div>
		<div class="nr">
			<ul>
				<Li>
					<div class="xdjl_left">
						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" /> <img
								src="${ctx}/images/4kx.jpg" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>申屠晶晶</strong><img src="${ctx}/images1/sm_tb.jpg" /><img
									src="${ctx}/images1/jgrz_tb1.jpg" />
							</p>
							<p class="xdjl_bz">
								共有<strong>90</strong>人向该顾问咨询
							</p>
							<p class="xdjl_ssgs">所属公司：杭州XXX网络科技有限公司</p>
							<p class="xdjl_scyw">服务地区：杭州大市</p>
							<p class="xdjl_scyw">擅长业务：房产抵押、汽车抵押、信用贷款、设…</p>
							<p class="cz_btn">
								<a href="javascript:zxtck()" class="xdjl_btn">向他咨询</a><a
									href="jg_xq.html" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					<div class="xdjl_right">

						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" /> <img
								src="${ctx}/images/4kx.jpg" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>申屠晶晶</strong><img src="${ctx}/images1/sm_tb.jpg" /><img
									src="${ctx}/images1/jgrz_tb1.jpg" />
							</p>
							<p class="xdjl_bz">
								共有<strong>90</strong>人向该顾问咨询
							</p>
							<p class="xdjl_ssgs">所属公司：杭州XXX网络科技有限公司</p>
							<p class="xdjl_scyw">服务地区：杭州大市</p>
							<p class="xdjl_scyw">擅长业务：房产抵押、汽车抵押、信用贷款、设…</p>
							<p class="cz_btn">
								<a href="javascript:zxtck()" class="xdjl_btn">向他咨询</a><a
									href="jg_xq.html" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</Li>
				<Li>
					<div class="xdjl_left">
						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" /> <img
								src="${ctx}/images/4kx.jpg" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>申屠晶晶</strong><img src="${ctx}/images1/sm_tb1.jpg" /><img
									src="${ctx}/images1/jgrz_tb1.jpg" />
							</p>
							<p class="xdjl_bz">
								共有<strong>90</strong>人向该顾问咨询
							</p>
							<p class="xdjl_ssgs">所属公司：杭州XXX网络科技有限公司</p>
							<p class="xdjl_scyw">服务地区：杭州大市</p>
							<p class="xdjl_scyw">擅长业务：房产抵押、汽车抵押、信用贷款、设…</p>
							<p class="cz_btn">
								<a href="javascript:zxtck()" class="xdjl_btn">向他咨询</a><a
									href="jg_xq.html" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					<div class="xdjl_right">

						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" /> <img
								src="${ctx}/images/4kx.jpg" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>申屠晶晶</strong><img src="${ctx}/images1/sm_tb.jpg" /><img
									src="${ctx}/images1/jgrz_tb.jpg" />
							</p>
							<p class="xdjl_bz">
								共有<strong>90</strong>人向该顾问咨询
							</p>
							<p class="xdjl_ssgs">所属公司：杭州XXX网络科技有限公司</p>
							<p class="xdjl_scyw">服务地区：杭州大市</p>
							<p class="xdjl_scyw">擅长业务：房产抵押、汽车抵押、信用贷款、设…</p>
							<p class="cz_btn">
								<a href="javascript:zxtck()" class="xdjl_btn">向他咨询</a><a
									href="jg_xq.html" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</Li>
				<Li class="bor_none">
					<div class="xdjl_left">
						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" /> <img
								src="${ctx}/images/4kx.jpg" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>申屠晶晶</strong><img src="${ctx}/images1/sm_tb.jpg" /><img
									src="${ctx}/images1/jgrz_tb1.jpg" />
							</p>
							<p class="xdjl_bz">
								共有<strong>90</strong>人向该顾问咨询
							</p>
							<p class="xdjl_ssgs">所属公司：杭州XXX网络科技有限公司</p>
							<p class="xdjl_scyw">服务地区：杭州大市</p>
							<p class="xdjl_scyw">擅长业务：房产抵押、汽车抵押、信用贷款、设…</p>
							<p class="cz_btn">
								<a href="javascript:zxtck()" class="xdjl_btn">向他咨询</a><a
									href="jg_xq.html" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					<div class="xdjl_right">

						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" /> <img
								src="${ctx}/images/4kx.jpg" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>申屠晶晶</strong><img src="${ctx}/images1/sm_tb.jpg" /><img
									src="${ctx}/images1/jgrz_tb1.jpg" />
							</p>
							<p class="xdjl_bz">
								共有<strong>90</strong>人向该顾问咨询
							</p>
							<p class="xdjl_ssgs">所属公司：杭州XXX网络科技有限公司</p>
							<p class="xdjl_scyw">服务地区：杭州大市</p>
							<p class="xdjl_scyw">擅长业务：房产抵押、汽车抵押、信用贷款、设…</p>
							<p class="cz_btn">
								<a href="javascript:zxtck()" class="xdjl_btn">向他咨询</a><a
									href="jg_xq.html" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</Li>
			</ul>

		</div>
	</div>

	<div class="container5">
		<div class="bt">
			<h1>更多精彩</h1>
			<div class="clear"></div>
		</div>
		<div class="nr1">
			<div class="zx_mk">
				<div class="zx_bt">
					<span>杭州资讯</span><a href="new_list.html">更多&gt;</a>
					<div class="clear"></div>
				</div>
				<ul class="zx_nr">
					<li class="h_zx"><a href="new_xq.html" class="litpic"><img
							src="${ctx}/images1/zx_img.jpg" width="80px" height="60px" /></a>
						<p class="zxnr">
							<a href="new_xq.html" class="title">如何办理无抵押贷款</a><span>杭州很多普通农民如何避免被贷杭州很多普通
								款？鞥大明宫尅我点… <a href="new_xq.html" class="more">[详情]</a>
							</span>
						</p></li>
					<li><a href="new_xq.html">如何避免被贷款</a></li>
					<li><a href="new_xq.html">办理无抵押贷款的主要注意事项</a></li>
					<li><a href="new_xq.html">办理无抵押贷款&信用贷款的区…</a></li>
					<li><a href="new_xq.html">如何办理信用贷款，需提交哪些…</a></li>
					<li><a href="new_xq.html">办理信用贷款需提交哪些证明</a></li>
					<li><a href="new_xq.html">办理无抵押贷款&信用贷款</a></li>
					<li><a href="new_xq.html">如何办理房贷、车贷贷款</a></li>
					<li><a href="new_xq.html">无抵押贷款最高贷款额度解析</a></li>
				</ul>
			</div>
			<div class="anli_mk">
				<div class="zx_bt">
					<span>成功案例</span>
				</div>
				<div id="anli">
					<ul class="zx_nr">
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
						<li><span>杭州摩科商用设备有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx网络科技有限公司</span><strong>￥5000000</strong></li>
						<li><span>杭州xx科技有限公司</span><strong>￥500000</strong></li>
					</ul>
				</div>
			</div>
			<div class="anli_mk">
				<div class="jsq_bt">
					<span>贷款计算工具</span>
				</div>
				<div class="jsq_nr">
					<ul class="jsq_lb">
						<li><a href="#"><i class="jsq_icon1"></i><span>房贷担保费计算器</span></a></li>
						<li><a href="#"><i class="jsq_icon2"></i><span>商业贷款计算器</span></a></li>
						<li><a href="#"><i class="jsq_icon3"></i><span>提前还款计算器</span></a></li>
						<li><a href="#"><i class="jsq_icon4"></i><span>个人贷款计算器</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container4">
		<div class="bt">
			<h1>贷款攻略和问答</h1>
			<div class="clear"></div>
		</div>
		<div class="gl_wd_nr">
			<div class="zx_mk gl_mk">
				<div class="zx_bt gl_bt">
					<span>贷款攻略</span><a href="gonglve_list.html">更多&gt;</a>
				</div>
				<div class="zx_nr">
					<ul>
						<li><a href="gonglve_xq.html">如何避免被贷款</a></li>
						<li><a href="gonglve_xq.html">办理无抵押贷款的主要注意事项</a></li>
						<li><a href="gonglve_xq.html">办理无抵押贷款&信用贷款的区…</a></li>
						<li><a href="gonglve_xq.html">如何办理信用贷款，需提交哪些…</a></li>
						<li><a href="gonglve_xq.html">办理信用贷款需提交哪些证明</a></li>
						<li><a href="gonglve_xq.html">办理无抵押贷款&信用贷款</a></li>
						<li><a href="gonglve_xq.html">如何办理房贷、车贷贷款</a></li>
						<li><a href="gonglve_xq.html">无抵押贷款最高贷款额度解析</a></li>
						<li><a href="gonglve_xq.html">如何办理信用贷款，需提交哪些…</a></li>
						<li><a href="gonglve_xq.html">办理信用贷款需提交哪些证明</a></li>
						<li><a href="gonglve_xq.html">办理无抵押贷款&信用贷款</a></li>
					</ul>
				</div>
			</div>
			<div class="wd_mk">
				<div class="wd_bt">
					<span>热门问答</span><a href="wenda_list.html">更多&gt;</a>
				</div>
				<div class="wd_nr">
					<div class="wd_form">
						<textarea class="txt_wd1"></textarea>
						<input type="button" class="tw_btn" /><input type="button"
							class="wtda_btn" />
						<div class="clear"></div>
					</div>
					<ul class="wd_nr">
						<li>
							<p class="wt_bt">
								<i>问</i><a href="wenda_xq.html"
									title="我们企业打算要申请贷款，想要通过担保公司申请贷款，这样安全吗？">[汽车抵押/质押]
									我们企业打算要申请贷款，想要通过担保公司申请贷款，这样安全吗？</a>
							</p>
							<p class="wt_nr">
								<i>答</i><span>担保公司的贷款利率比银行的利率要高，分为抵押贷款和信誉贷款。抵押贷款的利率一般全款房是月息…</span>
							</p>
						</li>
						<li>
							<p class="wt_bt">
								<i>问</i><a href="wenda_xq.html" title="你好，抵押汽车贷款可以押手续不押汽车吗？">[汽车抵押/质押]
									你好，抵押汽车贷款可以押手续不押汽车吗？</a>
							</p>
							<p class="wt_nr">
								<i>答</i><span>担保公司贷款的话，他们自主放款的话，利率会很高。假如您的资质好，可以通过担保公司找银行借…</span>
							</p>
						</li>
						<li>
							<p class="wt_bt">
								<i>问</i><a href="wenda_xq.html"
									title="买期房首付后就能办理住房公积金贷款吗？还是要等房屋结顶后办理按揭时才能申请贷款呢？需要什么材料？">[汽车抵押/质押]
									买期房首付后就能办理住房公积金贷款吗？还是要等房屋结顶后办理按揭时才能申请贷…</a>
							</p>
							<p class="wt_nr">
								<i>答</i><span>房屋结顶且与公积金中心签订了贷款协议后方能办理公积金贷款，请提供夫妻双方身份证、结婚证、户口…</span>
							</p>
						</li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="container3">
		<div class="bt">
			<h1>推荐机构店铺</h1>
			<a href="jg_list.html">更多&gt;</a>
			<div class="clear"></div>
		</div>
		<div class="nr1" style="border: none;">
			<div class="blk_18">
				<a class="LeftBotton" onmousedown="ISL_GoUp_1()"
					onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()"
					href="javascript:void(0);" target="_self"></a>
				<div class="pcont" id="ISL_Cont_1">
					<div class="ScrCont">
						<div id="List1_1">
							<!-- piclist begin -->
							<a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a> <a class="pl" href="jg_xq.html"><img
								src="${ctx}/images1/jg_icon.jpg" width="180" height="119" /><span>机构名称：<strong>中国招商银行</strong><br />贷款产品：12个<br />累计受理：12笔<br />成功放款：320万
							</span></a>
							<!-- piclist end -->
						</div>
						<div id="List2_1"></div>
					</div>
				</div>
				<a class="RightBotton" onmousedown="ISL_GoDown_1()"
					onmouseup="ISL_StopDown_1()" onmouseout="ISL_StopDown_1()"
					href="javascript:void(0);" target="_self"></a>
			</div>
			<div class="c"></div>
		</div>

		<div class="nr2">
			<div class="bt">
				<h1>合作机构</h1>
				<a href="#">更多&gt;</a>
				<div class="clear"></div>
			</div>
			<ul class="hzjg_lb">
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
				<li><a href="#" title="招商证券"><img src="${ctx}/images1/hzjg.jpg"
						alt="招商证券" /></a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="../common/foot_main.jsp"%>
</body>
</html>