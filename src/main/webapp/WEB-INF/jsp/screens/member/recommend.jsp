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
		var htl = $("#recommend_member_html").html();
		
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
			url:'${ctx}/member/recommendctr/emailCredit',
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
				<input type="hidden" id="recommend_share">
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
								<span>推荐普通会员人数：</span> 
								<a href="javascript:void(0)" class="ckxq_a" onclick="${ctx }/member/list?param=member"><strong>${member.ordinaryNum }</strong> 人</a>
							</p>
							<p class="tjhyxq"><span>推荐会员奖励：</span>
								<a href="tjhy_pt_hy.html" class="ckxq_a"><strong>${member.ordinaryScore }</strong> 积分</a> 
								<a href="tjhy_pt_hy.html" class="ckxq_a"><strong>200 </strong> 元</a></p>
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
								<span>推荐信贷经理人数：</span> 
								<a href="javascript:void(0)" class="ckxq_a" onclick="${ctx }/member/list?param=credit"><strong>${credit.creditNum }</strong> 人</a>
							</p>
							<p class="tjhyxq">
								<span>推荐信贷经理奖励：</span> 
								<a href="tjhy_xd_hy.html" class="ckxq_a"><strong>${credit.creditScore } </strong> 积分</a> 
								<a href="tjhy_xd_hy.html" class="ckxq_a"><strong>20 </strong> 元</a>
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
							<li><a href="javascript:void(0)" class="fxd1" onclick="weiboShare()"><i></i><span>新浪微博</span></a></li>
							<li><a href="javascript:void(0)" class="fxd2" onclick="createCode()"><i></i><span>微信好友</span></a></li>
							<li><a href="javascript:void(0)" class="fxd3" onclick="createCode()"><i></i><span>朋友圈</span></a></li>
							<li><a href="javascript:void(0)" class="fxd4" onclick="qqShare()"><i></i><span>QQ好友</span></a></li>
							<li><a href="javascript:void(0)" class="fxd5" onclick="qqZoneShare()"><i></i><span>QQ空间</span></a></li>
							<li><a href="javascript:void(0)" class="fxd6" onclick="qqWeiboShare()"><i></i><span>腾讯微博</span></a></li>
							<li><a href="javascript:void(0)" class="fxd7" onclick="copyLink()"><i></i><span>复制链接</span></a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
			<div id="over"></div>
			<script type="text/javascript">
				var tjhy = document.getElementById("login2");
				var over = document.getElementById("over");

				function show2(node) {
					$("#recommend_share").val(node);
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
				
				function copyLink(){
					
					var v = $("#recommend_share").val();
					
					if(v == 1){
						try {
							 window.clipboardData.setData("Text",$("#recommend_member_html").html());     
							 alert("复制成功!");
						} catch (e) {
							// TODO: handle exception
							alert("您使用的浏览器不支持此复制功能，请使用Ctrl+C或鼠标右键");
						}
					}else{
						try {
							var rng = document.body.createTextRange();
							 rng.moveToElementText(document.getElementById("recommend_credit_html"));
							 rng.scrollIntoView();
							 rng.select();
							 rng.execCommand("Copy");
							 rng.collapse(false);
							 alert("复制成功!");
						} catch (e) {
							// TODO: handle exception
							alert("您使用的浏览器不支持此复制功能，请使用Ctrl+C或鼠标右键");
						}
					}
				}
				
				function weiboShare(){
					var v = $("#recommend_share").val();
					//微博网址
					var url = "http://v.t.sina.com.cn/share/share.php";
					//key
					var appKey = "2469601826";
					//分享内容
					var title = encodeURIComponent("网站");
					if(v==1){
						//分享网址
						var source = encodeURIComponent($("#recommend_member_html").html());
						
						window.open(url+"?appkey="+appKey+"&title="+title+"&url="+source,"share","toolbar=0,height=400,width=400,top=100,left=100");
					}else{
						//分享网址
						var source = encodeURIComponent($("#recommend_credit_html").html());
						
						window.open(url+"?appkey="+appKey+"&title="+title+"&url="+source,"share","toolbar=0,height=400,width=400,top=100,left=100");
					}
					
				}
				
				function qqShare(){
					var v = $("#recommend_share").val();
					var path = "http://connect.qq.com/widget/shareqq/index.html?";
					if(v==1){
						var p = {
								url:$("#recommend_member_html").html(), /*获取URL，可加上来自分享到QQ标识，方便统计*/
								desc:'', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
								title:'新越网', /*分享标题(可选)*/
								summary:'', /*分享摘要(可选)*/
								pics:'', /*分享图片(可选)*/
								flash: '', /*视频地址(可选)*/
								site:'新越网', /*分享来源(可选) 如：QQ分享*/
								style:'201',
								width:32,
								height:32
								};
						var s = "";
						for(var i in p){
							s =s+i + '=' + encodeURIComponent(p[i]||'')+"&";
						}
						window.open(path+s, "QQshare","toolbar=0,scrollbars=no,height=600,width=900,top=100,left=100");
					}else{
						var p = {
								url:$("#recommend_credit_html").html(), /*获取URL，可加上来自分享到QQ标识，方便统计*/
								desc:'', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
								title:'新越网', /*分享标题(可选)*/
								summary:'', /*分享摘要(可选)*/
								pics:'', /*分享图片(可选)*/
								flash: '', /*视频地址(可选)*/
								site:'新越网', /*分享来源(可选) 如：QQ分享*/
								style:'201',
								width:32,
								height:32
								};
						var s = "";
						for(var i in p){
							s =s+i + '=' + encodeURIComponent(p[i]||'')+"&";
						}
						window.open(path+s, "QQshare","toolbar=0,scrollbars=no,height=600,width=900,top=100,left=100");
					}
				}

				function qqZoneShare(){
					var v = $("#recommend_share").val();
					var path = "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?";
					
					if(v == 1){
						var p = {
								url:$("#recommend_member_html").html(),
//								showcount:'0',/*是否显示分享总数,显示：'1'，不显示：'0' */
								desc:'测试分享理由',/*默认分享理由(可选)*/
								summary:'测试分享摘要',/*分享摘要(可选)*/
								title:'测试',/*分享标题(可选)*/
								site:'新越网',/*分享来源 如：腾讯网(可选)*/
//								pics:'', /*分享图片的路径(可选)*/
//								style:'201',
//								width:39,
//								height:39
								};
						var s = "";
						for(var i in p){
							s =s+i + '=' + encodeURIComponent(p[i]||'')+"&";
						}
						window.open(path+s, "QQZoneShare","toolbar=0,scrollbars=no,height=600,width=900,top=100,left=100");
					}else{
						var p = {
								url:$("#recommend_credit_html").html(),
//								showcount:'0',/*是否显示分享总数,显示：'1'，不显示：'0' */
								desc:'测试分享理由',/*默认分享理由(可选)*/
								summary:'测试分享摘要',/*分享摘要(可选)*/
								title:'测试',/*分享标题(可选)*/
								site:'新越网',/*分享来源 如：腾讯网(可选)*/
//								pics:'', /*分享图片的路径(可选)*/
//								style:'201',
//								width:39,
//								height:39
								};
						var s = "";
						for(var i in p){
							s =s+i + '=' + encodeURIComponent(p[i]||'')+"&";
						}
						window.open(path+s, "QQZoneShare","toolbar=0,scrollbars=no,height=600,width=900,top=100,left=100");
					}
				}

				function qqWeiboShare(){
					var v = $("#recommend_share").val();
					var _url;
					if(v==1){
						_url = encodeURIComponent($("#recommend_member_html").html());
					}else{
						_url = encodeURIComponent($("#recommend_credit_html").html());
					}
					var _assname = encodeURI("2740293039");//你注册的帐号，不是昵称
					var _appkey = encodeURI("101204626");//你从腾讯获得的appkey
					var _pic = encodeURI('');//（例如：var _pic='图片url1|图片url2|图片url3....）
					var _t = '测试标题';//标题和描述信息
					var metainfo = document.getElementsByTagName("meta");
					for(var metai = 0;metai < metainfo.length;metai++){
						if((new RegExp('description','gi')).test(metainfo[metai].getAttribute("name"))){
							_t = metainfo[metai].attributes["content"].value;
						}
					}
					_t =  "测试内容";//请在这里添加你自定义的分享内容
					if(_t.length > 120){
						_t= _t.substr(0,117)+'...';
					}
					_t = encodeURI(_t);

					var _u = 'http://share.v.t.qq.com/index.php?c=share&a=index&url='+_url+'&appkey='+_appkey+'&assname='+_assname+'&title='+_t;
					window.open( _u,'', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );

				}
				
				function createCode(){
					var v = $("#recommend_share").val();
					var param;
					if(v==1){
						param = JSON.stringify($("#recommend_member_html").html());
					}else{
						param = JSON.stringify($("#recommend_credit_html").html());
					}
					$.ajax({
						url:'${ctx}/credit/memberctr/createCode',
						type:'post',
						dataType:'json',
						contentType:'application/json',
						data:param,
						success:function(data){
							if(data != 'fail'){
								alert("分享成功");
							}else{
								alert("分享失败");
							}
						}
					});
				}
			</script>

		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>

</body>
</html>