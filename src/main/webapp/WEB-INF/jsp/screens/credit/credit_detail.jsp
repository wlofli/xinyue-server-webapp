<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_信贷经理详情</title>
<%@ include file="../../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
	</div>
	<div class="nr_main">
		<div class="nr_center">
			<div class="position">
				<div class="site">
					<i class="site_tb"></i><a href="${ctx}/index">网站首页</a>&gt;<a
						href="${ctx}/manager" class="a">信贷经理列表</a>&gt;<span>信贷经理详情-${managerDetail.personName}</span>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="pro_xq_left_bt">
					<span>${managerDetail.personName}</span>
					<input type="hidden" value="${managerDetail.creditManagerId}" id="id_cm">
				</div>
				<div class="pro_xq_left_nr">
					<div class="xdjl_xq">
						<div class="tx">
							<c:choose>
								<c:when test="${empty managerDetail.personImg}">
									<img src="${ctx}/images/tx1.jpg" />
								</c:when>
								<c:otherwise>
									<img src="${showPath}${managerDetail.personImg}" />
								</c:otherwise>
							</c:choose>
							<img src="${ctx}/images/${managerDetail.starLevel}" height="30px" />
						</div>
						<div class="xdjl_xx">
							<p>
								<span>认证情况：</span>
								<c:choose>
									<c:when test="${managerDetail.realNameStatus}">
										<img src="${ctx}/images1/sm_tb.jpg" height="40px"/>
									</c:when>
									<c:otherwise>
										<img src="${ctx}/images1/sm_tb1.jpg" height="40px"/>
									</c:otherwise>
								</c:choose>
								<img src="${ctx}/images1/jgrz_tb.jpg" height="40px" />
							</p>
							<p>
								<span>所属机构：</span>${managerDetail.organization}
							</p>
							<p>
								<span>服务区域：</span>${managerDetail.serverZone}
							</p>
							<p>
								<span>擅长业务：</span>${managerDetail.goodBusiness}
							</p>
						</div>
						<div class="zx_btn_div">
							<a href="javascript:zxtck('${managerDetail.creditManagerId}')" class="zx_btn">向他咨询</a>
							<span>共<strong>${managerDetail.applyCount}</strong>人向他申请</span>
						</div>
					</div>
					<div class="tj_xdjl">
						<span>贷款产品</span>
					</div>
					<ul class="tj_xd_lb">
						<c:forEach items="${products}" var="product" varStatus="vs">
							<li>
								<a href="javascript:void(0);" class="lit" onclick="productDetail('${product.id}')">
									<img src="${showPath}${product.logo}" height="90px" />
								</a>
								<div class="xd_js">
									<a href="javascript:void(0);" class="name" onclick="productDetail('${product.id}')">${product.name}</a>
									<div class="clear"></div>
<%-- 									<span>贷款额度：${product.creditFrom}-${product.creditTo}万</span> --%>
									<span>贷款额度：0-${product.credit}万</span>
									
									<span>产品类型：${product.productTypeName}</span>
									<div class="clear"></div>
								</div>
								<a href="javascript:void(0);" class="sq_btn" onclick="document.location.href='${ctx}/product/detail?proid=${product.id }'">产品详情</a>
							</li>
						</c:forEach>
					</ul>
					<div class="pagelist1">
						<p:pagecommon url="${ctx}/manager/product" pageData="${pageDataProduct}"></p:pagecommon>
					</div>

					<div class="tj_xdjl">
						<span>成功案例</span>
					</div>
					<ul class="tj_xd_lb">
						<c:forEach items="${detailInfo }" var="cases" varStatus="vs">
							<li>
								<span class="dkje"><strong>${cases.loanAmount}</strong>万</span>
								<div class="xd_js">
									<span>申请产品:</span><a href="pro_xq.html" class="name">${cases.productName}</a>
									<div class="clear"></div>
									<span>放款时长：${cases.loanDays}天</span><span>贷款人：${cases.applicantCompany}</span>
									<div class="clear"></div>
									<span>详细描述：${cases.description}</span>
									<div class="clear"></div>
								</div> <span class="fksj">放款时间：${cases.loanDate}</span>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="pro_xq_left_bt">
					<span>产品问答</span>
				</div>
				<div class="pro_jbxq">
					<ul class="wt_list">
						<!-- <Li><a href="#">小额贷款公司与银行无抵押有何区别?</a><span>3个回答</span></Li>
						<Li><a href="#">小额贷款公司与银行无抵押有何区别?</a><span>3个回答</span></Li>
						<Li><a href="#">小额贷款公司与银行无抵押有何区别?</a><span>3个回答</span></Li>
						<Li><a href="#">小额贷款公司与银行无抵押有何区别?</a><span>3个回答</span></Li>
						<Li><a href="#">小额贷款公司与银行无抵押有何区别?</a><span>3个回答</span></Li> -->
					</ul>

				</div>
			</div>
			<%@ include file="../../common/right_detail.jsp"%>
			<div class="clear"></div>
		</div>
	</div>
	<%@ include file="../../common/foot_main.jsp"%>
	<jsp:include page="../../common/order_fast_2.jsp"></jsp:include>
</body>
<script type="text/javascript">
function changePage(url,page){
	$.post(url+"?page="+page+"&managerId="+$("#id_cm").val());
}
</script>
</html>