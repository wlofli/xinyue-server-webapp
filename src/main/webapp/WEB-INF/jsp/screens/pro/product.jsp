<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="description"
	content="杭州贷款公司,杭州抵押贷款,杭州融资-新越网,杭州贷款,杭州融资,新越网贷款平台,中小企业贷款,小微贷款
,贷款资讯,申请贷款,申请贷款" />
<meta http-equiv="keywords" content="杭州贷款公司,杭州抵押贷款,杭州贷款,杭州融资" />
<title>新越网产品列表页面</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
	$(function(){
		var type = '${psearch.productTypeIndex}';
		if(type != undefined){
			$("#pro_type a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$("#pro_type a:eq("+type+")").addClass("hit");
		}
		var loan = "${psearch.loanAmountIndex}";
		
		if(loan != undefined){
			$("#loan_amount a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$("#loan_amount a:eq("+loan+")").addClass("hit");
		}
		var pro = $("#province_id").val();
		
		var city = $("#citys_id").val();
		if(pro != ''){
		
			changeSelect("p",city );
		}
		var zone = $("#zones_id").val();
		if(city != ''){
			getZone(city,zone);
		}
		
	});
</script>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
	</div>

	<!--中间部分-->
	<div class="nr_main">
		<div class="nr_center">
			<div class="position">
				<div class="site">
					<i class="site_tb"></i><a href="javascript:void(0)">网站首页</a>&gt;<span>产品列表</span>
					<div class="clear"></div>
				</div>
			</div>
			<s:form commandName="psearch" id="pro_form" action="${ctx }/product/show">
				<s:hidden path="productTypeIndex" id="psearch_type_index"/>
				<s:hidden path="productType" id="psearch_producttype"/>
				<s:hidden path="loanAmountIndex" id="psearch_loan_amount"/>
				<s:hidden path="topage" id="psearch_topage"/>
			<div class="pro_ssk">
				<div class="pro_ssk_bt">
					<span>贷款产品搜索</span>
				</div>
				<div class="pro_ssk_nr">
					
						<ul>
							<li id="pro_type"><span>产品类别：</span>
								<a href="javascript:void(0)" onclick="showProductType(this , '' , 0)">不限</a>
								<c:forEach items="${producttype }" var="pt" varStatus="vs">
									<a href="javascript:void(0)" onclick="showProductType(this , '${pt.id}' , ${vs.index+1 })">${pt.name }</a>
								</c:forEach>
							<div class="clear"></div></li>
							<li id="loan_amount"><span>贷款额度：</span>
								<a href="javascript:void(0)" onclick="showLoan(this , 0)">不限</a>
								<a href="javascript:void(0)" onclick="showLoan(this , 1)">5-20万元</a>
								<a href="javascript:void(0)" onclick="showLoan(this , 2)">21-50万元</a>
								<a href="javascript:void(0)" onclick="showLoan(this , 3)">51-100万元</a>
								<a href="javascript:void(0)" onclick="showLoan(this , 4)">101-200万元</a>
								<a href="javascript:void(0)" onclick="showLoan(this , 5)">200万元以上</a>
							<div class="clear"></div></li>
							<li><span>所属地区：</span>
								<s:select path="province" class="dq_s" id="province_id" onchange="changeSelect('p' , '')">
									<s:option value="">请选择</s:option>
									<s:options items="${provinces }" itemLabel="value" itemValue="key"/>
								</s:select>
								<s:select path="city" class="dq_s" id="city_id" onchange="changeSelect('c' , '')">
									<s:option value="">请选择</s:option>
								</s:select>
								<s:hidden path="cityid" id="citys_id"/>
								<s:select path="zone" class="dq_s" id="zone_id" onchange="changeSelect('z' , this)">
									<s:option value="">请选择</s:option>
								</s:select>
								<s:hidden path="zoneid" id="zones_id"/>
							<div class="clear"></div></li>
							<li><span>所属银行：</span>
								<s:select path="bank" class="yh_s" id="psearch_bank">
									<s:option value="">请选择产品所属银行</s:option>
									<s:options items="${org}" itemLabel="value" itemValue="key"/>
								</s:select>
							<div class="clear"></div></li>
							<li><span>产品名称：</span>
								<s:input path="productName" id="psearch_productName" class="mc_t" placeholder="请输入产品名称"/>
							<div class="clear"></div></li>
							<li class="bor_none">
								<input type="button" value="立即检索" class="ss_b" onclick="proshow()"/>
								<a href="javascript:void(0)" class="qk_ss" onclick="proshowall()">全部贷款产品</a>
							<div class="clear"></div></li>
	
						</ul>
					
				</div>
			</div>
			<div class="pro_ssk">
				<div class="pro_ssk_bt">
					<span>贷款产品列表</span><span class="ssjg">共有<strong>${propage.total }</strong>款贷款产品
					</span>
				</div>
				<div class="pro_lb">
					<div class="pro_lb_bt">
						<div class="pro_bt">
							<span>产品标题</span>
						</div>
						<div class="pro_leibie">
							<span>产品类别</span>
						</div>
						<div class="pro_edu">
							<span>贷款额度</span>
						</div>
						<div class="pro_dq">
							<span>适用地区</span>
						</div>
						<div class="pro_yh">
							<span>所属银行</span>
						</div>
						<div class="pro_cz">
							<span>操作</span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="pro_lb_nr">
						<c:forEach items="${propage.data }" var="product">
						<div class="pro_lb_xq">
							<div class="pro_bt">
								<a href="javascript:void(0)">
									<c:if test="${empty product.logo}" var="flag">
										<img src="${ctx }/images1/cp_icon2.png" width="180"/>
									</c:if>
									<c:if test="${not flag }">
										<img src="${showpath}pro/${product.logo}" />
									</c:if>
									<span>产品名称：<strong>${product.name }</strong></span></a>
							</div>
							<div class="pro_leibie">
								<span>${product.productTypeName }</span>
							</div>
							<div class="pro_edu">
								<span>${product.credit }万元</span>
							</div>
							<div class="pro_dq">
								<span>${product.area }</span>
							</div>
							<div class="pro_yh">
								<span>${product.orgName }</span>
							</div>
							<div class="pro_cz">
								<a href="javascript:void(0)" class="ck_pro" onclick="document.location.href='${ctx}/product/detail?proid=${product.id }'">查看详情</a>
								<c:if test="${phone }" var="flag">
									<a href="javascript:void(0)" onclick="zxtck('${product.id }')" class="sq_pro">立即申请</a>
								</c:if>
								<c:if test="${not flag }">
									<a href="javascript:void(0)" onclick="qzxtck('${product.id }')" class="sq_pro">立即申请</a>
								</c:if>
								
							</div>
							<div class="clear"></div>
						</div>
						</c:forEach>
					</div>


				</div>
			</div>
			</s:form>
		</div>
		<div class="pagelist">
			<p:pagecommon url="${ctx }/quest/show" pageData="${propage }"></p:pagecommon>
		</div>
	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	<jsp:include page="order_fast.jsp"></jsp:include>
	
	<script type="text/javascript">
		function changePage(url , topage){
			$("#psearch_topage").val(topage);
			
			$("#pro_form").submit();
		}
		
		function changeSelect(type , val){
			switch (type) {
			case "p":
				var selected = $("#province_id option:selected").val();
				
				$("#city_id").empty();
				var option= $("<option/>");
				option.attr("value","");
				option.html("请选择");
				$("#city_id").append(option);
				$("#zone_id").empty();
				var option1= $("<option/>");
				option1.attr("value","");
				option1.html("请选择");
				$("#zone_id").append(option1);
				
				if(selected != 0){
					$.ajax({
						url:"${ctx}/get/cities?type=tc&id="+selected,
						success:function(data){
							var jsonData = eval(data);
							for(var i=0;i<jsonData.length;i++){
								var city=jsonData[i];
								option= $("<option/>");
								option.attr("value",city.key);
								option.html(city.value);
								$("#city_id").append(option);
							};
							if(val != ""){
								$("#city_id").val(val);
							}
							$("#citys_id").val(val);
						}
					});
				}
				
				break ;
			case "c":
				var selected = $("#city_id option:selected").val();
				
				$("#zone_id").empty();
				var option= $("<option/>");
				option.attr("value","");
				option.html("请选择");
				$("#zone_id").append(option);
				
				if(selected != 0){
					$("#citys_id").val(selected);
					$.ajax({
						url:"${ctx}/get/zones?type=tz&id="+selected,
						success:function(data){
							var jsonData = eval(data);
							for(var i=0;i<jsonData.length;i++){
								var zone=jsonData[i];
								option= $("<option/>");
								option.attr("value",zone.key);
								option.html(zone.value);
								$("#zone_id").append(option);
							};
							
							if(val != ""){
								$("#zone_id").val(val);
								
							}
							
							$("#zones_id").val(val);
						}
					});
				}
				break;
			case "z":
				$("#zones_id").val(val.value);
			}
		}
		
		function getZone(cval , zval){
			$("#zone_id").empty();
			var option1= $("<option/>");
			option1.attr("value","");
			option1.html("请选择");
			$("#zone_id").append(option1);
			
			if (cval != "") {
				$.ajax({
					url:"${ctx}/get/zones?type=tz&id="+cval,
					success:function(data){
						var jsonData = eval(data);
						
						for(var i=0;i<jsonData.length;i++){
							var zone=jsonData[i];
							option= $("<option/>");
							option.attr("value",zone.key);
							option.html(zone.value);
							$("#zone_id").append(option);
						};
						if(zval != ''){
							$("#zone_id").val(zval);
						}
						$("#zones_id").val(zval);
					}
				});
			}
		}
		
		function proshow(){
			$("#psearch_topage").val(0);
			$("#pro_form").submit();
		}
		
		function proshowall(){
			$("#psearch_type_index").val(0);
			$("#psearch_producttype").val("");
			$("#psearch_loan_amount").val(0);
			$("#psearch_productName").val("");
			$("#psearch_bank").val("");
			$("#province_id").val("");
			$("#city_id").val("");
			$("#citys_id").val("");
			$("#zone_id").val("");
			$("#zones_id").val("");
			$("#pro_form").submit();
		}
		function showProductType(node , id , index){
			$("#pro_type a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$(node).addClass("hit");
			$("#psearch_producttype").val(id);
			
			$("#psearch_type_index").val(index);
		}
		
		function showLoan(node , result){
			$("#loan_amount a[class]").each(function(){
				$(this).removeClass("hit");
			});
			$(node).addClass("hit");
			
			$("#psearch_loan_amount").val(result);
			
		}
		
		function zxtck(){
			if(confirm("确认要生成订单?")){
				$.ajax({
					url:'${ctx}/product/addOrder',
					data:{'productId':arguments[0]},
					type:'post',
					success:function(data){
						if(data != 'fail'){
// 							alert(data);
							alert("订单添加成功");
							document.location.href = '${ctx}/member/order/detail/applicant?id='+data;
						}else{
							alert("添加失败");
						}
					}
				});
				
			}
		}
	</script>
</body>
</html>