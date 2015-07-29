<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p class="qiye_bt">
	<i><img src="${ctx}/images/sq_icon.png" id="tb3" /></i>
	<strong style="cursor:pointer" onclick="javascript:st2('jbxx3');javascript:gtb2()">公司治理信息</strong>
</p>
<div id="jbxx3" class="jbxx" style="display:none;">
	<sf:form action="${ctx}/member/save" commandName="controlinfo" method="post" id="controlForm">
		<p>
			<span>所属行业：</span>
			<sf:select path="industry" class="s1">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${industry}" itemValue="key" itemLabel="value"/>
			</sf:select>
		</p>
		<p>
			<span>持续经营开始时间：</span>
			<sf:input path="businessStartDate" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
		</p>
		<p>
			<span>主要经营地点：</span>
			<sf:radiobutton path="businessArea" value="1" cssClass="r1"/><span class="r1_sex">本地</span>
			<sf:radiobutton path="businessArea" value="0" cssClass="r1"/><span class="r1_sex">外地</span>
		</p>
		<p>
			<span>主要产品销售区域：</span>
			<sf:select path="saleArea" class="s1">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${businessAreaList}" itemValue="key" itemLabel="value"/>
			</sf:select>
		</p>
		<p>
			<span>是否固定营业场所：</span>
			<sf:radiobutton path="fixedBusinessPlace" value="1" cssClass="r1"/><span class="r1_sex">是</span>
			<sf:radiobutton path="fixedBusinessPlace" value="0" cssClass="r1"/><span class="r1_sex">否</span>
		</p>
		<p>
			<span>进入园区或市场年限：</span>
			<sf:input path="interYear" class="t1"/>
		</p>
		<p>
			<span>财务报表审计类型：</span>
			<sf:select path="auditType" class="s1">
				<sf:option value="">请选择</sf:option>
				<sf:options items="${auditTypeList}" itemValue="key" itemLabel="value"/>
			</sf:select>
		</p>
		<p>
			<span>员工人数：</span>
			<sf:input path="peopleNumber" class="t1"/>
		</p>
		<p>
			<span>是否有贷款卡：</span>
			<sf:radiobutton path="haveLoanCard" value="1" cssClass="r1"/><span class="r1_sex">是</span>
			<sf:radiobutton path="haveLoanCard" value="0" cssClass="r1"/><span class="r1_sex">否</span>
		</p>
		<p>
			<span>贷款卡卡号：</span>
			<sf:input path="loanCardNumber" class="t1"/>
		</p>
		<sf:hidden path="id"/>
		<p>
<!-- 			<input type="button" value="上一步" class="b4" onclick="saveHold('p')" /> -->
			<input type="button" value="保存" class="b4" onclick="saveControl('s')" />
<!-- 			<input type="button" value="下一步" class="b4" onclick="saveHold('n')" /> -->
		</p>
		
	</sf:form>
</div>
