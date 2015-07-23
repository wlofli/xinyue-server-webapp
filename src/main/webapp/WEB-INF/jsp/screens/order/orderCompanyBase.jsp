<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/My97DatePicker.4.8/WdatePicker.js"></script>
<script src="../js/tab.js" runat="server" type="text/javascript"></script>
<script type="text/javascript" runat="server" src="../js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(".left_nav .f_nav li #a").click(function(){ 
		$(this).parent().find('.f_nav_ful').removeClass("menu_chioce");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('.f_nav_ful').slideToggle();
		$(this).parent().find('.f_nav_ful').addClass("menu_chioce");
	});
})

</script>
</head>

<body class="h_bj">
<div class="container">
<div class="header">
<div class="h_bar">
<div class="h_b_left"><h1>400-860-9280</h1><span>（工作日：9:00-17:30）</span>
<span>
<a href="#" class="fx_xl" onmouseover="show('xlfx')" onmouseout="hid('xlfx')"></a>
<img src="../images/fx_xl.png" id="xlfx"/>
</span>
<span>
<a href="#" class="fx_wx" onmouseover="show('wxfx')" onmouseout="hid('wxfx')"></a>
<img src="../images/fx_wx.png" id="wxfx"/>
</span>
<span>
<a href="#" class="fx_qq" onmouseover="show('qqfx')" onmouseout="hid('qqfx')"></a>
<img src="../images/fx_qq.png" id="qqfx"/>
</span>
</div>
<div class="h_b_right">
<ul class="dlz">
<li><span>您好，</span><a href="index_hy.html">刘小小</a><span>|</span></li>
<li><a href="dkdd_hy.html">我的贷款订单</a><span>|</span></li>
<li><a href="login_pt.html">退出</a></li>
</ul>
</div>
<div class="clear"></div>
</div>
<div class="h_logo">
<div class="h_l_left">
<a href="#"><img src="../images/logo.jpg" /></a>
</div>
<div class="h_l_right">
<ul>
<li class="hit"><a href="#">首页</a></li>
<li><a href="#">贷款产品</a></li>
<li><a href="#">融资机构</a></li>
<li><a href="#">信贷经理</a></li>
<li><a href="#">新闻资讯</a></li>
<li><a href="#">帮助中心</a></li>
<li><a href="#">问答中心</a></li>
<li class="clear"></li>
</ul>
</div>
<div class="clear"></div>
</div>
</div>
<div class="hy_i_center">
<div class="position">
<span>当前位置：</span><a href="#">网站首页</a>-<span>会员中心</span>
</div>
<div class="left_nav">
<ul class="f_nav">
<li class="f_nav_head"><span>会员中心首页</span></li>
<li><a id="a" href="index_hy.html">我的主页</a></li>
<li><a id="a">基本信息设置</a>
<ul class="f_nav_ful">
<li><a href="jbxx_hy.html">基本信息</a></li>
<li><a href="xgmm_hy.html">修改密码</a></li>
<li><a href="sjyz_hy.html">手机验证</a></li>
</ul>
</li>
<li><a id="a" href="smrz_hy.html">实名认证</a></li>
<li class="hit"><a id="a">贷款订单</a>
<ul class="f_nav_ful">
<li><a href="dkdd_hy.html">贷款订单列表</a></li>
<li><a href="dkdd1_hy.html">贷款订单图表</a></li>
</ul>
</li>
<li><a id="a" href="qyda_hy.html">企业档案</a></li>
<li><a id="a" href="xyxz_hy.html">下载中心</a></li>
<li><a id="a">收藏管理</a>
<ul class="f_nav_ful">
<li><a href="scgl_hy.html">产品收藏</a></li>
<li><a href="scgl1_hy.html">机构收藏</a></li>
</ul>
</li>
<li><a id="a">分享推荐会员</a>
<ul class="f_nav_ful">
<li><a href="tjhy_hy.html">推荐会员</a></li>
<li><a href="tjhy_pt_hy.html">推荐普通会员列表</a></li>
<li><a href="tjhy_xd_hy.html">推荐信贷经理列表</a></li>
</ul>
</li>
<li><a id="a">推荐奖励提现</a>
<ul class="f_nav_ful">
<li><a href="tjjltx_hy.html">推荐奖励记录</a></li>
<li><a href="tjjltx1_hy.html">推荐奖励提现</a></li>
<li><a href="sdskzh_hy.html">申请提现</a></li>
</ul>
</li>
<li><a id="a" href="wdgl_hy.html">问答管理</a></li>

</ul>
</div><div class="hy_right">
<div class="ddxq_top">
<div class="ddlc"><Img src="../images/order_zt_bj4.png" /></div>
<div class="ddxq_nr">
<span>订单号:<strong>20154589620</strong></span>
<span>订单提交时间:<strong>2015-01-12</strong></span>
<span>申请人姓名:<strong>20154589620</strong></span>
<span>联系方式:<strong>18868146059</strong></span>
<span>产品名称:<a href="#">税贷通</a></span>
<span>产品所属机构:<strong>杭州银行</strong></span>
<span>企业名称:<strong>杭州摩科商用设备有限公司</strong></span>
<span>所在地区:<strong>浙江省杭州市西湖区</strong></span>
</div>
</div>
<div class="hy_right_bt">
<ul class="menu1" id="menu">
<li class=""><a href="ddxq_hy.html">申请人信息</a></li>
<li class="hit"><a href="ddxq_hy1.html">企业基本信息</a></li> 
<li class=""><a href="ddxq_hy2.html">基本经营信息</a></li> 
<li class=""><a href="ddxq_hy3.html">抵押物与负债</a></li> 
<li class=""><a href="ddxq_hy4.html">上传资料</a></li> 
</ul>
</div>
<div class="tab">
<p><span>公司名称：</span><input type="text" class="t1" /></p>
<p><span>法人代表：</span><input type="text" class="t1" /></p>
<p><span>证件类型：</span><select class="s1"><option selected="selected">请选择</option><option>身份证</option></select></p>
<p><span>证件号码：</span><input type="text" class="t1" /></p>
<p><span>营业执照注册号：</span><input type="text" class="t1" /></p>
<p><span>工商注册时间：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>是否有年检记录：</span><select class="s1"><option selected="selected">请选择</option><option>是</option><option>否</option></select></p>
<p><span>最近一次年检时间：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>注册资本(万)：</span><select class="s1"><option selected="selected">请选择</option><option>人民币</option></select><input type="text" class="t1" /></p>
<p><span>实收资本(万)：</span><select class="s1"><option selected="selected">请选择</option><option>人民币</option></select><input type="text" class="t1" /></p>
<p><span>企业性质：</span><select class="s1"><option selected="selected">请选择</option><option>互联网</option></select></p>
<p><span>所在国家（地区）：</span><input type="text" class="t1" /></p>
<p><span>注册时间：</span><input type="text" class="t1" /></p>
<p><span>企业所属地区：</span><select class="s2"><option selected="selected">请选择</option><option>浙江省</option></select><select class="s2"><option selected="selected">请选择</option><option>杭州市</option></select><select class="s2"><option selected="selected">请选择</option><option>西湖区</option></select></p>
<p><span>经营范围：</span><textarea class="t3"></textarea></p>
<p><span>组织机构代码：</span><input type="text" class="t1" /></p>
<p><span>企业电户号：</span><input type="text" class="t1" /><input type="button" class="b5" value="添加" /><input type="checkbox" class="r1" /><span class="r1_sex">无独立电户号</span></p>
<p><span>公司联系电话：</span><input type="text" class="t1" /></p>
<p><span>公司传真号码：</span><input type="text" class="t1" /></p>
<p><span>营业执照到期日：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  /></p>
<p><span>工商登记类型：</span><select class="s1"><option selected="selected">请选择</option><option>有限责任公司</option><option>民营企业</option></select></p>
<p><span>机构类型：</span><select class="s1"><option selected="selected">请选择</option><option>法人企业</option><option>私有企业</option></select></p>
<p><span>国税号：</span><input type="text" class="t1" /></p>
<p><span>地税号：</span><input type="text" class="t1" /></p> 

<p class="qiye_bt"><strong>公司控股信息</strong></p>
<p><span>股东控股方式：</span><select class="s1"><option selected="selected">请选择</option></select></p>
<p><span>实际控制人之一：</span><input type="text" class="t1" /></p>
<p><span>证件类型：</span><select class="s1"><option selected="selected">请选择</option><option>身份证</option></select></p>
<p><span>证件号码：</span><input type="text" class="t1" /></p>
<p><span>从业年限(年)：</span><input type="text" class="t1" /></p>
<p><span>学历：</span><select class="s1"><option selected="selected">请选择</option><option>高中</option><option>大专</option><option>本科</option><option>博士</option></select></p>
<p><span>婚姻情况：</span><select class="s1"><option selected="selected">请选择</option><option>单身</option><option>已婚</option><option>离异</option></select></p>
<p><span>实际控制人之二：</span><input type="text" class="t1" /></p>
<p><span>证件类型：</span><select class="s1"><option selected="selected">请选择</option><option>身份证</option></select></p> 
<p><span>证件号码：</span><input type="text" class="t1" /></p>
<p><span>从业年限：</span><input type="text" class="t1" /><span class="dw">年</span></p>
<p><span>学历：</span><select class="s1"><option selected="selected">请选择</option><option>高中</option><option>大专</option><option>本科</option><option>博士</option></select></p>
<p><span>婚姻情况：</span><select class="s1"><option selected="selected">请选择</option><option>单身</option><option>已婚</option><option>离异</option></select></p>

<p class="qiye_bt"><strong>公司治理信息</strong></p>
<p><span>所属行业：</span><select class="s1"><option selected="selected">请选择</option><option>互联网</option></select></p>
<p><span>持续经营开始时间：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  /></p>
<p><span>主要经营地点：</span><input type="radio" name="bd" class="r1" /><span class="r1_sex">本地</span><input type="radio" name="bd" class="r1" /><span class="r1_sex">外地</span></p>
<p><span>主要产品销售区域：</span><input type="radio" name="bd" class="r1" /><span class="r1_sex">省内</span><input type="radio" name="bd1" class="r1" /><span class="r1_sex">国内</span><input type="radio" name="bd1" class="r1" /><span class="r1_sex">国际</span></p>
<p><span>是否固定营业场所：</span><input type="radio" name="bd1" class="r1" /><span class="r1_sex">是</span><input type="radio" name="bd1" class="r1" /><span class="r1_sex">否</span></p>
<p><span>进入园区或市场年限：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>财务报表审计类型：</span><select class="s1"><option selected="selected">请选择</option><option> </option></select></p>
<p><span>员工人数：</span><select class="s1"><option selected="selected">请选择</option><option>10人以下</option><option>10-100人</option><option>100-500人</option><option>500人以上</option></select></p> 
<p><span>是否有贷款卡：</span><input type="radio" name="bd4" class="r1" /><span class="r1_sex">是</span><input type="radio" name="bd4" class="r1" /><span class="r1_sex">否</span></p>
<p><span>贷款卡卡号：</span><input type="text" class="t1" /></p>
<p><input type="button" value="保存" class="b1" /><input type="button" value="下一步" class="b4" /></p>
</div>
<div class="tab" id="tab4" style="display:none;" >
<table class="sczl_table">
<thead>
<tr>
<td colspan="1">序号</td>
<td colspan="4">资料类型</td>
<td colspan="3">上传文件</td>
<td colspan="2">上传时间</td>
</tr>
</thead>
<tbody>
<tr>
<td colspan="1">1</td>
<td colspan="4">税务登记证(副本)</td>
<td colspan="3"><a href="#" class="zlsc_btn">选择文件</a> <input type="file" class="hidden" /><a href="#" class="zlsc1_btn">上传文件</a></td>
<td colspan="2">  </td>
</tr>

<tr>
<td colspan="1">1</td>
<td colspan="4">配偶身份证</td>
<td colspan="3"><span class="zlysc">已上传</span><a href="#" class="zlsc1_btn">重新上传</a></td>
<td colspan="2">2015-05-12</td>
</tr>
</tbody>
</table>
</div>
  
</div>
</div>
<div class="footer">
   <p><a href="#">关于新越网</a>  | <a href="#">服务条款</a> | <a href="#">法律声明</a> |  <a href="#">隐私保护</a> |  <a href="#">联系我们</a>  | <a href="#">帮助中心</a> | <a href="#">加入我们</a>  |  <a href="#">友情链接</a></p>
    <p>浙ICP备11022285号  www.91loan.cn © 2012-2014     新越网网站所有权归杭州摩科信息技术有限公司所有      客服电话：0571-86707362    </p>
</div>
</div>

</body>
</html>
