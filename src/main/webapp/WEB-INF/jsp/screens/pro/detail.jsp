<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="description" content="杭州贷款公司,杭州抵押贷款,杭州融资-新越网,杭州贷款,杭州融资,新越网贷款平台,中小企业贷款,小微贷款
,贷款资讯,申请贷款,申请贷款" />
<meta http-equiv="keywords" content="杭州贷款公司,杭州抵押贷款,杭州贷款,杭州融资" />
<title>新越网产品详情页面</title>
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
						href="javascript:void(0)" class="a" onclick="document.location.href='${ctx}/product/show'">产品列表</a>&gt;<span>${pro.name }</span>
					<div class="clear"></div>
				</div>
			</div>

		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="pro_xq_left_bt">
					<span>税贷通</span><i>热门产品</i>
				</div>
				<div class="pro_xq_left_nr">
					<ul class="pro_xq_nr_top">
						<li><span>产品名称：${pro.name }</span></li>
						<li><span>产品类别：${pro.productTypeName }</span></li>
						<li><span>所属银行：${pro.orgName }</span></li>
						<li><span>贷款额度：${pro.credit }万元</span></li>
						<li><span>适用地区：${pro.area }</span></li>
						<li>
							<c:if test="${phone }" var="flag">
								<a href="javascript:void" onclick="zxtck('${pro.id }')">我要申请</a>
							</c:if>
							<c:if test="${not flag }">
								<a href="javascript:void(0)" onclick="qzxtck('${pro.id }')">我要申请</a>
							</c:if>
						</li>

					</ul>
					<div class="tj_xdjl">
						<span>推荐信贷经理</span>
					</div>
					<ul class="tj_xd_lb">
						<c:if test="${not empty credit }">
							<c:forEach items="${credit }" var="c">
								<li><a href="javascript:void(0)" onclick="" class="lit">
										<c:if test="${empty c.personImg }" var="flag">
											<img src="${ctx }/images1/xdjl_tx1.png" />
										</c:if>
										<c:if test="${not flag }">
											<img src="${showpath}credit/person/head/${c.personImg}" />
										</c:if>
									</a>
								
									<div class="xd_js">
										<a href="javascript:void(0)" onclick="" class="name">${c.personName }</a>
										<c:choose>
												<c:when test="${c.realNameStatus}">
													<img src="${ctx }/images1/sm_tb.jpg" />
													<img src="${ctx }/images1/jgrz_tb.jpg" />
												</c:when>
												<c:otherwise>
													<img src="${ctx }/images1/sm_tb1.jpg" />
													<img src="${ctx }/images1/jgrz_tb1.jpg" />
												</c:otherwise>
										</c:choose>
										<span>服务质量</span>
										<img src="${ctx}/images/${c.starLevel}" height="30px" />
										<div class="clear"></div>
										<span>所属机构：${c.organization }</span><span>服务地区：${c.serverZone }</span>
										<div class="clear"></div>
									</div> 
									<c:if test="${phone }" var="flag">
										<a href="javascript:void(0)" onclick="zxtck('${pro.id }','${c.creditManagerId }')" class="sq_btn">立即申请</a>
									</c:if>
									<c:if test="${not flag }">
										<a href="javascript:void(0)" onclick="qzxtck('${pro.id }','${c.creditManagerId }')" class="sq_btn">立即申请</a>
									</c:if>
										
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<div class="pro_xq_left_bt">
					<span>基本信息</span>
				</div>
				<div class="pro_jbxq">
					<p>
						<strong>产品介绍</strong>
						${pro.content }

					</p>
				</div>

				<div class="pro_xq_left_bt">
					<span>申请材料</span>
				</div>
				<div class="pro_jbxq">
					<c:forEach items="${fileList }" var="file">
					<p>
						<span>${file.fileName }</span>/${file.fileType }
					</p>
					</c:forEach>
				</div>

			</div>
			<jsp:include page="../../common/right_detail.jsp"></jsp:include>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	<jsp:include page="order_fast.jsp"></jsp:include>
	
	<script type="text/javascript">
		function zxtck(){
			if(confirm("确认要生成订单?")){
				$.ajax({
					url:'${ctx}/product/addOrder',
					data:{'productId':arguments[0] , 'manageId':arguments[1]},
					type:'post',
					success:function(data){
						if(data != 'fail'){
// 							alert(data);
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
</body>
</html>