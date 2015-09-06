<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_信贷经理</title>
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
$(function() {
	$("#menuzk").click(function() {
		$(this).parent().find('p').style.height = "auto";
		$(this).parent().find('#menusq').style.display = "block";
	});
});
	var tck = document.getElementById("tck");
	var tck1 = document.getElementById("tck1");
	var tck2 = document.getElementById("tck2");
	var tck3 = document.getElementById("login");
	var over = document.getElementById("over");
	function zxtck() {
		tck.style.display = "block";
		over.style.display = "block";
	}
	function hide() {
		tck.style.display = "none";
		over.style.display = "none";
	}
	function zxtck1() {
		tck1.style.display = "block";
		tck.style.display = "none";
		over.style.display = "block";
	}
	function hide2() {
		tck1.style.display = "none";
		over.style.display = "none";
	}

	function zxtck2() {
		tck2.style.display = "block";
		tck1.style.display = "none";
		over.style.display = "block";
	}
	function hide3() {
		tck2.style.display = "none";
		over.style.display = "none";
	}
	function zxtck3() {
		tck3.style.display = "block";
		tck2.style.display = "none";
		over.style.display = "block";
	}
	function hide4() {
		tck3.style.display = "none";
		over.style.display = "none";
	}
</script>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
	</div>
	<div class="nr_main">
		<div class="nr_center">
			<div class="position">
				<div class="site">
					<i class="site_tb"></i><a href="index.html">网站首页</a>&gt;<span>信贷经理列表</span>
					<div class="clear"></div>
				</div>
			</div>
			<div class="pro_ssk">
				<div class="pro_ssk_bt">
					<span>信贷经理搜索</span>
				</div>
				<div class="pro_ssk_nr">
					<ul>
						<li>
							<span>擅长业务：</span>
							<p>
								<a href="#" class="hit" id="gb_no" onclick="selectItem()">不限</a>
								<c:forEach items="${goodBusinesses}" var="goodBusiness" varStatus="vs">
									<a href="#" id="gb_${goodBusiness.id}">${goodBusiness.name}</a>
								</c:forEach>
							</p>
								<!-- <a class="zk" id="menuzk">展开&gt;</a><a class="sq" id="menusq">&gt;收起</a> -->
							<div class="clear"></div>
						</li>
						<li>
							<span>服务地区：</span>
							<p>
								<a href="#" class="hit" id="sz_no">不限</a>
								<c:forEach items="${cities}" var="serverZone" varStatus="vs">
									<a href="#" id="sz_${serverZone.id}">${serverZone.name}</a>
								</c:forEach>
							</p>
						<!-- 	<a class="zk" id="zk">展开&gt;</a><a class="sq" id="sq">&gt;收起</a> -->
							<div class="clear"></div>
						</li>
						<li>
							<span>机构类型：</span>
							<p>
								<a href="#" class="hit" id="ot_no">不限</a>
								<c:forEach items="${organizationTypes}" var="organizationType" varStatus="vs">
									<a href="#" id="ot_${organizationType.id}">${organizationType.name}</a>
								</c:forEach>
							</p>
							<!-- <a class="zk" id="zk">展开&gt;</a><a class="sq" id="sq">&gt;收起</a> -->
							<div class="clear"></div>
						</li>
						<li class="bor_none">
							<sf:form action="${ctx}/credit/manager/search" commandName="creditManagerSearch" id="creditManagerForm" method="post">
								<sf:hidden path="goodBusiness" id="hid_gb"/>
								<sf:hidden path="serverZone" id="hid_sz"/>
								<sf:hidden path="organizationType" id="hid_ot"/>
								<input type="button" value="立即检索" class="ss_b" onclick="search(1)" />
							</sf:form>
							<a href="#" class="qk_ss" onclick="search(0)">全部信贷经理</a>
							<div class="clear"></div>
						</li>
					</ul>
				</div>
			</div>
			<div class="pro_ssk">
				<div class="pro_ssk_bt">
					<span>信贷经理列表</span>
					<span class="ssjg">共有<strong>${managerCount}</strong>位信贷经理</span>
					<span class="rz_s">已认证信贷经理</span>
					<input type="checkbox" class="rz_c1" onchange="" />
					<a href="#" onclick="">最近登录</a>
					<a href="#" class="bj_none" onclick="">默认排序</a>
				</div>
				<div class="xdjl_Lb">
					<ul>
						<c:forEach items="${cmInfo}" var="detailInfo" varStatus="vs">
							<li>
								<a href="#" class="xdjl_lit" onclick="managerDetail('${detailInfo.creditManagerId}')">
									<c:choose>
										<c:when test="${empty detailInfo.personImg}">
											<img src="${ctx}/images/tx1.jpg" />
										</c:when>
										<c:otherwise>
											<img src="${showPath}${detailInfo.personImg}" />
										</c:otherwise>
									</c:choose>
									<img src="${ctx}/images/${detailInfo.starLevel}" class="fw_pj" />
								</a>
								<div class="xq">
									<p class="jgmc">
										<a href="#">${detailInfo.personName}</a>
										<!-- 实名认证标志 -->
										<c:choose>
											<c:when test="${detailInfo.realNameStatus}">
												<img src="${ctx}/images1/sm_tb.jpg" />
											</c:when>
											<c:otherwise>
												<img src="${ctx}/images1/sm_tb1.jpg" />
											</c:otherwise>
										</c:choose>
										<!-- 机构认证标志 -->
										<c:choose>
											<c:when test="${detailInfo.organizationAuthStatus}">
												<img src="${ctx}/images1/jgrz_tb.jpg" />
											</c:when>
											<c:otherwise>
												<img src="${ctx}/images1/jgrz_tb1.jpg" />
											</c:otherwise>
										</c:choose>
									</p>
									<p class="jgxq">
										共有<strong>${detailInfo.applyCount}</strong>人向该信贷经理申请
									</p>
									<p class="jgxq1">所属机构：${detailInfo.organization}</p>
									<p class="jgxq1">服务地区：${detailInfo.serverZone}</p>
									<p class="jgxq1">擅长业务： ${detailInfo.goodBusiness}</p>
								</div>
								<div class="btn">
									<a href="#" class="jrjg_btn" onclick="enterOrganization('${detailInfo.organizationId}')">进入机构</a>
									<a href="javascript:zxtck('${detailInfo.creditManagerId}')" class="jrjg_btn" >向他咨询</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="pagelist">
			<ul>
				<li><a href="#">首页</a></li>
				<li><a href="#">上一页</a></li>
				<li><a href="#" class="hit">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">下一页</a></li>
				<li class="bor_none"><a href="#">尾页</a></li>
				<li class="clear"></li>
			</ul>
		</div>
	</div>
	<%@ include file="../../common/foot_main.jsp"%>
	<jsp:include page="../../common/order_fast_2.jsp"></jsp:include>
</body>
<script type="text/javascript">
function search(type){
	var actionUrl = $("#creditManagerForm").attr("action")+"?type="+type;
	$("#creditManagerForm").attr("action",actionUrl);
	
	$("#creditManagerForm").submit();
}
function enterOrganization(orgId){
	document.location.href="="+orgId;
}
function toConsult(managerId){
	
}
function managerDetail(managerId){
	document.location.href="${ctx}/manager/detail?managerId="+managerId;
}
</script>
</html>