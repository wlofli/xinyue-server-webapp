<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="pro_xq_right">
	<div class="p_r_dk">
		<div class="dk_bt">
			<span>我要贷款</span>
		</div>
		<div class="dk_nr">
			<s:form action="${ctx }/product/show" commandName="psInfo" method="post" id="loanForm">
			<p>
				<span>产品类别：</span>
				<s:select path="productType" cssClass="lb_s">
					<s:option value="">不限</s:option>
					<s:options items="${productTypes}" itemValue="id" itemLabel="name"/>
				</s:select>
			</p>
			<p>
				<span>贷款金额：</span>
				<s:select path="loanAmountIndex" cssClass="lb_s">
					<s:option value="0">不限</s:option>
					<s:options items="${amounts}" itemValue="key" itemLabel="value"/>
				</s:select>
			</p>
			<p>
				<span>贷款期限：</span>
				<s:select path="loanPeriod" cssClass="lb_s">
					<s:option value="">不限</s:option>
					<s:options items="${loanPeriods}" itemValue="key" itemLabel="value"/>
				</s:select>
			</p>
			<p class="mar_bot">
				<input type="button" class="lb_b" value="搜索产品" onclick="find()"/>
			</p>
			</s:form>
		</div>
	</div>
	<div class="rm_zx">
		<div class="zx_bt">
			<span>贷款咨询</span>
			<div class="clear"></div>
		</div>
		<div class="tw_form">
			<s:form commandName="qbean" method="post" action="${ctx }/quest/show" id="qbean_quest_form">
				
				<s:input path="title" cssClass="tw_t1" style="display:inline-block; width:225px;" placeholder="请输入关键字"/>
				<input type="button" value="搜索" class="tw_ss"  style="display:inline-block;"  onclick="showQuest()"/>
				<input type="button" value="提问" class="tw_ss_btn"  style="display:inline-block;"  onclick="ask()"/>
				<s:hidden path="topage" id="quest_topage"/>
				<s:hidden path="questype" id="quest_questype"/>
				<div class="clear"></div>
			</s:form>
		</div>

	</div>
	<div class="dkjsq" style="margin-top: 10px; border: 1px #aaa solid;">
		<div class="dkjsq_bt" style="border-bottom: 1px #eee dashed">
			<span>贷款计算器</span>
		</div>
		<ul class="jsq" style="padding: 10px 0;">
			<li class="jsq"><a href="#" class="jsq_left"><img
					src="${ctx}/images1/jsq_icon.png" width="60px" /></a>
				<div class="xq">
					<a href="#"> 房贷担保费计算器 </a> <span>一分钟算出房贷担保费</span>
				</div>
				<Div class="clear"></Div></li>
			<li class="jsq"><a href="#" class="jsq_left"><img
					src="${ctx}/images1/jsq_icon1.png" width="60px" /></a>
				<div class="xq">
					<a href="#"> 商业贷款计算器 </a> <span>算算你的贷款划算否？</span>
				</div>
				<Div class="clear"></Div></li>
			<li class="jsq"><a href="#" class="jsq_left"><img
					src="${ctx}/images1/jsq_icon2.png" width="60px" /></a>
				<div class="xq">
					<a href="#"> 提前还款计算器 </a> <span>提前还款帮你省了多少利息</span>
				</div>
				<Div class="clear"></Div></li>
			<li class="jsq"><a href="#" class="jsq_left"><img
					src="${ctx}/images1/jsq_icon2.png" width="60px" /></a>
				<div class="xq">
					<a href="#"> 个人贷款计算器 </a> <span>帮您算算你的个人个人最高贷款额度是多少</span>
				</div>
				<Div class="clear"></Div></li>
		</ul>
	</div>
	<div class="ad_mk1">
		<a href="${advert.url}"> <img src="${showpath}${advert.directory}${advert.thumbnail}" height="422" width="400"/></a>
	</div>
</div>
<script type="text/javascript">
	function ask(){
		document.location.href="${ctx}/quest/ask?orgid=${org.id}";
	}
	
	function find(){
		$("#loanForm").submit();
	}
	function showQuest(){
		$("#qbean_topage").val(0);
		$("#qbean_quest_form").submit();
	}
</script>