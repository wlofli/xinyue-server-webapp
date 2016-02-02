<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网机构列表页面</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="interval" value=" "></c:set>
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
	$(function(){
		var b = '${cbean.bindex}';
		
		if(b!= undefined){
			$("#business_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$("#business_li a:eq("+b+")").addClass("hit");
		}
		var a = '${cbean.aindex}';
		if(a!= undefined){
			$("#area_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$("#area_li a:eq("+a+")").addClass("hit");
		}
		var t = '${cbean.tindex}';
		if(t!= undefined){
			$("#type_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$("#type_li a:eq("+t+")").addClass("hit");
		}
		var r = '${cbean.rank}';
		
		if(r!= undefined){
			$("#div_rank a[class]").each(function(){
				$(this).removeClass("bj_none hit");
			});
			$("#div_rank a:eq("+(3-r)+")").addClass("bj_none hit");
		}
	});
	
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

	<!--中间部分-->
	<div class="nr_main">
		<div class="nr_center">
			<div class="position">
				<div class="site">
					<i class="site_tb"></i><a href="javascript:void(0)">网站首页</a>&gt;<span>融资机构列表</span>
					<div class="clear"></div>
				</div>
			</div>
			<div class="pro_ssk">
				<div class="pro_ssk_bt">
					<span>融资机构搜索</span>
				</div>
				<div class="pro_ssk_nr">
					<ul>
					<s:form commandName="cbean" method="post" action="${ctx }/org/show" id="cbean_form">
						<s:hidden path="business" id="cbean_business"/>
						<s:hidden path="bindex" id="cbean_business_index"/>
						<s:hidden path="area" id="cbean_area"/>
						<s:hidden path="aindex" id="cbean_area_index"/>
						<s:hidden path="rank" id="cbean_rank"/>
						<s:hidden path="typeName" id="cbean_type"/>
						<s:hidden path="tindex" id="cbean_type_index"/>
						<s:hidden path="topage" id="cbean_form_topage"/>
						<li id="business_li">
							<span>擅长业务：</span>
							<p id="scyw">
								<a href="javascript:void(0)" onclick="showBushiness(this , 0 , '')">不限</a>
								<c:forEach items="${protype }" var="prot" varStatus="vs">
									<a href="javascript:void(0)" onclick="showBushiness(this , ${vs.index+1 } , '${prot.id}')">${prot.name }</a>
								</c:forEach>
							</p>
							<a class="zk" id="menuzk" onclick="javascript:zkscyw()">展开&gt;</a>
							<a class="sq" id="menusq" onclick="sqscyw()">&lt;收起</a>
							<div class="clear"></div>
						</li>
						<li id="area_li">
							<span>服务地区：</span>
							<p id="fwdq">
								<a href="javascript:void(0)" onclick="showArea(this , 0 , '')">不限</a>
								<c:forEach items="${orgstation }" var="stat" varStatus="vs">
									<a href="javascript:void(0)" onclick="showArea(this , ${vs.index+1} , ${stat.id })">${stat.subName }</a>
								</c:forEach>
							</p>
							<a class="zk" id="menuzk1" onclick="javascript:zkfwdq()">展开&gt;</a>
							<a class="sq" id="menusq1" onclick="sqfwdq()">&lt;收起</a>
							<div class="clear"></div>
						</li>
						<li id="type_li">
							<span>机构类型：</span>
							<p id="jglx">
								<a href="javascript:void(0)" onclick="showType(this , 0 , '')">不限</a>
								<c:forEach items="${orgtype }" var="org" varStatus="vs">
									<a href="javascript:void(0)" onclick="showType(this , ${vs.index+1} , ${org.id })">${org.name }</a>
								</c:forEach>
							</p>
							<a class="zk" id="zk" onclick="javascript:zkjglx()">展开&gt;</a>
							<a class="sq" id="sq" onclick="javascript:sqjglx()">&gt;收起</a>
							<div class="clear"></div>
						</li>
						<li class="bor_none">
							<input type="button" value="立即检索" onclick="showorg()" class="ss_b" />
							<a href="javascript:void(0)" class="qk_ss" onclick="showall()">全部融资机构</a>
							<div class="clear"></div>
						</li>
					</s:form>
					</ul>

				</div>
			</div>
			<div class="pro_ssk">
				
				<div class="pro_ssk_bt" id="div_rank">
					<span>融资机构列表</span>
					<a href="javascript:void(0)" onclick="rank(this , 3)">申请人数</a>
					<a href="javascript:void(0)" onclick="rank(this , 2)">产品数量</a>
					<a href="javascript:void(0)" onclick="rank(this , 1)">成立时间</a>
					<a href="javascript:void(0)" onclick="rank(this , 4)">默认排序</a>
				</div>
				<div class="jigou_Lb">
					<ul>
						<c:forEach items="${orgpage.data }" var="org">
							<li><a href="javascript:void(0)" class="jg_lit">
								<c:if test="${empty org.image }" var="flag"> 
									<img src="${ctx }/images1/jg_icon.jpg" width="180" height="120"/>
								</c:if>
								<c:if test="${not flag}"> 
									<img src="${showpath }/org/${org.image}" width="180" height="120"/>
								</c:if> <span class="jgxq1">成立时间：${org.establish }</span>
									<span class="jgxq1">机构规模：${org.scale }</span> <span class="jgxq1">机构类型：${org.genre }</span>
							</a>
								<div class="xq">
									<p class="jgmc">
										<a href="javascript:void(0)">${org.name }</a><img
											src="${ctx }/images1/jgrz_tb.jpg" />
									</p>
									<p class="jgxq">
										共有<strong>${org.orderNum }</strong>人向该机构申请
									</p>
									<p class="jgxq1">所在区域：${org.site }</p>
									<p class="jgxq1">业务区域：
										<c:set var="subName"></c:set>
										<c:forEach items="${org.stat }" var="scity">
											<c:set value="${subName}${interval}${scity.subName }" var="subName"></c:set>
										</c:forEach>
										<c:out value="${subName }"></c:out>
									</p>
									<p class="jgxq1">擅长业务：
										<c:set var="ptName"></c:set>
										<c:forEach items="${org.ptype }" var="otype">
											<c:set value="${ptName}${interval}${otype.name }" var="ptName"></c:set>
										</c:forEach>
										<c:out value="${ptName }"></c:out>
									</p>
								</div> <a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/detail?orgid=${org.id }'" class="jrjg_btn">进入机构</a></li>
						</c:forEach>
					</ul>



				</div>
			</div>

		</div>
		<div class="pagelist">
			<p:pagecommon url="${ctx }/org/show?topage=" pageData="${orgpage }"></p:pagecommon>
		</div>
	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	
	<script type="text/javascript">
		function changePage(url , topage){
			$("#cbean_form_topage").val(topage);
			$("#cbean_form").submit();
		}
		
		function showBushiness(node , result , key){
			$("#business_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			
			$(node).addClass("hit");
			
			$("#cbean_business").val(key);
			
			$("#cbean_business_index").val(result);
		}
		
		function showArea(node , result , key){
			$("#area_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$(node).addClass("hit");
		
			$("#cbean_area").val(key);
			
			$("#cbean_area_index").val(result);
		}
		
		function showType(node , result , key){
			$("#type_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$(node).addClass("hit");
			
			$("#cbean_type").val(key);
			$("#cbean_type_index").val(result);
		}
		
		function rank(node , result){
			$("#cbean_rank").val(result);
			showorg();
		}
		
		function showorg(){
			$("#cbean_form").submit();
		}
		function showall(){
			$("#cbean_business").val("");
			$("#cbean_business_index").val(0);
			
			$("#cbean_area").val("");
			$("#cbean_area_index").val(0);
			
			$("#cbean_type").val("");
			$("#cbean_type_index").val(0);
			
			$("#cbean_form").submit();
		}
	</script>
</body>
</html>