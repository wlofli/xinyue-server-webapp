<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="hy_right_bt">
	<ul class="menu1" id="menu">
		<li class=""><a href="${ctx}/member/record/applicant">申请人信息</a></li>
		<li class=""><a href="${ctx}/member/record/company">企业基本信息</a></li>
		<li class=""><a href="${ctx}/member/record/business">基本经营信息</a></li>
		<li class="hit"><a href="${ctx}/member/record/estate">抵押物信息</a></li>
		<li class=""><a href="${ctx}/member/record/debt">负债信息</a></li>
		<li class=""><a href="${ctx}/member/record/document">上传资料</a></li>
		<li class=""><a href="${ctx}/member/record/rating">评级信息</a></li>
	</ul>
</div>
<div class="tab">
	<sf:form action="${ctx}/member/save" commandName="estateInfo" method="post" id="estateForm">
		<p class="qiye_bt">
			<strong>未抵押的不动产</strong>
		</p>
		<p>
			<span>厂房（万元）：</span>
			<sf:input path="factory" class="t1"/>
		</p>
		<p>
			<span>土地（万元）：</span>
			<sf:input path="land" class="t1"/>
		</p>
		<p>
			<span>办公楼（万元）：</span>
			<sf:input path="office" class="t1"/>
		</p>
		<p>
			<span>店铺（万元）：</span>
			<sf:input path="shop" class="t1"/>
		</p>
		<p>
			<span>法人私有财产（万元）：</span>
			<sf:input path="privateProperty" class="t1"/>
		</p>
		<p>
			<span>机器设备（万元）：</span>
			<sf:input path="equipment" class="t1"/>
		</p>
		<p>
			<span>其他（万元）：</span>
			<sf:input path="other" class="t1"/>
		</p>
		<sf:hidden path="id" />
		<p>
			<input type="button" value="上一步" class="b4" onclick="saveEst('p')" />
			<input type="button" value="保存" class="b4" onclick="saveEst('s')" />
			<input type="button" value="下一步" class="b4" onclick="saveEst('n')" />
		</p>
	</sf:form>
</div>
<script type="text/javascript">
$(function () {
	var message = "${message}";
	if (message != null && message != "") {
		alert(message);
	}
});

function saveEst(type){
	$("#estateForm").attr("action","${ctx}/member/estate/save?type="+type);
	$("#estateForm").submit();
}

</script>