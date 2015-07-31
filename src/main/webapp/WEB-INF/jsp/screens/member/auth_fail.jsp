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
						<i><img src="${ctx}/images/f_p_cg1.png" width="40px" height="40px" /></i><span>认证资料审核不通过，请重新提交</span>
					</p>
					<p class="smrz_cg">
						<a href="${ctx}/member/authentication/modify">修改资料</a>
					</p>
				</div>
			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
</body>
</html>