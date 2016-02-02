<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_信贷经理</title>
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
function zkscyw(){ 
    document.getElementById("scyw").style.height="auto";
	document.getElementById("menusq").style.display="block";
	document.getElementById("menuzk").style.display="none";
}
function sqscyw(){ 
    document.getElementById("scyw").style.height="50px";
	document.getElementById("menusq").style.display="none";
	document.getElementById("menuzk").style.display="block";
}
function zkjglx(){ 
    document.getElementById("jglx").style.height="auto";
	document.getElementById("sq").style.display="block";
	document.getElementById("zk").style.display="none";
	}
function sqjglx(){ 
    document.getElementById("jglx").style.height="50px";
	document.getElementById("sq").style.display="none";
	document.getElementById("zk").style.display="block";
	}
function zkfwdq(){ 
    document.getElementById("fwdq").style.height="auto";
	document.getElementById("menusq1").style.display="block";
	document.getElementById("menuzk1").style.display="none";
	}
function sqfwdq(){ 
    document.getElementById("fwdq").style.height="50px";
	document.getElementById("menusq1").style.display="none";
	document.getElementById("menuzk1").style.display="block";
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
					<i class="site_tb"></i><a href="${ctx}/index">网站首页</a>&gt;<span>信贷经理列表</span>
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
								<a href="javascript:void();" id="gb_no" onclick="selectGB('','')">不限</a>
								<c:forEach items="${goodBusinesses}" var="goodBusiness" varStatus="vs">
									<a href="javascript:void();" id="gb_${goodBusiness.id}" onclick="selectGB('${goodBusiness.id}','${goodBusiness.name}')">${goodBusiness.name}</a>
								</c:forEach>
							</p>
							<a class="zk" id="menuzk" onclick="javascript:zkscyw()">展开&gt;</a>
							<a class="sq" id="menusq" onclick="sqscyw()">&lt;收起</a>
							<div class="clear"></div>
						</li>
						<li>
							<span>服务地区：</span>
							<p>
								<a href="javascript:void();" id="sz_no" onclick="selectSZ('')">不限</a>
								<c:forEach items="${cities}" var="serverZone" varStatus="vs">
									<a href="javascript:void();" id="sz_${serverZone.code}" onclick="selectSZ('${serverZone.code}')">${serverZone.name}</a>
								</c:forEach>
							</p>
							<a class="zk" id="menuzk1" onclick="javascript:zkfwdq()">展开&gt;</a>
							<a class="sq" id="menusq1" onclick="sqfwdq()">&lt;收起</a>
							<div class="clear"></div>
						</li>
						<li>
							<span>机构类型：</span>
							<p>
								<a href="javascript:void();" id="ot_no" onclick="selectOT('')">不限</a>
								<c:forEach items="${organizationTypes}" var="organizationType" varStatus="vs">
									<a href="javascript:void();" id="ot_${organizationType.id}" onclick="selectOT('${organizationType.id}')">${organizationType.name}</a>
								</c:forEach>
							</p>
							<a class="zk" id="zk" onclick="javascript:zkjglx()">展开&gt;</a>
							<a class="sq" id="sq" onclick="javascript:sqjglx()">&gt;收起</a>
							<div class="clear"></div>
						</li>
						<li class="bor_none">
							<sf:form action="${ctx}/manager/search" commandName="creditManagerSearch" id="creditManagerForm" method="post">
								<sf:hidden path="goodBusiness" id="hid_gb"/>
								<sf:hidden path="serverZone" id="hid_sz"/>
								<sf:hidden path="organizationType" id="hid_ot"/>
								<sf:hidden path="jumpPage" id="hid_page"/>
								<sf:hidden path="orderType" id="hid_rt"/>
								<sf:hidden path="auth" id="hid_ia"/>
								<input type="button" value="立即检索" class="ss_b" onclick="search(1)" />
							</sf:form>
							<a href="javascript:void();" id="all" class="qk_ss" onclick="javascript:searchAll(0)">全部信贷经理</a>
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
					<input type="checkbox" id="id_auth" class="rz_c1" onchange="changeAuth()" <c:if test = "${creditManagerSearch.auth == true }">checked="checked"</c:if>/>
					<a href="javascript:void();" onclick="changeOrder(1)" <c:if test = "${creditManagerSearch.orderType == 1 }">class="hit"</c:if>>最近登录</a>
					<a href="javascript:void();" class="bj_none <c:if test = "${creditManagerSearch.orderType == 0 }">hit</c:if>" onclick="changeOrder(0)" >默认排序</a>
				</div>
				<div class="xdjl_Lb">
					<ul>
						<c:forEach items="${cmInfo}" var="detailInfo" varStatus="vs">
							<li>
								<a href="javascript:void();" class="xdjl_lit" onclick="managerDetail('${detailInfo.creditManagerId}')">
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
										<a href="javascript:void();" onclick="managerDetail('${detailInfo.creditManagerId}')">${detailInfo.personName}</a>
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
									<a href="javascript:void();" class="jrjg_btn" onclick="enterOrganization('${detailInfo.organizationId}')">进入机构</a>
									<a href="javascript:zxtck('${detailInfo.creditManagerId}')" class="jrjg_btn" >向他咨询</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="pagelist">
			<p:pagecommon url="${ctx}/credit/manager/page" pageData="${pageData}"></p:pagecommon>
		</div>
	</div>
	<%@ include file="../../common/foot_main.jsp"%>
	<jsp:include page="../../common/order_fast_2.jsp"></jsp:include>
</body>
<script type="text/javascript">
var gb_id = "";
var sz_id = "";
var ot_id = "";
$(function(){
	var gbid = $("#hid_gb").val();
	if (gbid != "") {
		$("#gb_"+gbid).addClass("hit");
		gb_id = "gb_"+gbid;
	}else {
		$("#gb_no").addClass("hit");
		gb_id = "gb_no";
	}
	var szid = $("#hid_sz").val();
	if (szid != "") {
		$("#sz_"+szid).addClass("hit");
		sz_id = "sz_"+szid;
	}else {
		$("#sz_no").addClass("hit");
		sz_id = "sz_no";
	}
	var otid = $("#hid_ot").val();
	if (otid != "") {
		$("#ot_"+otid).addClass("hit");
		ot_id = "ot_"+otid;
	}else {
		$("#ot_no").addClass("hit");
		ot_id = "ot_no";
	}
});
function search(type){
	var actionUrl = "${ctx}/manager/search"+"?type="+type;
	$("#creditManagerForm").attr("action",actionUrl);
	
	$("#creditManagerForm").submit();
}
function enterOrganization(orgId){
	document.location.href="${ctx}/org/detail?orgid=" + orgId;
}
function managerDetail(managerId){
	document.location.href="${ctx}/manager/detail?managerId="+managerId;
}
function changePage(url,page){
	$("#hid_page").val(page);
	search(1);
}
function changeOrder(type){
	$("#hid_rt").val(type);
	search(1);
}
function changeAuth(){
	if ($("#id_auth").is(':checked')) {
		$("#hid_ia").val(true);
	}else {
		$("#hid_ia").val(false);
	}
	search(1);
}
function selectGB(id,name){
	$("#hid_gb").val(name);
	$("#"+gb_id).removeClass("hit");
	if (id=="") {
		$("#gb_no").addClass("hit");
		gb_id = "gb_no";
	} else {
		$("#gb_"+id).addClass("hit");
		gb_id = "gb_"+id;
	}
}
function selectSZ(id){
	$("#hid_sz").val(id);
	$("#"+sz_id).removeClass("hit");
	if (id=="") {
		$("#sz_no").addClass("hit");
		sz_id = "sz_no";
	} else {
		$("#sz_"+id).addClass("hit");
		sz_id = "sz_"+id;
	}
}
function selectOT(id){
	$("#hid_ot").val(id);
	$("#"+ot_id).removeClass("hit");
	if (id=="") {
		$("#ot_no").addClass("hit");
		ot_id = "ot_no";
	} else {
		$("#ot_"+id).addClass("hit");
		ot_id = "ot_"+id;
	}
}
function searchAll(type){
	search(0);
}
</script>
</html>