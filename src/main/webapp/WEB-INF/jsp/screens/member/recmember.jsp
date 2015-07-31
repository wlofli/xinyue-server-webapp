<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-推荐会员-普通会员列表</title>
<%@ include file="../../common/common.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="tree.jsp"%>
			<div class="hy_right">
				<div class="hy_right_bt">
					<ul class="menu1" id="menu">
						<li class="hit"><a href="javascript:void(0)" onclick="${ctx }/member/list?param=member">普通会员推荐</a></li>
						<li class=""><a href="javascript:void(0)" onclick="${ctx }/member/list?param=credit">信贷经理推荐</a></li>
					</ul>
				</div>
				<s:form commandName="reinfo" method="post" action="${ctx }/member/recommendctr/findMember" id="member_recommmend_form">
					<s:hidden path="topage" id="member_recommmend_topage"/>
					<s:hidden path="memberid"/>
				<div class="tab">
					<table class="sczl_table">
						<thead>
							<tr>
								<td colspan="1">序号</td>
								<td colspan="2">推荐会员名</td>
								<td colspan="2">推荐会员手机号</td>
								<td colspan="2">推荐会员类型</td>
								<td colspan="2">
									<s:select path="sort" class="s3">
										<s:option value="0">注册时间</s:option>
										<s:option value="1">降序排列</s:option>
										<s:option value="2">升序排列</s:option>
									</s:select>
								</td>
								<td colspan="1">收益积分</td>
								<td colspan="2">收益金额(元)</td>
							</tr>
						</thead>
						<tbody class="h_z">
							<c:forEach items="${pageMember.data }" var="member" varStatus="vs">
								<tr>
									<td colspan="1"><c:out value="${vs.count + (pageMember.currentPage-1)*pageMember.pageSize}" /></td>
									<td colspan="2">${member.presenteeName }</td>
									<td colspan="2">${member.presenteeTel }</td>
									<td colspan="2">${member.memberType }</td>
									<td colspan="2">${member.presenteeRegTime }</td>
									<td colspan="1">${member.presenterScore }</td>
									<td colspan="2">${member.presenterMoney }</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					<p:page url="${ctx }/member/recommendctr/findMember" pageData="${pageMember}"></p:page>
				</div>
				</s:form>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
<script type="text/javascript">
	function changePage(url , topage){
		$("#member_recommmend_topage").val(topage);
		$("#member_recommmend_form").submit();
	}
</script>
</body>
</html>