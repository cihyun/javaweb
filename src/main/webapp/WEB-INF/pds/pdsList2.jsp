<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // part선택시 해당 part만 불러오기
    function partCheck() {
    	let part = partForm.part.value;
    	location.href = "${ctp}/PdsList.pds?part="+part;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">자 료 실 리 스 트(${part})</h2>
  <br/>
  <table class="table table-borderless">
    <tr>
      <td style="width:20%" class="text-left">
        <form name="partForm">
          <select name="part" onchange="partCheck()" class="form-control">
            <option ${part=="전체" ? "selected" : ""}>전체</option>
            <option ${part=="학습" ? "selected" : ""}>학습</option>
            <option ${part=="여행" ? "selected" : ""}>여행</option>
            <option ${part=="음식" ? "selected" : ""}>음식</option>
            <option ${part=="기타" ? "selected" : ""}>기타</option>
          </select>
        </form>
      </td>
      <td class="text-right">
        <a href="${ctp}/PdsInput.pds?part=${part}" class="btn btn-success">자료올리기</a>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>분류</th>
      <th>제목</th>
      <th>작성자</th>
      <th>등록일</th>
      <th>파일명(크기)</th>
      <th>다운수</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${vo.idx}</td>
        <td>${vo.part}</td>
        <td>${vo.title}</td>
        <td>${vo.nickName}</td>
        <td>${vo.fDate}</td>
        <td>${vo.fName}<br/>(${vo.fSize})</td>
        <td>${vo.downNum}</td>
        <td>${vo.fsName}</td>
      </tr>
    </c:forEach>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>

<!-- 블록페이지 -->

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>