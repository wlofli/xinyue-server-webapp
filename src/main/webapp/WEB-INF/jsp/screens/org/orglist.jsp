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
</script>
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
						<li id="business_li"><span>擅长业务：</span>
							<a href="javascript:void(0)" onclick="showBushiness(this , 0)">不限</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 1)">无抵押无担保</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 2)">房产抵押</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 3)">汽车抵押</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 4)">二次抵押</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 5)">个人担保</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 6)">企业担保</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 7)">设备贷款</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 8)">质押贷款</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 9)">过桥贷款</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 10)">承兑汇票</a>
							<a href="javascript:void(0)" onclick="showBushiness(this , 11)">短期周转</a>
						<div class="clear"></div></li>
						<li id="area_li"><span>服务地区：</span>
							<a href="javascript:void(0)" onclick="showArea(this , 0)">不限</a>
							<a href="javascript:void(0)" onclick="showArea(this , 1)">杭州大市</a>
							<a href="javascript:void(0)" onclick="showArea(this , 2)">杭州城区</a>
							<a href="javascript:void(0)" onclick="showArea(this , 3)">淳安县</a>
							<a href="javascript:void(0)" onclick="showArea(this , 4)">富阳市</a>
							<a href="javascript:void(0)" onclick="showArea(this , 5)">建德市</a>
							<a href="javascript:void(0)" onclick="showArea(this , 6)">临安市</a>
							<a href="javascript:void(0)" onclick="showArea(this , 7)">桐庐县</a>
						<div class="clear"></div></li>
						<li id="type_li"><span>机构类型：</span>
							<a href="javascript:void(0)" onclick="showType(this , 0)">不限</a>
							<a href="javascript:void(0)" onclick="showType(this , 1)">银行</a>
							<a href="javascript:void(0)" onclick="showType(this , 2)">小贷公司</a>
							<a href="javascript:void(0)" onclick="showType(this , 3)">小微信贷</a>
							<a href="javascript:void(0)" onclick="showType(this , 4)">民间资本</a>
							<a href="javascript:void(0)" onclick="showType(this , 5)">典当行</a>
							<a href="javascript:void(0)" onclick="showType(this , 6)">融资租赁</a>
							<a href="javascript:void(0)" onclick="showType(this , 7)">融资中介</a>
						<div class="clear"></div></li>
						<li class="bor_none"><input type="button" value="立即检索" onclick="show()"
							class="ss_b" />
							<a href="javascript:void(0)" class="qk_ss" onclick="showall()">全部融资机构</a>
						<div class="clear"></div></li>
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
					<a href="javascript:void(0)" onclick="rank(this , 0)">默认排序</a>
				</div>
				<div class="jigou_Lb">
					<ul>
					<c:forEach items="${orgpage.data }" var="org">
						<li><a href="javascript:void(0)" class="jg_lit">
							<c:if test="${empty org.image }" var="flag"> 
								<img src="${ctx }/images1/jg_icon.jpg" />
							</c:if>
							<c:if test="${not flag}"> 
								<img src="${ctx }/${org.image}" />
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
								<p class="jgxq1">业务区域：${org.area}</p>
								<p class="jgxq1">擅长业务：${org.business }</p>
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
		function showBushiness(node , result){
			$("#business_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$(node).addClass("hit");
			if(result == 0){
				$("#cbean_business").val("");
			}else{
				$("#cbean_business").val($(node).html());
			}
			
			$("#cbean_business_index").val(result);
		}
		
		function showArea(node , result){
			$("#area_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$(node).addClass("hit");
			if(result == 0){
				$("#cbean_area").val("");
			}else{
				$("#cbean_area").val($(node).html());
			}
			
			$("#cbean_area_index").val(result);
		}
		
		function showType(node , result){
			$("#type_li a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$(node).addClass("hit");
			if(result == 0){
				$("#cbean_type").val("");
			}else{
				$("#cbean_type").val($(node).html());
			}
			$("#cbean_type_index").val(result);
		}
		
		function rank(node , result){
			$("#cbean_rank").val(result);
			show();
		}
		
		function show(){
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