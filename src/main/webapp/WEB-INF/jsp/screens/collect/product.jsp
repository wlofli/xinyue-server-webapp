<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-收藏管理-产品收藏</title>
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
						<li class="hit"><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=products'">产品收藏</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=orgs'">机构收藏</a></li>
					</ul>
				</div>
				<div class="tab">
					<p class="ssk_sc">
						<s:form commandName="cbean" action="${ctx }/member/procollectctr/show" method="post" id="collect_prodcut_form">
							<s:hidden path="topage" id="collect_product_topage"/>
							<s:hidden path="memberid"/>
							<span>产品名称：</span><s:input path="proName" class="t1"/>
							<span>所属机构：</span><s:input path="orgName" class="t1"/>
							<input type="button" class="b2" value="搜索" onclick="show()"/>
						</s:form>
					</p>
					<Ul class="sc_cp">
						<c:forEach items="${pdata.data }" var="collect">
							<li class="b_b_n"><input type="checkbox" class="pl_cz_ch" name="collect_product_ck" value="${collect.id }"/><img
								src="${ctx }/images/cp_tx.png" />
								<div class="sc_float_left">
									<span>产品名称：<a href="javascript:void(0)">${collect.productName }</a></span>
									<span>所属机构：${collect.orgName }</span>
									<span>贷款额度：${collect.credit }</span>
									<span>月息：${collect.interest }</span><span>贷款周期：${collect.period }</span>
								</div>
								<div class="sc_float_right">
									<a href="javascript:void(0)" class="sc_a_top">查看详情</a> <a href="javascript:void(0)" onclick="del(${collect.id})">删除</a>
								</div>
								<div class="sc_float_right">
									<span class="sc_time">${collect.collectTime }</span>
								</div></li>
						</c:forEach>
					</Ul>
					<div class="plcz_mk">
						<a href="javascript:void(0)" onclick="option('s')">全选</a><a href="javascript:void(0)" onclick="option('d')">取消选择</a><a href="javascript:void(0)" onclick="del()">删除</a>
					</div>
					<p:page url="${ctx }/member/procollectctr/show" pageData="${pdata }"></p:page>

				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
<script type="text/javascript">
	function option(node){
		if(node == 's'){
			$("input:checkbox[name='collect_product_ck']").each(function(){
				this.checked = true;
			});
		}else{
			$("input:checkbox[name='collect_product_ck']").each(function(){
				this.checked = false;
			});
		}
	}
	
	function show(){
		$("#collect_prodcut_form").submit();
	}
	
	function del(){
		var param = [];
		if(arguments.length ==0){
			$("input:checkbox[name='collect_product_ck']").each(function(){
				if(this.checked){
					param.push(this.value);
				}
			});
			if(param.length == 0){
				alert("未选中数据,请选择");
				return;
			}
		}else{
			param.push(arguments[0]);
		}
		
		$.ajax({
			url:'${ctx}/member/procollectctr/del',
			dataType:'json',
			contentType:'application/json',
			data:JSON.stringify(param),
			type:'post',
			success:function(data){
				if(data == 'success'){
					alert("删除成功");
					show();
				}else{
					alert("删除失败");
				}
			}
		});
	}
	
	
	function changePage(url , topage){
		
		$("#collect_product_topage").val(topage);
		show();
	}
</script>
</body>
</html>