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
		<li class="hit"><a href="${ctx}/member/record/debt">负债信息</a></li>
		<li class=""><a href="${ctx}/member/record/document">上传资料</a></li>
		<li class=""><a href="${ctx}/member/record/rating">评级信息</a></li>
	</ul>
</div>
<div class="tab">
	<sf:form action="${ctx}/member/save" commandName="debtInfo" method="post" id="debtForm">
		<p class="qiye_bt">
			<strong>负债</strong>
		</p>
		<p>
			<span>公司资产负债率(%)：</span>
			<sf:input path="rate" class="t1"/>
		</p>
		<p>
			<span>抵押物情况：</span>
			<sf:select path="collateral" class="t1">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${collateralTypeList}" itemValue="key" itemLabel="value"/>
			</sf:select>
		</p>
		<p>
			<span>第一还款来源年收入(万元)：</span>
			<sf:input path="repayIncome" class="t1"/>
		</p>
		<p>
			<span>是否有上下游企业：</span>
			<sf:radiobutton path="isBig" value="1" cssClass="r1"/><span class="r1_sex">是</span>
			<sf:radiobutton path="isBig" value="0" cssClass="r1"/><span class="r1_sex">否</span>
		</p>
		<p>
			<span>企业净资产（万元）：</span>
			<sf:input path="netAsset" class="t1"/>
		</p>
		<p>
			<span>企业净资产流动比(%)：</span>
			<sf:input path="floatRate" class="t1"/>
		</p>
		<p>
			<span>企业主（或实际控制人）资产（万元）：</span>
			<sf:input path="factAsset" class="t1"/>
		</p>
		<sf:hidden path="id"/>
	</sf:form>
	
	<p>
		<input type="button" value="上一步" class="b4" onclick="saveDebt('p')" />
		<input type="button" value="保存" class="b4" onclick="saveDebt('s')" />
		<input type="button" value="下一步" class="b4" onclick="saveDebt('n')" />
	</p>
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