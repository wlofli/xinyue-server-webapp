<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p class="qiye_bt">
	<i><img src="${ctx}/images/sq_icon.png" id="tb2"/></i>
	<strong style="cursor:pointer" onclick="javascript:st('jbxx2');javascript:gtb1()">公司控股信息</strong>
</p>
<div id="jbxx2" class="jbxx" style="display:none;">
	<sf:form action="${ctx}/member/save" commandName="holdInfos" method="post" id="holdForm">
		<c:forEach begin="0" end="1" varStatus="vs">
			<p>
				<span>股东控股方式：</span>
				<sf:select path="holdTypes[${vs.index}]" class="s1">
					<sf:option value="">请选择</sf:option>
					<sf:options items="${holdTypeList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>实际控制人之<c:if test="${vs.index+1 eq 1}">一</c:if><c:if test="${vs.index+1 eq 2}">二</c:if>：</span>
				<sf:input path="controlPersons[${vs.index}]" class="t1" />
			</p>
			<p>
				<span>证件类型：</span>
				<sf:select path="paperTypes[${vs.index}]" class="s1">
					<sf:option value="">请选择</sf:option>
					<sf:options items="${idTypeList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>证件号码：</span>
				<sf:input path="paperNumbers[${vs.index}]" class="t1" />
			</p>
			<p>
				<span>从业年限(年)：</span>
				<sf:input path="workYears[${vs.index}]" class="t1" />
			</p>
			<p>
				<span>学历：</span>
				<sf:select path="educations[${vs.index}]" class="s1">
					<sf:option value="">请选择</sf:option>
					<sf:options items="${educationTypeList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>婚姻情况：</span>
				<sf:select path="marriages[${vs.index}]" class="s1">
					<sf:option value="">请选择</sf:option>
					<sf:options items="${marriageTypeList}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<sf:hidden path="ids[${vs.index}]"/>
		</c:forEach>
		<p>
<!-- 			<input type="button" value="上一步" class="b4" onclick="saveHold('p')" /> -->
			<input type="button" value="保存" class="b4" onclick="saveHold('s')" />
<!-- 			<input type="button" value="下一步" class="b4" onclick="saveHold('n')" /> -->
		</p>
		
	</sf:form>
</div>
