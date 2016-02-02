<%@ tag language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute required="true" name="url" type="java.lang.String"%>
<%@ attribute required="true" name="pageData" type="com.xinyue.manage.beans.PageData"%>

<c:if test="${pageData.totalPage > 0}">

	<ul>
		<li>
			<c:choose>
				<c:when test="${pageData.currentPage == 1}">
					<a href="javascript:void(0);">首页</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0)" onclick="changePage('${url}' , 1)">首页</a>
				</c:otherwise>
			</c:choose>
		</li>
		<li>
			<c:choose>
				<c:when test="${pageData.currentPage == 1}">
					<a href="javascript:void(0);">上一页</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0)" onclick="changePage('${url}' , ${pageData.currentPage - 1})">上一页</a>
				</c:otherwise>
			</c:choose>
		</li>
		<c:choose>
			<c:when test="${pageData.totalPage < 6}">
				<c:forEach begin="${pageData.start}" end="${pageData.end}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.index == pageData.currentPage}">
							<li><a href="javascript:void();" class="hit">${vs.index}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:void();" onclick="changePage('${url}',${vs.index})">${vs.index}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:if test="${pageData.currentPage > 3}">
					<c:choose>
						<c:when test="${pageData.currentPage == 1}">
							<li><a href="javascript:void();" onclick="changePage('${url}',1)" class="hit">1</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:void();" onclick="changePage('${url}',1)" >1</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${pageData.currentPage > 4}"><li>...</li></c:if>
				<c:forEach begin="${pageData.start}" end="${pageData.end}" varStatus="vs">
					<c:choose>
						<c:when test="${pageData.currentPage == vs.index}">
							<li><a href="javascript:void();" onclick="changePage('${url}',${vs.index})" class="hit">${vs.index}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:void();" onclick="changePage('${url}',${vs.index})" >${vs.index}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageData.currentPage+3 < pageData.totalPage}"><li>...</li></c:if>
				<c:if test="${pageData.currentPage+2 < pageData.totalPage}">
					<c:choose>
						<c:when test="${pageData.currentPage == pageData.totalPage}">
							<li><a href="javascript:void();" onclick="changePage('${url}',${pageData.totalPage})" class="hit">${pageData.totalPage}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:void();" onclick="changePage('${url}',${pageData.totalPage})" >${pageData.totalPage}</a></li>
						</c:otherwise>
					</c:choose>
					
				</c:if>
			</c:otherwise>
		</c:choose>
		<li>
			<c:choose>
				<c:when test="${pageData.currentPage == pageData.totalPage}">
					<a href="javascript:void(0);">下一页</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0)" onclick="changePage('${url}' , ${pageData.currentPage + 1})">下一页</a>
				</c:otherwise>
			</c:choose>
		</li>
		<li class="bor_none">
			<c:choose>
				<c:when test="${pageData.currentPage == pageData.totalPage}">
					<a href="javascript:void(0);">尾页</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0)" onclick="changePage('${url}' , ${pageData.totalPage })">尾页</a>
				</c:otherwise>
			</c:choose>
		</li>
		<li class="clear"></li>
	</ul>
</c:if>