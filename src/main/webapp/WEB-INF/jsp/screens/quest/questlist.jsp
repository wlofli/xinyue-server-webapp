<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网问答列表页面</title>
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
					<i class="site_tb"></i><a href="javascript:void(0)">网站首页</a>&gt;<span>问答列表</span>
					<div class="clear"></div>
				</div>
			</div>

		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="tw_form">
					<s:form commandName="qbean" method="post" action="${ctx }/quest/show" id="quest_form">
						<s:textarea path="title" class="tw_txt1"/>
						<s:hidden path="topage" id="quest_topage"/>
						<s:hidden path="questype" id="quest_questype"/>
						<input type="button" value="我要提问" class="tw_btn" onclick="askquest()"/> 
						<input type="button" value="搜索答案" class="da_btn" onclick="showquest()"/>
						<div class="clear"></div>
					</s:form>
				</div>
				<ul class="wd_list">
					<c:if test="${pagequest.total != 0 }">
						<c:forEach items="${pagequest.data }" var="quest">
							<li>
								<p class="wt_bt">
									<i>问</i><a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/detail?questid=${quest.id }'">${quest.title }</a><span
										class="wds">${quest.answerNum }个回答</span>
								</p>
								<p class="wt_nr">
									<i>答</i><span>${quest.answerContent }</span>
								</p>
							</li>
						</c:forEach>
					</c:if>
				</ul>
				<div class="pagelist1">
					<p:pagecommon url="${ctx }/quest/show" pageData="${pagequest }"></p:pagecommon>
				</div>
			</div>
			<div class="pro_xq_right">
				<jsp:include page="questcommon.jsp"></jsp:include>				
			</div>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	<script type="text/javascript">
		function changePage(url , topage){
			$("#quest_topage").val(topage);
			showquest();
		}
		
		function showquest(){
			if(arguments.length == 0){
				$("#quest_form").submit();
			}else{
				$("#quest_questype").val(arguments[0]);
				$("#quest_form").submit();
			}
		}
		
		function askquest(){
			document.location.href="${ctx}/quest/ask";
		}
	</script>
</body>
</html>