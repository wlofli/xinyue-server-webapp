<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-推荐会员</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">

function sendMessage(node){
	if(node == 0){
		var htl = $("#recommend_member_html").html();
		var tel = $("#recommend_member_tel").val();
		
		var t = /^1[3587][0-9]+\d{8}$/;
		if(!t.test(tel)){
			alert("手机号码格式不对");
			return;
		}
		$("#recommend_member_link").val(htl);
		$.ajax({
			url:'${ctx}/member/recommendctr/telMember',
			data:$("#recommend_member").serialize(),
			type:'post',
			success:function(data){
				if(data == "success"){
					alert("发送成功");
				}else{
					alert("发送失败");
				}
			}
		});
	}else{
		var htl = $("#recommend_credit_html").html();
		var tel = $("#recommend_credit_tel").val();
		
		var t = /^1[3587][0-9]+\d{8}$/;
		if(!t.test(tel)){
			alert("手机号码格式不对");
			return;
		}
		$("#recommend_credit_link").val(htl);
		$.ajax({
			url:'${ctx}/member/recommendctr/telCredit',
			data:$("#recommend_credit").serialize(),
			type:'post',
			success:function(data){
				if(data == "success"){
					alert("发送成功");
				}else{
					alert("发送失败");
				}
			}
		});
	}
}

function sendEmail(node){
	if(node == 0){
		var htl = $("#recommend_member_email").html();
		
		var email = $("#recommend_member_email").val();
		var t = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
		if(!t.test(email)){
			alert("邮件格式不对");
			return;
		}
		$("#recommend_member_link").val(htl);
		$.ajax({
			url:'${ctx}/member/recommendctr/emailMember',
			data:$("#recommend_member").serialize(),
			type:'post',
			success:function(data){
				if(data == "success"){
					alert("发送成功");
				}else{
					alert("发送失败");
				}
			}
		});
	}else{
		var htl = $("#recommend_credit_html").html();
		
		var email = $("#recommend_credit_email").val();
		var t = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
		if(!t.test(email)){
			alert("邮件格式不对");
			return;
		}
		$("#recommend_credit_link").val(htl);
		$.ajax({
			url:'${ctx}/member/recommendctr/emailMember',
			data:$("#recommend_credit").serialize(),
			type:'post',
			success:function(data){
				if(data == "success"){
					alert("发送成功");
				}else{
					alert("发送失败");
				}
			}
		});
	}
}
</script>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="tree.jsp"%>
			<div class="hy_right">
				<div class="hy_right_bt">
					<span>推荐会员</span>
				</div>
				<div class="tab">
					<div class="tjhy_tab" style="border-right: 1px #e0e0e0 solid;">
						<s:form commandName="member" method="post" action="${ctx }" id="recommend_member">
							<s:hidden path="ordinaryLink" id="recommend_member_link"/>
							<p class="qiye_bt">
								<strong>推荐普通会员</strong>
							</p>
							<p>
								<span>A：推荐链接</span><span class="tjhy_s2" id="recommend_member_html">${member.ordinary }${code }</span><a
									class="tj_btn" onclick="javascript:show2()">分享</a>
							</p>
							<p>
								<span>B：手机短信</span>
								<s:input path="ordinaryTel" class="t1" id="recommend_member_tel"/>
								<a href="javascript:void(0)" class="tj_btn" onclick="sendMessage(0)">发送短信</a>
							</p>
							<p>
								<span>C：E-mail推荐</span>
								<s:input path="ordinaryEmail" class="t1" id="recommend_member_email"/>
								<a href="javascript:void(0)" class="tj_btn" onclick="sendEmail(0)">发送邮件</a>
							</p>
							<p class="tjhyxq b_t_20">
								<span>推荐普通会员人数：</span><span class="tjrs"><strong>${member.ordinaryNum }</strong>人</span><a
									href="javascript:void(0)" class="ckxq_a">查看详情</a>
							</p>
							<p class="tjhyxq">
								<span>推荐会员奖励：</span><span class="tjrs"><strong>${member.ordinaryScore }</strong>分</span><a
									href="javascript:void(0)" class="ckxq_a">查看详情</a>
							</p>
						</s:form>
					</div>
					<div class="tjhy_tab">
						<s:form commandName="credit" method="post" action="${ctx }" id="recommend_credit">
							<s:hidden path="creditLink" id="recommend_credit_link"/>
							<p class="qiye_bt">
								<strong>推荐信贷经理</strong>
							</p>
							<p>
								<span>A：推荐链接</span><span class="tjhy_s2" id="recommend_credit_html">${credit.credit }${code }</span><a
									class="tj_btn" onclick="javascript:show2()">分享</a>
							</p>
							<p>
								<span>B：手机短信</span>
								<s:input path="creditTel" class="t1" id="recommend_credit_tel"/>
								<a href="javascript:void(0)" class="tj_btn" onclick="sendMessage(1)">发送短信</a>
							</p>
							<p>
								<span>C：E-mail推荐</span>
								<s:input path="creditEmail" class="t1" id="recommend_credit_email"/>
								<a href="javascript:void(0)" class="tj_btn" onclick="sendEmail(1)">发送邮件</a>
							</p>
							<p class="tjhyxq b_t_20">
								<span>推荐信贷经理人数：</span><span class="tjrs"><strong>${credit.creditNum }</strong>人</span><a
									href="javascript:void(0)" class="ckxq_a">查看详情</a>
							</p>
							<p class="tjhyxq">
								<span>推荐信贷经理奖励：</span><span class="tjrs"><strong>${credit.creditScore }</strong>分</span><a
									href="javascript:void(0)" class="ckxq_a">查看详情</a>
							</p>
						</s:form>
					</div>
					<div class="clear"></div>
					<p class="tjhyxq"
						style="margin-top: 30px; height: auto; line-height: 30px;">
						<span class="bt">推荐会员奖励措施:</span> 1、推荐会员注册可以得积分<br />2、您推荐注册的会员充值/贷款成功后您还可以得到额外的收入！
					</p>
				</div>
			</div>

			<div id="login2">
				<div class="login1">
					<div class="bt">
						<h1>分享到</h1>
						<a href="javascript:hide2()"><img src="../images/close.png" /></a>
						<div class="clear"></div>
					</div>
					<div class="fx_nr">
						<ul>
							<li><a href="#" class="fxd1"><i></i><span>新浪微博</span></a></li>
							<li><a href="#" class="fxd2"><i></i><span>微信好友</span></a></li>
							<li><a href="#" class="fxd3"><i></i><span>朋友圈</span></a></li>
							<li><a href="#" class="fxd4"><i></i><span>QQ好友</span></a></li>
							<li><a href="#" class="fxd5"><i></i><span>QQ空间</span></a></li>
							<li><a href="#" class="fxd6"><i></i><span>腾讯微博</span></a></li>
							<li><a href="#" class="fxd7"><i></i><span>复制链接</span></a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
			<div id="over"></div>
			<script type="text/javascript">
				var tjhy = document.getElementById("login2");
				var over = document.getElementById("over");

				function show2() {
					tjhy.style.display = "block";
					over.style.display = "block";
				}
				function hide2() {
					tjhy.style.display = "none";
					over.style.display = "none";
				}

				$(document).ready(function() {
					$(".xgsjh").click(function() {
						$(".sjxg").slideToggle("slow");
					});
				});
			</script>

		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>

</body>
</html>