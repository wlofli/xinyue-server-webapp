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
					<i class="site_tb"></i><a href="javascript:void(0)">网站首页</a>&gt;<a
						href="javascript:void(0)" class="a" onclick="${ctx}/quest/show">问答列表</a>&gt;<span>问答详情</span>
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
						<span>提问者：${recommendquest.name } </span>
						<span>问题来自：${recommendquest.address }</span><span>时间：${recommendquest.qtime }</span>
					</p>
					<p class="wt_ms_nr">${recommendquest.content }</p>
					<div class="fx">
						<a href="javascript:sthdk()" class="hd_btn">我要回答</a>
						<div class="fx_right">
							<span class="fx_right_span">分享到：</span>
							<div class="bshare-custom icon-medium">
								<div class="bsPromo bsPromo2"></div>
								<a title="分享到新浪微博" class="bshare-sinaminiblog"></a> <a
									title="分享到腾讯微博" class="bshare-qqmb"></a> <a title="分享到朋友网"
									class="bshare-qqxiaoyou" href="javascript:void(0);"></a> <a
									title="分享到微信" class="bshare-weixin" href="javascript:void(0);"></a>
								<a title="分享到QQ好友" class="bshare-qqim"
									href="javascript:void(0);"></a> <a title="更多平台"
									class="bshare-more bshare-more-icon more-style-addthis"></a><span
									style="float: none;" class="BSHARE_COUNT bshare-share-count">0</span>
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
							<s:hidden path="createid" id="answer_createid_${recommendquest.id} }"/>
							<span class="nm_span">匿名</span>
							<input type="checkbox" onclick="javascript:$('#answer_createid_${recommendquest.id }').val(this.checked?'0':'${answer.createid }')" class="ch1"/>
						</s:form>
					</div>
					<div class="clear"></div>
				</div>
				<c:if test="${not empty recommendquest.atime }">
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
							<c:forEach items="relevant" var="rel">
								<li><a href="javascript:void(0)">${rel.title }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				</c:if>
				
			</div>
			<div class="pro_xq_right">

				<div class="wd_fl">
					<div class="wd_bt">
						<span>问答分类</span>
					</div>
					<s:form commandName="qbean" method="post" action="${ctx }/quest/show" id="quest_detail_form">
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
				<div class="rm_zx">
					<div class="zx_bt">
						<span>热门问答</span><a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/show'">更多&gt;</a>
						<div class="clear"></div>
					</div>
					<div class="zx_lb">
						<ul>
							<c:forEach items="${questlist }" var="quest">
								<Li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/quest/detail?questid=${quest.id }'">${quest.title }</a></Li>
							</c:forEach>
						</ul>
					</div>

				</div>
				<div class="ad_mk1">
					<a href="#"> <img src="${ctx }/images1/ad1.jpg" /></a>
				</div>

			</div>
			<div class="clear"></div>
		</div>

	</div>
	<!--中间部分-->
	<%@ include file="../../common/foot.jsp"%>
	<script type="text/javascript">
		function show(){
			if(arguments.length == 0){
				$("#quest_detail_form").submit();
			}else{
				$("#quest_questype").val($(arguments[0]).html());
				$("#quest_detail_form").submit();
			}
		}
		
	</script>
</body>
</html>