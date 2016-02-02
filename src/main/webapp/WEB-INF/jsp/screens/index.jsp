<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网－最专业的O2O融资服务平台</title>
<%@ include file="../common/common.jsp"%>
<script type="text/javascript">
$(function(){
	var message = "${message}";
	if (message != null && message != "") {
		alert(message);
	}
});

$(function() {
	var $this = $("#anli");
	var scrollTimer;
	$this.hover(function() {
	clearInterval(scrollTimer);
	}, function() {
	scrollTimer = setInterval(function() {
	scrollNews($this);
	}, 2000);
	}).trigger("mouseleave");
	
	function scrollNews(obj) {
		var $self = obj.find("ul");
		var lineHeight = $self.find("li:first").height();
		$self.animate({
		"marginTop": -lineHeight + "px"
		}, 600, function() {
			$self.css({
			marginTop: 0
			}).find("li:first").appendTo($self);
		})
	}
	}) 
	
	function showquest(){
	 $("#quest_form").submit();
	}
	
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
			</span><a href="${ctx}/product/show">了解更多&gt;</a>
			<div class="clear"></div>
		</div>
		<div class="nr">
			<div class="cp_sx">
				<ul id="menu">
					<li><span>产品类型：</span></li>
					<c:forEach items="${product.data }" var="list" varStatus="vs">
						<li <c:if test="${vs.index ==0 }">class="hit"</c:if>><a href="javascript:tab_item(${vs.index })">${list.name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="cp_lb" >
			
			<c:forEach items="${product.data }" var="list" varStatus="vs">
			<ul id="tab${vs.index }" <c:if test="${vs.index == 0 }">style="display:block;"</c:if> >
					<c:forEach items="${list.products }" var="pro" varStatus="vs2">
						<li>
							<c:choose>
								<c:when test="${!empty pro.logo }">
									<a href="${proShowPath }${pro.logo}" class="img"><img src="${proShowPath }${pro.logo}" /></a>
								</c:when>
								<c:otherwise>
									<a href="${ctx}/images1/cp_icon1.png" class="img"><img src="${ctx}/images1/cp_icon1.png" /></a>
								</c:otherwise>
							</c:choose>
							
							<p>产品名称：<a href="${ctx }/product/detail?proid=${pro.id}">${pro.name }</a><br /> 贷款额度：0-${pro.credit }万元<br />
								产品类别：${pro.type.name }	</p>
							<p class="txt_c">
								<a href="${ctx }/product/detail?proid=${pro.id}" class="cp_xq_btn">查看详情</a>
								<c:if test="${phone }" var="flag">
									<a href="javascript:void(0)" onclick="zxtck('${pro.id }')" class="cp_sq_btn">立即申请</a>
								</c:if>
								<c:if test="${not flag }">
									<a href="javascript:void(0)" onclick="qzxtck('${pro.id }')" class="cp_sq_btn">立即申请</a>
								</c:if>
							
							</p>
						</li>
					</c:forEach>
			</ul>
			</c:forEach>
			
			</div>
			<div class="clear"></div>
<script type="text/javascript">
function zxtck(){
	if(confirm("确认要生成订单?")){
		$.ajax({
			url:'${ctx}/product/addOrder',
			data:{'productId':arguments[0]},
			type:'post',
			success:function(data){
				if(data != 'fail'){
					alert("订单添加成功");
					document.location.href = '${ctx}/member/order/detail/applicant?id='+data;
				}else{
					alert("添加失败");
				}
			}
		});
		
	}
}
</script>
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
					<c:forEach items="${creditList }" var="list" begin="0" end="1" varStatus="vs">
						<div <c:choose>
							<c:when test="${vs.count % 2 != 0 }">class="xdjl_left"</c:when>
							<c:otherwise>class="xdjl_right"</c:otherwise>
						</c:choose>>
						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" />
							<img src="${ctx}/images/${list.starLevel}" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>${list.personName }</strong>
								<c:choose>
									<c:when test="${list.realNameStatus == true }">
										<img src="${ctx}/images1/sm_tb.jpg" />
									</c:when>
									<c:otherwise>
										<img src="${ctx}/images1/sm_tb1.jpg" />
										
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.organizationAuthStatus }">
										<img src="${ctx}/images1/jgrz_tb1.jpg" />
									</c:when>
									<c:otherwise>
										<img src="${ctx}/images1/jgrz_tb.jpg" />
									</c:otherwise>
								</c:choose>
							</p>
							<p class="xdjl_bz">
								共有<strong>${list.applyCount }</strong>人向该顾问咨询
							</p> 
							<p class="xdjl_ssgs">所属公司：${list.organization }</p>
							<p class="xdjl_scyw">服务地区：${list.serverZone }</p>
							<p class="xdjl_scyw">擅长业务：${list.goodBusiness }</p>
							<p class="cz_btn">
								<a href="javascript:zxtck('${list.creditManagerId }')" class="xdjl_btn">向他咨询</a>
								<a href="${ctx }/org/detail?orgid=${list.organizationId}" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					</c:forEach>
				</Li>
				<Li>
					<c:forEach items="${creditList }" var="list" begin="2" end="3" varStatus="vs">
						<div <c:choose>
							<c:when test="${vs.count % 2 != 0 }">class="xdjl_left"</c:when>
							<c:otherwise>class="xdjl_right"</c:otherwise>
						</c:choose>>
						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" />
							<img src="${ctx}/images/${list.starLevel}" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>${list.personName }</strong>
								<c:choose>
									<c:when test="${list.realNameStatus == true }">
										<img src="${ctx}/images1/sm_tb.jpg" />
									</c:when>
									<c:otherwise>
										<img src="${ctx}/images1/sm_tb1.jpg" />
										
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.organizationAuthStatus }">
										<img src="${ctx}/images1/jgrz_tb1.jpg" />
									</c:when>
									<c:otherwise>
										<img src="${ctx}/images1/jgrz_tb.jpg" />
									</c:otherwise>
								</c:choose>
							</p>
							<p class="xdjl_bz">
								共有<strong>${list.applyCount }</strong>人向该顾问咨询
							</p> 
							<p class="xdjl_ssgs">所属公司：${list.organization }</p>
							<p class="xdjl_scyw">服务地区：${list.serverZone }</p>
							<p class="xdjl_scyw">擅长业务：${list.goodBusiness }</p>
							<p class="cz_btn">
								<a href="javascript:zxtck('${list.creditManagerId }')" class="xdjl_btn">向他咨询</a>
								<a href="${ctx }/org/detail?orgid=${list.organizationId}" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					</c:forEach>
				</Li>
				<Li class="bor_none">
					<c:forEach items="${creditList }" var="list" begin="4" end="5" varStatus="vs">
						<div <c:choose>
							<c:when test="${vs.count % 2 != 0 }">class="xdjl_left"</c:when>
							<c:otherwise>class="xdjl_right"</c:otherwise>
						</c:choose>>
						<div class="img_left">
							<img src="${ctx}/images1/xdjl_tx.png" />
							<img src="${ctx}/images/${list.starLevel}" width="92px" />
						</div>
						<div class="xdjl_xq">
							<p class="xdjl_name">
								<strong>${list.personName }</strong>
								<c:choose>
									<c:when test="${list.realNameStatus == true }">
										<img src="${ctx}/images1/sm_tb.jpg" />
									</c:when>
									<c:otherwise>
										<img src="${ctx}/images1/sm_tb1.jpg" />
										
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.organizationAuthStatus }">
										<img src="${ctx}/images1/jgrz_tb1.jpg" />
									</c:when>
									<c:otherwise>
										<img src="${ctx}/images1/jgrz_tb.jpg" />
									</c:otherwise>
								</c:choose>
							</p>
							<p class="xdjl_bz">
								共有<strong>${list.applyCount }</strong>人向该顾问咨询
							</p> 
							<p class="xdjl_ssgs">所属公司：${list.organization }</p>
							<p class="xdjl_scyw">服务地区：${list.serverZone }</p>
							<p class="xdjl_scyw">擅长业务：${list.goodBusiness }</p>
							<p class="cz_btn">
								<a href="javascript:zxtck('${list.creditManagerId }')" class="xdjl_btn">向他咨询</a>
								<a href="${ctx }/org/detail?orgid=${list.organizationId}" class="xdjl_btn">进入机构</a>
							</p>
						</div>
						<div class="clear"></div>
					</div>
					</c:forEach>
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
					<span>杭州资讯</span><a href="${ctx }/new/list">更多&gt;</a>
					<div class="clear"></div>
				</div>
				<ul class="zx_nr">
				<c:forEach items="${newlist }" begin="0" end="0" var="list">
					<li class="h_zx"><a href="${list.fileDir}${list.fileName}" class="litpic">
					<c:choose>
						<c:when test="${empty list.fileName }">
							<img src="${ctx}/images1/zx_img.jpg" width="80px" height="60px" />
						</c:when>
						<c:when test="${!empty list.fileName}">
							<img src="${list.fileDir}${list.fileName}" width="80px" height="60px" />
						</c:when>
					</c:choose>
					
					</a>
						<p class="zxnr">
							<a href="${ctx }/new/detail?id=${list.id}" class="title">${list.title }</a><span>${list.showTitle }
							<a href="${ctx }/new/detail?id=${list.id}" class="more">[详情]</a>
							</span>
						</p></li>
				</c:forEach>
				<c:forEach items="${newlist }" var="list" begin="1">
					<li><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></li>
				</c:forEach>
				</ul>
			</div>
			<div class="anli_mk">
				<div class="zx_bt">
					<span>成功案例</span>
				</div>
				<div id="anli">
					<ul class="zx_nr">
					<c:forEach items="${successCase }" var="list" varStatus="vs">
						<li><span>${list.applicantCompany }</span><strong>￥${list.loanAmount }</strong></li>
					</c:forEach>
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
					<span>贷款攻略</span><a href="${ctx }/new/list">更多&gt;</a>
				</div>
				<div class="zx_nr">
					<ul>
						<c:forEach items="${loan }" var="list" varStatus="vs">
							<li><a href="${ctx }/new/detail?id=${list.id}">${list.title }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="wd_mk">
				<div class="wd_bt">
					<span>热门问答</span><a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/show'">更多&gt;</a>
				</div>
				<div class="wd_nr">
					<div class="wd_form">
					<form  method="post" action="${ctx }/quest/show" id="quest_form">
						<textarea name="title" class="txt_wd1"></textarea>					
						<input type="button" class="tw_btn" onclick="showquest()" />
						<input type="button"		class="wtda_btn" onclick="document.location.href='${ctx}/quest/ask'"/>
						<div class="clear"></div>
					</form>
					</div>
					<ul class="wd_nr">
						<c:forEach items="${question }" var="list" varStatus="vs" begin="0" end="2"> 
							<li>
							<p class="wt_bt">
								<i>问</i><a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/detail?questid=${list.id }'"
									title="我们企业打算要申请贷款，想要通过担保公司申请贷款，这样安全吗？">${list.title }</a>
							</p>
							<p class="wt_nr">
								<i>答</i><span>${list.answerContent }</span>
							</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="container3">
		<div class="bt">
			<h1>推荐机构店铺</h1>
			<a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/show'">更多&gt;</a>
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
							<c:forEach items="${orglist}" var="orgone">
								<a class="pl" href="javascript;void(0)" onclick="document.location.href='${ctx}/org/detail?orgid=${orgone.id }'">
									<c:if test="${!empty orgone.image }">
										<img src="${showPath }org/${orgone.image}" width="180" height="119" />
									</c:if>
									<c:if test="${empty orgone.image }">
										<img src="${ctx }/images1/jg_icon.jpg" width="180" height="119"/>
									</c:if>
									<span>机构名称：<strong>${orgone.orgName }</strong><br />贷款产品：${orgone.proCount }个<br />累计受理：${orgone.ordercount }笔<br />成功放款：${orgone.creditCount }万</span>
								</a>
							</c:forEach>
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
				<a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/show'">更多&gt;</a>
				<div class="clear"></div>
			</div>
			<ul class="hzjg_lb">
				<c:forEach items="${orglist}" var="orgtwo">
					<li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/detail?orgid=${orgtwo.id }'" title="招商证券">
						<c:if test="${!empty orgtwo.image }">
							<img src="${showPath }org/${orgtwo.image}" alt="招商证券" width="180" height="119"/>
						</c:if>
						<c:if test="${ empty orgtwo.image }">
							<img src="${ctx }/images1/hzjg.jpg" alt="招商证券" width="180" height="119"/>
						</c:if>
						</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="../common/foot_main.jsp"%>
	<jsp:include page="../common/order_fast_2.jsp"></jsp:include>
</body>
</html>