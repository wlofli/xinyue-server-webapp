<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="../member/tree.jsp"%>
			<div class="hy_right">
				<div class="hy_right_bt">
					<ul class="menu1">
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=product'">产品收藏</a></li>
						<li class="hit"><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=org'">机构收藏</a></li>
					</ul>
				</div>
				<div class="tab">
					<p class="ssk_sc">
						<s:form commandName="cbean" action="${ctx }/member/orgcollectctr/show" method="post" id="collect_org_form">
							<s:hidden path="topage" id="collect_org_topage"/>
							<s:hidden path="memberid"/>
							<span>机构名称：</span><s:input path="orgName" class="t1"/>
							<input type="button" class="b2" value="搜索" onclick="show()"/>
						</s:form>
					</p>
					<Ul class="sc_cp">
						<c:forEach items="${pdata.data }" var="org">
							<li class="b_b_n"><input type="checkbox" class="pl_cz_ch" name="collect_org_ck" value="${org.id }"/>
								<img src="${ctx }/images/cp_tx.png" />
								<div class="sc_float_left">
									<span><a href="javascript:void(0)">${org.orgName }</a></span>
									<p class="jgxq">
										<span>入驻顾问：<strong>${org.creditCount }人</strong></span>
										<span>贷款产品：<strong>${org.proCount }个</strong></span>
										<span>机构类型：<strong>${org.orgType }</strong></span>
										<span>所在地：<strong>${org.orgAddress }</strong></span>
										<span>成立时间：<strong>${org.orgEstablish }年</strong></span>
										<span>公司规模：<strong>${org.orgScale }人</strong></span>
										<span>业务区域：<strong>${org.businessArea }</strong></span>
										<span>擅长业务：<strong>${org.business }</strong></span>
									</p>
								</div>
								<div class="sc_float_right">
									<a href="javascript:void(0)" class="sc_a_top">查看详情</a> <a href="javascript:void(0)" onclick="del(${org.id })">删除</a>
								</div>
								<div class="sc_float_right">
									<span class="sc_time">${org.createTime }</span>
								</div></li>
						</c:forEach>
					</Ul>
					<div class="plcz_mk">
						<a href="javascript:void(0)" onclick="option('s')">全选</a><a href="javascript:void(0)" onclick="option('d')">取消选择</a><a href="javascript:void(0)" onclick="del()">删除</a>
					</div>
					<p:page url="${ctx }/member/orgcollectctr/show" pageData="${pdata }"></p:page>

				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
	<script type="text/javascript">
		function option(node) {
			if (node == 's') {
				$("input:checkbox[name='collect_org_ck']").each(function() {
					this.checked = true;
				});
			} else {
				$("input:checkbox[name='collect_org_ck']").each(function() {
					this.checked = false;
				});
			}
		}

		function show() {
			$("#collect_org_form").submit();
		}

		function del() {
			var param = [];
			if (arguments.length == 0) {
				$("input:checkbox[name='collect_org_ck']").each(function() {
					if (this.checked) {
						param.push(this.value);
					}
				});
				if (param.length == 0) {
					alert("未选中数据,请选择");
					return;
				}
			} else {
				param.push(arguments[0]);
			}

			$.ajax({
				url : '${ctx}/member/orgcollectctr/del',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify(param),
				type : 'post',
				success : function(data) {
					if (data == 'success') {
						alert("删除成功");
						show();
					} else {
						alert("删除失败");
					}
				}
			});
		}

		function changePage(url, topage) {

			$("#collect_org_topage").val(topage);
			show();
		}
	</script>
</body>
</html>