<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="hy_right_bt">
	<ul class="menu1" id="menu">
		<li class=""><a href="${ctx}/member/record/applicant">申请人信息</a></li>
		<li class=""><a href="${ctx}/member/record/company">企业基本信息</a></li>
		<li class="hit"><a href="${ctx}/member/record/business">基本经营信息</a></li>
		<li class=""><a href="${ctx}/member/record/estate">抵押物信息</a></li>
		<li class=""><a href="${ctx}/member/record/debt">负债信息</a></li>
		<li class=""><a href="${ctx}/member/record/document">上传资料</a></li>
		<li class=""><a href="${ctx}/member/record/rating">评级信息</a></li>
	</ul>
</div>
<div class="tab">
	<sf:form action="${ctx}/member/save" commandName="businessInfos" method="post" id="businessForm">
		<p class="qiye_bt">
			<strong>基本经营信息</strong>
		</p>
		<c:forEach begin="0" end="2" varStatus="vs">
		<p class="qiye_bt">
			<strong>${businessInfos.years[vs.index]}</strong>
		</p>
		<p>
			<span>年度总销售收入(万)：</span>
			<sf:input path="totalSales[${vs.index}]" class="t1"/>
		</p>
		<p>
			<span>年度订单总金额(万)：</span>
			<sf:input path="monthOrderMoneys[${vs.index}]" class="t1"/>
		</p>
		<p>
			<span>年度月均水费(元)：</span>
			<sf:input path="monthWaterMoneys[${vs.index}]" class="t1"/>
		</p>
		<p>
			<span>年度月均电费(元)：</span>
			<sf:input path="monthElectricMoneys[${vs.index}]" class="t1"/>
		</p>
		<p>
			<span>年度增值税纳额(万)：</span>
			<sf:input path="totalVATs[${vs.index}]" class="t1"/>
		</p>
		<p>
			<span>年度所得税纳额(万)：</span>
			<sf:input path="totalIncomeTaxs[${vs.index}]" class="t1"/>
		</p>
		<sf:hidden path="ids[${vs.index}]"/>
		<sf:hidden path="years[${vs.index}]"/>
		</c:forEach>
		<p>
			<input type="button" value="上一步" class="b4" onclick="saveBus('p')" />
			<input type="button" value="保存" class="b4" onclick="saveBus('s')" />
			<input type="button" value="下一步" class="b4" onclick="saveBus('n')" />
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
			document.location.href = "${ctx}/member/record/company";
			break;
		case "n":
			document.location.href = "${ctx}/member/record/estate";
			break;
		default:
			break;
		}
	}
});

function saveBus(type){
	$("#businessForm").attr("action","${ctx}/member/business/save?type="+type);
	$("#businessForm").submit();
}

</script>