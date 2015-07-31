<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员_实名认证</title>
<%@ include file="../../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<%@ include file="../member/tree.jsp"%>
			<div class="hy_right">
				<div class="ddxq_top">
					<Ul class="sdlc_ul">
						<li class="bt"><img src="${ctx}/images/smrz_bt.png" /></li>
						<li class="rz_num1"><i></i>
						<p>
								<strong>1</strong><span>填写信息<br />提交申请
								</span>
							</p></li>
						<li class="rz_num2"><i></i>
						<p>
								<strong>2</strong><span>专业审核人员<br />进行信息预审
								</span>
							</p></li>
						<li class="rz_num3"><i></i>
						<p>
								<strong>3</strong><span>国家权威机构<br />数据库交互验证
								</span>
							</p></li>
						<li class="rz_num4"><i></i>
						<p>
								<strong>4</strong><span>企业实名<br />认证成功
								</span>
							</p></li>
					</Ul>
				</div>
				<div class="hy_right_bt">
					<ul class="menu1" id="menu">
						<span>实名认证</span>
					</ul>
				</div>
				<div class="tab">
					<p class="smrz_cg">
						<i><img src="${ctx}/images/f_p_cg.png" width="40px" height="40px" /></i><span>恭喜您，实名认证成功</span>
					</p>
					<p class="qiye_bt">
						<strong>基本信息</strong>
					</p>
					<p>
						<span>公司名称：</span><span class="dw">${authInfo.companyName}</span>
					</p>
					<p>
						<span>营业执照注册号：</span><span class="dw">${authInfo.zone}</span>
					</p>
					<p>
						<span>法人姓名：</span><span class="dw">${authInfo.legalPersonName}</span>
					</p>
					<p>
						<span>法人身份证号码：</span><span class="dw">${authInfo.legalPersonID}</span>
					</p>
					<p>
						<span>法人手机号：</span><span class="dw">${authInfo.legalPersonTel}</span>
					</p>
					<p>
						<span>注册地址：</span><span class="dw">${authInfo.registerAddress}</span>
					</p>
					<p>
						<span>注册日期：</span><span class="dw">${authInfo.companyRegDate}</span>
					</p>
					<p>
						<span>注册资金(万)：</span><span class="dw">${authInfo.regFund}</span>
					</p>

					<p class="qiye_bt">
						<strong>联系方式</strong>
					</p>
					<p>
						<span>联系人姓名：</span><span class="dw">${authInfo.contactPerson}</span>
					</p>
					<p>
						<span>联系人性别：</span>
						<span class="dw">
							<c:if test="${authInfo.contactSex == 1}">
							男
							</c:if>
							<c:if test="${authInfo.contactSex == 2}">
							女
							</c:if>
							<c:if test="${authInfo.contactSex == 3}">
							保密
							</c:if>
						</span>
					</p>
					<p>
						<span>联系人电话：</span><span class="dw">${authInfo.contactTel}</span>
					</p>
					<p>
						<span>联系人邮箱：</span><span class="dw">${authInfo.contactEmail}</span>
					</p>
					<p>
						<span>联系人地址：</span><span class="dw">${authInfo.contactAddress}</span>
					</p>
					<p>
						<span>邮编：</span><span class="dw">${authInfo.postCode}</span>
					</p>

					<p class="qiye_bt">
						<strong>执照</strong>
					</p>
					<div class="zzsc_p">
						<ul class="zzsc_ul">
							<li class="zzsc_li"><span>营业执照</span><img
								src="${imgPath}${authInfo.businessLicense}" width="164px" height="105px" /></li>
							<li class="zzsc_li"><span>组织机构代码</span><img
								src="${imgPath}${authInfo.organizationCode}" width="164px" height="105px" />
							</li>
							<li class="zzsc_li"><span>税务登记证</span><img
								src="${imgPath}${authInfo.taxRegistration}" width="164px" height="105px" />
							</li>
						</ul>
					</div>
					<p class="qiye_bt">
						<strong>证件</strong>
					</p>
					<div class="zzsc_p">
						<ul class="zzsc_ul">
							<li class="zzsc_li"><span>身份证正面</span><img
								src="${imgPath}${authInfo.identityCarda}" width="164px" height="105px" /></li>
							<li class="zzsc_li"><span>身份证反面</span><img
								src="${imgPath}${authInfo.identityCardn}" width="164px" height="105px" /></li>
							<li class="zzsc_li"><span>法人手持身份证照片</span><img
								src="${imgPath}${authInfo.identityCardp}" width="164px" height="105px" /></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
</body>
</html>