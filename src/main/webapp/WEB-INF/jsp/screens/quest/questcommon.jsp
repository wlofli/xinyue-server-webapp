<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


<div class="wd_fl">
	<div class="wd_bt">
		<span>问答分类</span>
	</div>
	<s:form commandName="qbean" method="post" action="${ctx }/quest/show" id="quest_detail_form">
		<s:hidden path="questype" id="quest_questype"/>
	</s:form>
	<div class="wd_lb">
		<c:forEach items="${questtype }" var="qtone">
			<c:if test="${empty qtone.parentid}">
			
				<dl class="wd_fl1">
					<dt>
						<span>${qtone.name }</span>
					</dt>
					<c:forEach var="qttwo" items="${questtype }">
						<c:if test="${qttwo.parentid eq qtone.id }">
							<dd>
								<a href="javascript:void(0)" onclick="showquest('${qttwo.id}')">${qttwo.name }</a>
							</dd>
						</c:if>
					</c:forEach>
					<div class="clear"></div>
				</dl>
			</c:if>
		</c:forEach>
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
	<a href="javascript:void(0)"> <img src="${ctx }/images1/ad1.jpg" /></a>
</div>

<script type="text/javascript">
	function showquest(){
		if(arguments.length == 0){
			$("#quest_detail_form").submit();
		}else{
			$("#quest_questype").val(arguments[0]);
			$("#quest_detail_form").submit();
		}
	}
	
</script>