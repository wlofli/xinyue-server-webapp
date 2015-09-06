<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网提问页面</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
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
					<i class="site_tb"></i><a href="javascript:void(0)">网站首页</a>&gt;<span>我要提问</span>
					<div class="clear"></div>
				</div>
			</div>

		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="pro_xq_left_bt">
					<span>我要提问</span>
				</div>
				<div class="tw_index">
					<s:form commandName="qmodel" method="post" action="" id="ask_form">
						<s:hidden path="orgid"/>
						<p class="tw_p1">
							<i>Q</i><span class="bt">一句话描述您的问题</span><span class="hdz">共有<strong>${manager }</strong>位信贷经理为您在线解答
							</span>
						</p>
						<s:textarea path="title" class="wt_ms" id="ask_title" placeholder="最多可输入50个字"/>
						<p class="zc_zs" id="ask_title_error"> *输入内容不能为空  </p>
						<p class="tw_p1">
							<span class="bt">详细描述(选填)</span><span class="hdz">详细描述有助于获得准确答案</span>
						</p>
						<s:textarea path="content" class="wt_bc" placeholder="最多可输入150个字"/>
						<p class="bd_p1">
							<span>所在城市(必填)：</span>
							<s:select path="province" class="bdp1_s" id="ask_province" onchange="changeSelect()">
								<s:option value="">请选择</s:option>
								<s:options items="${province }" itemLabel="value" itemValue="key" />
							</s:select>
							<s:select path="city" class="bdp1_s" id="ask_city" required="true">
								<s:option value="">请选择</s:option>
							</s:select>
						</p>
						<p class="bd_p1">
							<span>常用邮箱(必填)：</span><s:input path="email" type="email" class="bdp1_t required"/><i>用于接收问题回复</i>
						</p>
						<p class="bd_p1">
							<span>手机号码：</span><s:input path="telphone" class="bdp1_t" type="mobile"/><i>必要时给您电话答疑</i>
						</p>
						<p class="bd_p1">
							<span>验证码：</span>
							<input id="checkCode" value="" class="bdp1_t" name="checkC" />
							<a href="javascript:void(0)" onClick="document.getElementById('aucode').src='${ctx}/imgauthcode?'+getSec()">
								<img id="aucode" border="0" class="yzm" src="${ctx}/imgauthcode" />
							</a>
						</p>
						<p class="bd_p2">
							<input type="button" class="tiwen_btn" value="提交问题" onclick="save()"/>
						</p>
					</s:form>
				</div>
			</div>
			<div class="pro_xq_right">

				<div class="wd_fl">
					<div class="wd_bt">
						<span>问答分类</span>
					</div>
					<s:form commandName="qbean" method="post" action="${ctx }/quest/show" id="quest_ask_form">
						<s:hidden path="questype" id="quest_questype"/>
					</s:form>
					<div class="wd_lb">
						<dl class="wd_fl1">
							<dt>
								<span>按贷款知识分类</span>
							</dt>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">常用知识</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">贷款流程</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">资质咨询</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">利息咨询</a>
							</dd>
							<div class="clear"></div>
						</dl>
						<dl class="wd_fl2">
							<dt>
								<span>按产品类型分类</span>
							</dt>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">抵押贷款</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">无抵押贷款</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">按揭贷款</a>
							</dd>
							<div class="clear"></div>
						</dl>
						<dl class="wd_fl3">
							<dt>
								<span>按贷款类型分类</span>
							</dt>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">消费贷款</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">经营贷款</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">买车贷款</a>
							</dd>
							<dd>
								<a href="javascript:void(0)" onclick="show(this)">买房贷款</a>
							</dd>
							<div class="clear"></div>
						</dl>
					</div>

				</div>

				<div class="ad_mk1">
					<a href="javascript:void(0)"> <img src="${ctx }/images1/ad1.jpg" /></a>
				</div>

			</div>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot_main.jsp"%>
	<script type="text/javascript">
		function show(){
			if(arguments.length == 0){
				$("#quest_ask_form").submit();
			}else{
				$("#quest_questype").val($(arguments[0]).html());
				$("#quest_ask_form").submit();
			}
		}
		
		function changeSelect(val){
			var selected = $("#ask_province option:selected").val();
			
			$("#ask_city").empty();
			var option= $("<option/>");
			option.attr("value","");
			option.html("请选择");
			$("#ask_city").append(option);
			if(selected != ""){
				$.ajax({
					url:"${ctx}/get/cities?type=tc&id="+selected,
					success:function(data){
						var jsonData = eval(data);
						for(var i=0;i<jsonData.length;i++){
							var city=jsonData[i];
							option= $("<option/>");
							option.attr("value",city.key);
							option.html(city.value);
							$("#ask_city").append(option);
						};
						if(val != ""){
							$("#ask_city").val(val);
						}
					}
				});
			}
			
		}
		
		
		$(function(){
			$("#ask_form").validate({
				rules:{
					checkC:{
						required:true,
						remote:{
							type: "post",
		                    url: "${ctx}/login/check/code",
		                    data:{
		                    	checkCode: function(){return $("#checkCode").val();}
		                    }
						}
					}
				},
				messages: {
					checkC:{
						required:"<span class='zc_zs'>* 请输入验证码</span>",
						remote:"<span class='zc_zs'>* 验证码不正确</span>"
					}
				},
				errorPlacement: function(error, element) {
					error.appendTo(element.parent());
				},
			});
			
			var message = "${message}";
			if (message != "" && message != null) {
				alert(message);
			}
		});
		
		function save(){
			if($("#ask_title").val() == ''){
				$("#ask_title_error").css("display" , "block");
				return;
			}else{
				$("#ask_title_error").css("display" , "none");
			}
			if($("#ask_form").valid()){
				$.ajax({
					url:'${ctx}/quest/addQuest',
					type:'post',
					data:$("#ask_form").serialize(),
					success:function(data){
						if(data == 'success'){
							alert("提问成功");
						}else{
							alert("提问失败");
						}
					}
				});
			}
		}
		
		function getSec(){
			var myDate = new Date();
			return myDate.getTime();
		}
	</script>
</body>
</html>