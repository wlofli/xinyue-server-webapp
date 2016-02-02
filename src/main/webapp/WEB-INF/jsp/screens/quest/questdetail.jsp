<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网问答详情页面</title>
<%@ include file="../../common/common.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	function sthdk() {
		$("#hdk").slideToggle("slow");
	}
	
	function commitAnswer(node){
		$.ajax({
			url:'${ctx}/quest/addAnswer',
			type:'post',
			data:$("#detail_answer_form").serialize(),
			success:function(data){
				if(data == 'success'){
					alert("保存成功");
					document.location.href='${ctx}/quest/detail?questid='+node;
				}else{
					alert("保存失败");
				}
			}
		});
	}
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
					<i class="site_tb"></i>
					<a href="javascript:void(0)">网站首页</a>&gt;
					<a href="javascript:void(0)" class="a" onclick="document.location.href='${ctx}/quest/show'">问答列表</a>&gt;<span>问答详情</span>
					<div class="clear"></div>
				</div>
			</div>

		</div>
		<div class="pro_xq">
			<div class="pro_xq_left">
				<div class="wt_ms">
					<p class="wt_ms_bt">
						<i>问</i><span>${recommendquest.title }</span>
					</p>
					<p class="wt_ms_xx">
						<span>提问者：
						<c:choose>
							<c:when test="${empty recommendquest.mqcreateName }">匿名</c:when>
							<c:otherwise>${recommendquest.mqcreateName } </c:otherwise>
						</c:choose>
						</span>
						<span>问题来自：${recommendquest.address }</span><span>时间：${recommendquest.qtime }</span>
					</p>
					<p class="wt_ms_nr">${recommendquest.content }</p>
					<div class="fx">
						<a href="javascript:sthdk()" class="hd_btn">我要回答</a>
						<div class="fx_right">
							<span class="fx_right_span">分享到：</span>
							<div class="bshare-custom icon-medium">
								<div class="bsPromo bsPromo2"></div>
								<a title="分享到新浪微博" class="bshare-sinaminiblog" href="javascript:void(0);" onclick="weiboShare()"></a> 
								<a title="分享到腾讯微博" class="bshare-qqmb" href="javascript:void(0);" onclick="qqWeiboShare()"></a> 
								<a title="分享到朋友网" class="bshare-qqxiaoyou" href="javascript:void(0);" onclick="createCode()"></a> 
								<a title="分享到微信" class="bshare-weixin" href="javascript:void(0);" onclick="createCode()"></a>
								<a title="分享到QQ好友" class="bshare-qqim" href="javascript:void(0);" onclick="qqShare()"></a> 
								
							</div>
							<script type="text/javascript" charset="utf-8"
								src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
							<script type="text/javascript" charset="utf-8"
								src="http://static.bshare.cn/b/bshareC0.js"></script>
						</div>

					</div>
					<div class="hd_form" id="hdk">
						<s:form commandName="answer" method="post" action="" id="detail_answer_form">
							<s:textarea path="acontent" class="hd_txt"/>
							<s:hidden path="questid" value="${recommendquest.id }"/>
							
							<input type="button" onclick="commitAnswer('${recommendquest.id}')" value="提交答案" class="tj_da_btn"/>
							<s:hidden path="createid" id="answer_createid"/>
							<span class="nm_span">匿名</span>
							<input type="checkbox" onclick="checkedCreate(this.checked)" class="ch1"/>
						</s:form>
					</div>
					<div class="clear"></div>
				</div>
				<c:if test="${recommendquest.recommend == '1' }">
					<div class="tjhd_mk">
						<div class="bt">
							<span>推荐回答</span>
						</div>
						<div class="tjhd_nr">
							<p>${recommendquest.acontent }</p>
							<p class="hdzxx">回答者：<c:if test="${recommendquest.atype eq 'n' || empty recommendquest.atype}">匿名</c:if>
													<c:if test="${recommendquest.atype eq 'm'}">${recommendquest.mcreateName }</c:if>
													<c:if test="${recommendquest.atype eq 'c' }">${recommendquest.ccreateName }</c:if> &nbsp;回答时间：${recommendquest.atime }</p>
						</div>
					</div>
				</c:if>
				<c:if test="${fn:length(questdetail)>0 }">
					<div class="qt_hd">
						<div class="qthd_bt">
							<span>其他答案</span>
						</div>
						<c:forEach items="${questdetail }" var="detail">
							<div class="qthd_nr">
								<p class="hd_nr">${detail.acontent }</p>
								<p class="hdzxq">回答者：<c:if test="${detail.atype eq 'n' || empty detail.atype}">匿名</c:if>
													<c:if test="${detail.atype eq 'm'}">${detail.mcreateName }</c:if>
													<c:if test="${detail.atype eq 'c' }">${detail.ccreateName }</c:if> &nbsp;回答时间：${detail.atime }</p>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${fn:length(relevant)>0 }">
					<div class="qt_hd">
					<div class="qthd_bt">
						<span>其他相关问题</span>
					</div>
					<div class="xs_wt_lb">
						<ul>
							<c:forEach items="${relevant }" var="rel">
								<c:choose>
									<c:when test="${rel.id == recommendquest.id }">
									</c:when>
									<c:otherwise>
										<li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/detail?questid=${rel.id }'">${rel.title }</a></li>
									</c:otherwise>
								</c:choose>	
								
							</c:forEach>
						</ul>
					</div>
				</div>
				</c:if>
				
			</div>
			<div class="pro_xq_right">
				<jsp:include page="questcommon.jsp"></jsp:include>
			</div>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot.jsp"%>
	<script type="text/javascript">
		
		function checkedCreate(node , c){
			if(node){
				$("#answer_createid").val(0);
			}
		}
		//新浪
		function weiboShare(){
			//微博网址
			var url = "http://v.t.sina.com.cn/share/share.php";
			//key
			var appKey = "2469601826";
			var htl = window.location.href;
			//分享内容
			var title = encodeURIComponent(htl);
			
			var source = encodeURIComponent(htl);
				
			window.open(url+"?appkey="+appKey+"&title="+title+"&url="+source,"share","toolbar=0,height=400,width=400,top=100,left=100");
			
			
		}
		//qq
		function qqWeiboShare(){
			var _url = window.location.href;
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
		//朋友
		function createCode(){
			
			$.ajax({
				url:'${ctx}/member/recommendctr/createCode',
				type:'post',
				dataType:'json',
				contentType:'application/json',
				data:JSON.stringify(window.location.href),
				success:function(data){
					if(data != 'fail'){
// 						alert(data);
// 						alert("分享成功");
					}else{
						alert("分享失败");
					}
				}
			});
		}
		//qq
		function qqShare(){
			var path = "http://connect.qq.com/widget/shareqq/index.html?";
			
			var p = {
					url:window.location.href, /*获取URL，可加上来自分享到QQ标识，方便统计*/
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
	</script>
</body>
</html>