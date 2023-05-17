<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>pdsList.jsp</title>
<jsp:include page="/include/bs4.jsp" />
<script>
    'use strict';
    
    // 페이징 처리
	
	if(${pag} > ${totPage}) location.href="${ctp}/PdsList.pds?part=${part}&pageSize="+pageSize+"&pag=${totPage}";
	
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href="${ctp}/PdsList.pds?pag=${pag}&pageSize="+pageSize+"&part=${part}";
    }
    
    // part선택시 해당 part만 불러오기
    function partCheck() {
    	 let part = partForm.part.value;
         location.href="${ctp}/PdsList.pds?part="+part+"&pageSize=${pageSize}&pag=${pag}";
    }
    
    // 다운로드횟수 증가처리(AJAX)
    function downNumCheck(idx, fSName) {
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/PdsDownNumCheck.pds",
    		data : {idx : idx},
    		success : function() {
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
    
    // 파일 삭제처리(ajax)
    function pdsDeleteCheck(idx, fSName) {
    	let ans = confirm("선택된 자표파일을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	let pwd = prompt("비밀번호를 입력하세요?");
    	let query = {
    			idx : idx,
    			fSName : fSName,
    			pwd : pwd
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/PdsDeleteCheck.pds",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert('삭제되었습니다.');
    				location.reload();
    			}
    			else {
    				alert("삭제 실패~");
    			}
    		},
    		error : function() {
    			alert("전송 실패~");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container">
		<h2 class="text-center">자료실리스트(${part})</h2>
		<div class="row mt-3">
			<div class="col-2 text-left">
				<form name="partForm">
					<select name="part" onchange="partCheck()" class="form-control">
						<option ${part=="전체" ? "selected" : ""}>전체</option>
						<option ${part=="학습" ? "selected" : ""}>학습</option>
						<option ${part=="여행" ? "selected" : ""}>여행</option>
						<option ${part=="음식" ? "selected" : ""}>음식</option>
						<option ${part=="기타" ? "selected" : ""}>기타</option>
					</select>
				</form>
			</div>
			<div class="col text-right">
				<select name="pageSize" id="pageSize" onchange="pageCheck()" class="custom-select">
					<option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
					<option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
					<option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
					<option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
					<option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
				</select>
				<a href="${ctp}/PdsInput.pds?part=${part}&pageSize=${pageSize}&pag=${pag}" class="btn btn-success">등록</a>
			</div>
		</div>
		<table class="table table-hover text-center mt-3">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="12%">
				<col width="15%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr class="table-dark text-dark">
				<th>No</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>파일명</th>
				<th>다운수</th>
				<th>비고</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.part}</td>
					<td>${vo.title}</td>
					<td>${vo.nickName}</td>
					<td>${fn:substring(vo.fDate,0,16)}</td>
					<td>
						<c:set var="fNames" value="${fn:split(vo.fName,'/')}" />
						<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}" />
						<c:forEach var="fName" items="${fNames}" varStatus="st">
							<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a>
							<br />
						</c:forEach>
						(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0" />KByte)
					</td>
					<td>${vo.downNum}</td>
					<td>
						<a href="${ctp}/PdsTotalDown.pds?idx=${vo.idx}" class="badge badge-info">전체다운</a>
						<a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="badge badge-danger">삭제1</a>
						<br />
						<a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="badge badge-warning">삭제2</a></td>
				</tr>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}"></c:set>
			</c:forEach>
			<tr>
				<td colspan="8" class="m-0 p-0"></td>
			</tr>
		</table>
		<!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3 / 다음블록 / 마지막페이지 -->
		<div class="text-center m-4">
		  <ul class="pagination text-center justify-content-center border-secondary pagination-sm">    
                <c:if test="${pag>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pageSize=${pageSize}&pag=1">처음</a></li></c:if>
                <c:if test="${curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${(curBlock-1)*blockSize+1}">이전</a></li></c:if>
                <c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
                    <c:if test="${i<=totPage && i== pag}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
                    <c:if test="${i<=totPage && i!= pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
                </c:forEach>
                <c:if test="${curBlock<lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${(curBlock+1)*blockSize+1}">다음</a></li></c:if>
                <c:if test="${pag<totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/PdsList.pds?part=${part}&pageSize=${pageSize}&pag=${totPage}">마지막</a></li></c:if>
            </ul>
	  </div>
</div>

	<!-- 블록 페이징 처리 -->

	<jsp:include page="/include/footer.jsp" />
</body>
</html>