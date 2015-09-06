<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pro_xq_right">
	<div class="p_r_dk">
		<div class="dk_bt">
			<span>我要贷款</span>
		</div>
		<div class="dk_nr">
			<sf:form action="" commandName="psInfo" method="post" id="loanForm">
			<p>
				<span>产品类别：</span>
				<sf:select path="productType" cssClass="lb_s">
					<sf:option value="">不限</sf:option>
					<sf:options items="${productTypes}" itemValue="id" itemLabel="name"/>
				</sf:select>
			</p>
			<p>
				<span>贷款金额：</span>
				<sf:select path="loanAmount" cssClass="lb_s">
					<sf:option value="">不限</sf:option>
					<sf:options items="${amounts}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p>
				<span>贷款期限：</span>
				<sf:select path="loanPeriod" cssClass="lb_s">
					<sf:option value="">不限</sf:option>
					<sf:options items="${loanPeriods}" itemValue="key" itemLabel="value"/>
				</sf:select>
			</p>
			<p class="mar_bot">
				<input type="button" class="lb_b" value="搜索产品" />
			</p>
			</sf:form>
		</div>
	</div>
	<div class="rm_zx">
		<div class="zx_bt">
			<span>热门资讯</span><a href="${ctx }/new/list">更多&gt;</a>
			<div class="clear"></div>
		</div>
		<div class="zx_lb">
			<ul>
				<c:forEach items="${newlist}" var="list" varStatus="vs">
					<Li><a href="${ctx }/new/detail?id=${list.id}">${list.title}</a></Li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="ad_mk1">
		<a href="${advert}"><img src="${showPath}${advert.url}${advert.thumbnail}" /></a>
	</div>
</div>