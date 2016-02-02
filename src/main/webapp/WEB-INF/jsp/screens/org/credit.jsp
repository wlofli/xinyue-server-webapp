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
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/detail?orgid=${org.id }'">机构首页</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/pro?orgid=${org.id }'">贷款产品</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/case?orgid=${org.id }'">成功案例</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx}/org/org?orgid=${org.id }'">机构档案</a></li>
						<li class="hit"><a href="javascript:void(0)">贷款咨询</a></li>
					</ul>
				</div>
				<div class="pro_xq_left_nr">
					<div class="tw_form">
						<s:form commandName="qbean" method="post" action="${ctx }/org/advisory" id="qbean_form">
							<s:hidden path="orgid"/>
							<s:hidden path="topage" id="qbean_topage"/>
							<s:textarea path="title" class="tw_txt1"/>
							<input type="button" value="我要提问" class="tw_btn" onclick="ask()"/> 
							<input type="button" value="搜索答案" class="da_btn" onclick="showAdvisory()"/>
							<div class="clear"></div>
						</s:form>
					</div>
					<ul class="wd_list">
						<c:if test="${pagecredit.total != 0}">
							<c:forEach items="${pagecredit.data }" var="credit">
								<li>
									<p class="wt_bt">
										<i>问</i><a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/detail?questid=${credit.id }'">${credit.title }</a><span class="wds">${credit.answerNum }个回答</span>
									</p>
									<p class="wt_nr">
										<i>答</i><span>${credit.answerContent }</span>
									</p>
								</li>
							</c:forEach>
						</c:if>
						
					</ul>
					<div class="pagelist1">
						<p:pagecommon url="${ctx }/org/credit" pageData="${pagecredit }"></p:pagecommon>
					</div>
				</div>
			</div>
			<jsp:include page="orgcommon.jsp"></jsp:include>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	<script type="text/javascript">
		function changePage(url , topage){
			$("#qbean_topage").val(topage);
			$("#qbean_form").submit();
		}
		
		function showAdvisory(){
			$("#qbean_topage").val(0);
			$("#qbean_form").submit();
		}
	</script>
</body>
</html>