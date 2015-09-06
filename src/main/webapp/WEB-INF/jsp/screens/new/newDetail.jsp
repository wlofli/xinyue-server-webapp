<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>新越网新闻详情页面</title>
</head>
<%@include file="../../common/common.jsp" %>
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/jquery.jslides.css" media="screen" />
<script src="../js/tab.js" runat="server" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/jquery.jslides.js"></script>
<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
</div>
<!--中间部分-->
<div class="nr_main">
<div class="nr_center">
<div class="position">
<div class="site"><i class="site_tb"></i><a href="${ctx }/new/homelist">网站首页</a>&gt;
<a href="${ctx }/new/list?typeId=${news.newType}" class="a">新闻列表</a>&gt;<span>新闻详情</span><div class="clear"></div></div>
</div>

</div>
<div class="pro_xq">
<div class="pro_xq_left">
<div class="new_xq_bt"><span>${news.title }</span></div>
<div class="new_xq_zs"><span><fmt:formatDate value="${news.sendDate }" pattern="yyyy-MM-dd h:m"/>${news.compositionSource }</span></div>
<div class="new_xq_nr">
${news.newContent }

<div class="fx_new"><span>分享到：</span>
<div class="bshare-custom icon-medium">
<div class="bsPromo bsPromo2"></div>
<script>
function weiboShare(){
	//微博网址
	var url = "http://v.t.sina.com.cn/share/share.php";
	//key
	var appKey = "2469601826";
	//分享内容
	var title = encodeURIComponent("新越网新闻");
	//分享网址
	var source = encodeURIComponent("http://v.youku.com/v_show/id_XMTI5NjY0NDc5Ng==.html?from=y1.3-ent-grid-196-10080.88558.1-1");
	
	window.open(url+"?appkey="+appKey+"&title="+title+"&url="+source,"share","toolbar=0,height=400,width=400,top=100,left=100");
}

function qqShare(){
	var path = "http://connect.qq.com/widget/shareqq/index.html?";
	var p = {
			url:'www.91loan.cn', /*获取URL，可加上来自分享到QQ标识，方便统计*/
			desc:'', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
			title:'测试', /*分享标题(可选)*/
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

function qqZoneShare(){
	var path = "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?";
	var p = {
			url:'http://www.91loan.cn/moke/site/reg',
//			showcount:'0',/*是否显示分享总数,显示：'1'，不显示：'0' */
			desc:'测试分享理由',/*默认分享理由(可选)*/
			summary:'测试分享摘要',/*分享摘要(可选)*/
			title:'测试',/*分享标题(可选)*/
			site:'新越网',/*分享来源 如：腾讯网(可选)*/
//			pics:'', /*分享图片的路径(可选)*/
//			style:'201',
//			width:39,
//			height:39
			};
	var s = "";
	for(var i in p){
		s =s+i + '=' + encodeURIComponent(p[i]||'')+"&";
	}
	window.open(path+s, "QQZoneShare","toolbar=0,scrollbars=no,height=600,width=900,top=100,left=100");
}

function qqWeiboShare(){
		var _url = encodeURIComponent("www.91loan.cn");
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
// 	alert("in");
		var param = "www.baidu.com";
		$.ajax({
			url:'${ctx}/member/recommendctr/createCode?url=' + param,
			type:'post',
			dataType:'json',
			contentType:'application/json',
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


<script type="text/javascript">
// (function(){
// var p = {
// url:location.href, /*获取URL，可加上来自分享到QQ标识，方便统计*/
// desc:'', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
// title:'', /*分享标题(可选)*/
// summary:'', /*分享摘要(可选)*/
// pics:'', /*分享图片(可选)*/
// flash: '', /*视频地址(可选)*/
// site:'', /*分享来源(可选) 如：QQ分享*/
// style:'201',
// width:32,
// height:32
// };
// var s = [];
// for(var i in p){
// s.push(i + '=' + encodeURIComponent(p[i]||''));
// }
// document.write(['<a class="qcShareQQDiv" href="http://connect.qq.com/widget/shareqq/index.html?',s.join('&'),'" target="_blank">分享到QQ</a>'].join(''));
// })();
</script>
<script src="http://connect.qq.com/widget/loader/loader.js" widget="shareqq" charset="utf-8"></script>
<a title="分享到QQ空间" href="javascript:void(0)" class="bshare-qzone" onclick="qqZoneShare()"></a>
<a title="分享到新浪微博" href="javascript:void(0)" class="bshare-sinaminiblog" onclick="weiboShare()"></a>
<a title="分享到腾讯微博" href="javascript:void(0)" class="bshare-qqmb" onclick="qqWeiboShare()"></a>
<a title="分享到微信" href="javascript:void(0)" class="bshare-weixin"  onclick="createCode()"></a>
<a title="分享到QQ好友" href="javascript:void(0)" class="bshare-qqim" onclick="qqShare()"></a>
<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span style="float: none;" class="BSHARE_COUNT bshare-share-count">0</span></div>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script></div>




<div class="clear"></div>
</div>
<div class="new_link">
<p><span>上一篇：</span><a href="${ctx }/new/detail?id=${before.key}">${before.value }</a></p>
<p><span>下一篇：</span><a href="${ctx }/new/detail?id=${after.key}">${after.value }</a></p>
</div>
</div>

<jsp:include page="../../common/right_detail.jsp"></jsp:include>

<div class="clear"></div>
</div>
</div>
<!--中间部分-->
<jsp:include page="../../common/foot_main.jsp" />
</body>
</html>
