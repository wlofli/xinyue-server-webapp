<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新越网_城市分站列表</title>

<%@ include file="../common/common.jsp"%>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../common/head.jsp"%>
	</div>
	<div class="nr_main">
		<div class="content">
			<div class="contentbox">
				<div class="tab1">
					<span>热门城市：</span>
					<a href="javascript:void(0)" onclick="changeCity('杭州')">杭州</a>
					<a href="javascript:void(0)" onclick="changeCity('绍兴')">绍兴</a>
					<a href="javascript:void(0)" onclick="changeCity('嘉兴')">嘉兴</a>
				</div>
				<div class="tab1">
					<span>按省份选择：</span>
					<sf:form action="${ctx}/city/enter" commandName="cityInfo" method="post" id="cityForm">
						<sf:select path="province" cssClass="sheng" id="sel_p" onchange="getCities()">
							<sf:option value="">选择省份</sf:option>
							<sf:options items="${provinces}" itemValue="key" itemLabel="value"/>
						</sf:select>
						<sf:select path="city" cssClass="shi" id="sel_c">
							<sf:option value="">选择城市</sf:option>
						</sf:select>
						<input type="button" class="jrfz_btn" value="进入分站" onclick="toSubCity()"/>
					</sf:form>
				</div>
				<ul id="menu" class="city_js">
					<li class="hit"><a href="#" onclick="javascript:xxk_item(0)">按拼音检索</a></li>
					<li><a href="#" onclick="javascript:xxk_item(1)">按地区检索</a></li>
				</ul>
 				<div class="xxk_nr" id="xxk0">
					<ul class="py_ul">
						<c:forEach items="${cityPinyInfo}" var="list" >
							<c:if test="${!empty list.value}">
								<li id="${list.key}">
									<span class="left">${list.key}</span>
									<span>
										<c:forEach items="${list.value}" var="city" varStatus="vs">
											<a href="javascript:void(0)" onclick="changeCity('${city}')">${city}</a>
										</c:forEach>
									</span>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="xxk_nr" style="display: none" id="xxk1">
					<ul class="dq_ul">
						<li class="hd" style="display: none">
							<dl>
								<dt><span>华北</span></dt>
								<c:forEach items="${hbMap}" var="hblist">
									<dd>
										<span class="left">${hblist.key}</span>
										<span>
											<c:forEach items="${hblist.value}" var="citylist">
												<a href="javascript:void(0)" onclick="changeCity('${citylist}')">${citylist}</a>
											</c:forEach>
										</span>
									</dd>
								</c:forEach>
							</dl>
						</li>
						<li class="hd">
							<dl>
								<dt>
									<span>华东</span>
								</dt>
								<c:forEach items="${hdMap}" var="hblist">
									<dd>
										<c:if test="${hblist.key eq '浙江'}">
										<span class="left">${hblist.key}</span>
										<span>
											<c:forEach items="${hblist.value}" var="citylist">
												<a href="javascript:void(0)" onclick="changeCity('${citylist}')">${citylist}</a>
											</c:forEach>
										</span>
										</c:if>
									</dd>
								</c:forEach>
							</dl>
						</li>
						<li class="hd" style="display: none">
							<dl>
								<dt><span>华南</span></dt>
								<c:forEach items="${hnMap}" var="hblist">
									<dd>
										<span class="left">${hblist.key}</span>
										<span>
											<c:forEach items="${hblist.value}" var="citylist">
												<a href="javascript:void(0)" onclick="changeCity('${citylist}')">${citylist}</a>
											</c:forEach>
										</span>
									</dd>
								</c:forEach>
							</dl>
						</li>
						<li class="hd" style="display: none">
							<dl>
								<dt><span>华中</span></dt>
								<c:forEach items="${hzMap}" var="hblist">
									<dd>
										<span class="left">${hblist.key}</span>
										<span>
											<c:forEach items="${hblist.value}" var="citylist">
												<a href="javascript:void(0)" onclick="changeCity('${citylist}')">${citylist}</a>
											</c:forEach>
										</span>
									</dd>
								</c:forEach>
							</dl>
						</li>
						<li class="hd" style="display: none">
							<dl>
								<dt><span>东北</span></dt>
								<c:forEach items="${dbMap}" var="hblist">
									<dd>
										<span class="left">${hblist.key}</span>
										<span>
											<c:forEach items="${hblist.value}" var="citylist">
												<a href="javascript:void(0)" onclick="changeCity('${citylist}')">${citylist}</a>
											</c:forEach>
										</span>
									</dd>
								</c:forEach>
							</dl>
						</li>
						<li class="hd" style="display: none">
							<dl>
								<dt><span>西南</span></dt>
								<c:forEach items="${xnMap}" var="hblist">
									<dd>
										<span class="left">${hblist.key}</span>
										<span>
											<c:forEach items="${hblist.value}" var="citylist">
												<a href="javascript:void(0)" onclick="changeCity('${citylist}')">${citylist}</a>
											</c:forEach>
										</span>
									</dd>
								</c:forEach>
							</dl>
						</li>
						<li class="hd" style="display: none">
							<dl>
								<dt><span>西北</span></dt>
								<c:forEach items="${xbMap}" var="hblist">
									<dd>
										<span class="left">${hblist.key}</span>
										<span>
											<c:forEach items="${hblist.value}" var="citylist">
												<a href="javascript:void(0)" onclick="changeCity('${citylist}')">${citylist}</a>
											</c:forEach>
										</span>
									</dd>
								</c:forEach>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/foot_main.jsp"%>
</body>
<script type="text/javascript">
	function xxk_item(n) {
		var menu = document.getElementById("menu");
		var menuli = menu.getElementsByTagName("li");
		for (var i = 0; i < menuli.length; i++) {
			menuli[i].className = "";
			menuli[n].className = "hit";
			document.getElementById("xxk" + i).style.display = "none";
			document.getElementById("xxk" + n).style.display = "block";
		}
	}
	function getCities(){
		var provinceVal = $("#sel_p option:selected").val();
			
			$("#sel_c").empty();
			var option= $("<option/>");
			option.attr("value","");
			option.html("选择城市");
			$("#sel_c").append(option);
			
			if (provinceVal != "") {
				$.ajax({
					url:"${ctx}/get/cities?type=tc&id="+provinceVal,
					success:function(data){
						var jsonData = eval(data);
						for(var i=0;i<jsonData.length;i++){
							var city=jsonData[i];
							option= $("<option/>");
							option.attr("value",city.key);
							option.html(city.value);
							$("#sel_c").append(option);
						};
					}
				});
			}
		}
	
	function toSubCity(){
		if ($("#sel_c").val() != "") {
			$("#cityForm").submit();
		}else {
			alert("请选择城市");
		}
	}
	
	function changeCity(name){
//	 	alert(encodeURI(encodeURI(name)));
		window.location.href = '${ctx}/city/select?cityName=' + encodeURI(encodeURI(name));
	}
	
</script>
</html>