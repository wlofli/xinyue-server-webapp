<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="hy_right_bt">
	<ul class="menu1" id="menu">
		<li class=""><a href="${ctx}/member/record/applicant">申请人信息</a></li>
		<li class=""><a href="${ctx}/member/record/company">企业基本信息</a></li>
		<li class=""><a href="${ctx}/member/record/business">基本经营信息</a></li>
		<li class=""><a href="${ctx}/member/record/estate">抵押物信息</a></li>
		<li class=""><a href="${ctx}/member/record/debt">负债信息</a></li>
		<li class=""><a href="${ctx}/member/record/document">上传资料</a></li>
		<li class="hit"><a href="${ctx}/member/record/rating">评级信息</a></li>
	</ul>
</div>
<div class="tab" >
	<sf:form action="" commandName="ratingInfo" method="post" id="ratingForm">
		<p class="qiye_bt">
			<strong>信用评级申请（<i>*</i>为必填项）
			</strong>
		</p>
		<p>
			<span><i>*</i>评级业务类型：</span>
			<sf:select path="businessType" cssClass="s1 required">
				<sf:option value="">请选择</sf:option>
				<sf:options items="" itemValue="key" itemLabel="value"/>
			</sf:select>
		</p>
		<p>
			<span><i>*</i>评级机构：</span>
			<sf:select path="organization" cssClass="s1 required">
				<sf:option value="">请选择</sf:option>
				<sf:options items="" itemValue="key" itemLabel="value"/>
			</sf:select>
		</p>
		<p>
			<span><i>*</i>申报单位：</span>
			<sf:input path="applyCompany" cssClass="t1"/>
		</p>
		<p>
			<span><i>*</i>申报人：</span>
			<sf:input path="applyperson" cssClass="t1"/>
		</p>
		<p>
			<input id="checkB" type="checkbox" class="c1" checked="checked"/><span class="c1_xy">我同意此协议</span>
			<a class="xyxq">查看协议>></a>
		</p>
		<p class="panel">
			<span class="bt">申请信用评级协议</span>
			1、申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议<br />
			2、申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议<br />
			3、申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议申请信用评级协议
		</p>
		<p>
			<input type="button" value="保存" class="b1" />
		</p>
	</sf:form>
</div>
<script type="text/javascript">
$(function () {
	var message = "${message}";
	var type = "${type}";
	if (message != null && message != "") {
		alert(message);
		switch (type) {
		case "p":
			document.location.href = "${ctx}/member/record/estate";
			break;
		case "n":
			document.location.href = "${ctx}/member/record/document";
			break;
		default:
			break;
		}
	}
});

function saveDebt(type){
	$("#debtForm").attr("action","${ctx}/member/debt/save?type="+type);
	$("#debtForm").submit();
}

</script>