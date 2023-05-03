<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLine","\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>블록페이징처리</title>
<jsp:include page="/include/bs4.jsp" />
<style type="text/css">
	th {
		background-color: #dcdcdc;
	}
</style>
<script>
    'use strict';
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/GuestList.gu?pag=${pag}&pageSize="+pageSize;
    }
    function delCheck(idx) {
    	let ans = confirm("게시물을 삭제하시겠습니까?");
    	if(ans) location.href = "${ctp}/GuestDelete.gu?idx="+idx;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container">
	<div class="mt-4"></div>
	<h2>방명록리스트</h2>
	<table class="table table-borderless mb-0">
		<tr>
			<td>
			<c:if test="${sAdmin != 'adminOk'}">
				<a href="${ctp}/AdminLogin.gu" class="btn btn-success btn-sm">관리자</a>
			</c:if>
			<c:if test="${sAdmin == 'adminOk'}">
				<a href="${ctp}/AdminLogout.gu" class="btn btn-secondary btn-sm">로그아웃</a>
			</c:if>
			</td>
			<td style="text-align: right;"><a href="${ctp}/GuestInput.gu" class="btn btn-info btn-sm">글쓰기</a></td>
		</tr>
	</table>
	<table class="table table-borderless mb-0">
		<tr>
			<td>
				<select name="pageSize" id="pageSize" onchange="pageCheck()">
					<option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
					<option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
					<option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
					<option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
					<option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
				</select>건
			</td>
			<td class="text-right">
			<!-- 첫페이지 / 이전페이지 / (현재페이지 번호/총페이지 수) / 다음페이지 / 마지막페이지 -->
			<c:if test="${pag > 1}">
				<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=1" title="첫페이지로">◁◁</a>
          		<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${pag-1}" title="이전페이지로">◀</a>
			</c:if>
			${pag} / ${totPage}
			<c:if test="${pag < totPage}">
				<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${pag+1}" title="다음페이지로">▶</a>
          		<a href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${totPage}" title="마지막페이지로">▷▷</a>
			</c:if>
			</td>
		</tr>
	</table>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<td>
					<c:if test="${sAdmin == 'adminOk'}">
						<a href="javascript:delCheck(${vo.idx})" class="btn btn-sm btn-dark mr-2">삭제</a>
					</c:if>
					번호 : ${curScrStartNo}
				</td>
				<td style="text-align: right;">방문IP : ${vo.hostIp}</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="30%">
			</colgroup>
			<tr>
				<th class="text-center">성명</th>
				<td>${vo.name}</td>
				<th class="text-center">방문일자</th>
				<td>${fn:substring(vo.visitDate,0,19)}</td>
			</tr>
			<tr>
				<th class="text-center">메일주소</th>
				<td colspan="3">
					<c:if test="${empty vo.email || fn:length(vo.email)<5 || fn:indexOf(vo.email,'@')==-1 || fn:indexOf(vo.email,'.')==-1}">- 없음 -</c:if>
	        		<c:if test="${!empty vo.email && fn:length(vo.email)>=5 && fn:indexOf(vo.email,'@')!=-1 && fn:indexOf(vo.email,'.')!=-1}">${vo.email}</c:if>

				</td>
			</tr>
			<tr>
				<th class="text-center">홈페이지</th>
				<td colspan="3">
					<c:if test="${empty vo.homePage || fn:length(vo.homePage)<10 || fn:indexOf(vo.homePage,'.')==-1}">- 없음 -</c:if>
	        		<c:if test="${!empty vo.homePage && fn:length(vo.homePage)>=10 && fn:indexOf(vo.homePage,'.')!=-1}">${vo.homePage}</c:if>

				</td>
			</tr>
			<tr>
				<th class="text-center">방문소감</th>
				<td colspan="3">${fn:replace(vo.content,newLine,'<br />')}</td>
			</tr>
		</table>
		<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
	</c:forEach>
	<br />
	
	<!-- 처음으로 / 이전 / 1(4) 2(5) 3(6) / 다음 / 마지막-->
	<div class="text-center">
		<ul class ="pagination justify-content-center">
			<c:if test="${pag > 1}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=1">첫페이지</a></li>
			</c:if>
			<c:if test="${curBlock > 0}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
				<c:if test="${i <= totPage && i == pag}">
					<li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li>
				</c:if>
				<c:if test="${i <= totPage && i != pag}">
					<li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${curBlock < lastBlock}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음</a></li>
			</c:if>
			<c:if test="${pag < totPage}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${totPage}">마지막</a></li></c:if>
		</ul>
	</div>
	
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>