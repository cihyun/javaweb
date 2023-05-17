<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
<style type="text/css">
	th {
		text-align:center;
		background-color:#eee;
	}
	.tbl2 > th {
		text-align:center;
		background-color:#eee;
		border-top: 2px solid #eee;
	}
	.tbl2 {
		border-top: 2px solid #777;
	}
	a {
		text-decoration: none;
	}
</style>
<script type="text/javascript">
	'use strict';
	
	// 좋아요
    function goodCheck() {
		
        /* location.href = "${ctp}/BoardGoodCheck.bo?idx=${vo.idx}"; */
    	$.ajax({
        type: "post",
        url: "${ctp}/BoardGoodCheck.bo?idx=${vo.idx}",
        data: { idx: ${vo.idx} },
        success: function(res) {
            if (res === "1") {
                document.getElementById("goodImg").style.display = "inline";
                document.getElementById("noGoodImg").style.display = "none";
                alert("좋아요 선택!");
            } else if (res === "0") {
                document.getElementById("goodImg").style.display = "none";
                document.getElementById("noGoodImg").style.display = "inline";
                alert("좋아요 해제!");
            } else {
                location.reload();
            }
        },
        error: function() {
            alert("전송 오류!");
        }
    });
/*     	$.ajax({
            type: "post",
            url: "${ctp}/BoardGoodCheck.bo?idx=${vo.idx}",
            data: { idx: ${vo.idx} },
            success: function(res) {
                if (res == "1") {
                    $("#goodImg").show();
                    $("#noGoodImg").hide();
                    alert("좋아요 선택!");
                } else if (res == "0") {
                    $("#noGoodImg").show();
                    $("#goodImg").hide();
                    alert("좋아요 해제!");
                } else {
                	location.reload();
                }
            },
            error: function() {
                alert("전송 오류!");
            }
        }); */
    }
    // 게시물 삭제
    function boardDelete() {
    	let ans = confirm("게시글을 삭제하시겠습니까?");
    	if(ans) location.href="${ctp}/BoardDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&nickName=${vo.nickName}";
    }
    // 댓글
    function replyCheck(){
    	let content = $("#content").val();
    	if(content.trim() == "") {
    		alert("댓글을 입력하세요!");
    		$("#content").focus();
    		return false;
    	}
    	let query = {
    			boardIdx : ${vo.idx},
    			mid      : '${sMid}',
    			nickName : '${sNickName}',
    			content  : content,
    			hostIp   : '${pageContext.request.remoteAddr}'
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/BoardReplyInput.bo",
    		data  : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("댓글이 입력되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("댓글 입력 실패!");
    			}
    		},
    		error : function() {
    			alert("전송 오류!!!");
    		}
    	});
    }
    // 댓글 삭제 처리
    function replyDelete(idx) {
    	let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
      if(!ans) return false;
      
      $.ajax({
        type : 'post',
        url : '${ctp}/BoardReplyDelete.bo',
        data : {replyIdx : idx},
        success : function(res) {
          if(res == '1') {
           alert('댓글이 삭제되었습니다.');
           location.reload();
          }
          else {
           alert('댓글이 삭제되지 않았습니다.');
          }
        },
        error : function() {
          alert('전송실패~~');
        }
      });
    }
    
</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3>게시판 상세페이지</h3>
	<table class="table table-bordered mt-5">
		<colgroup>
			<col width="15%" />
			<col width="20%" />
			<col width="15%" />
			<col width="25%" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<th>번호</th>
			<td colspan="5">${vo.idx}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.nickName}</td>
			<th>작성일</th>
			<td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
			<th>조회수</th>
			<td>${vo.readNum}</td>
		</tr>
		<tr>
			<th>IP</th>
			<td colspan="5">${vo.hostIp}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5">${vo.title}</td>
		</tr>
		<tr>
			<th>email</th>
			<td colspan="5">${vo.email}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan="5">${vo.homePage}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5">${fn:replace(vo.content, newLine, "<br />")}</td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td colspan="5">
				<b>${vo.good}</b>
				<a href="#" onclick="goodCheck()">
				    <img id="goodImg" src="${ctp}/images/good2.png" width="20px" class="ml-1" style="display: inline;" />
				    <img id="noGoodImg" src="${ctp}/images/good1.png" width="20px" class="ml-1" style="display: none;" />
				</a>
			</td>
		</tr>
	</table>
<!-- 버튼 -->
	<div class="text-right mb-3">
		<c:if test="${flag == 'search'}">
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardSearch.bo?search=${search}&searchString=${searchString}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/>
		</c:if>
		<c:if test="${flag != 'search'}">
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/> &nbsp;
				<c:if test="${sMid == vo.mid || sLevel == 0}">
					<input type="button" value="수정하기" onclick="location.href='${ctp}/BoardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-warning"/> &nbsp;
					<input type="button" value="삭제하기" onclick="boardDelete()" class="btn btn-danger"/>
				</c:if>
		</c:if>
	</div>
<!-- 이전글, 다음글 -->
	<c:if test="${flag != 'search'}">
		<table class="table table-bordered tbl2">
		<colgroup>
			<col width="15%" />
			<col width="*" />
		</colgroup>
			<tr>
				<c:if test="${nextVo.nextIdx != 0}">
				<th>다음글</th>
					<td>
						<a href="${ctp}/BoardContent.bo?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}">${nextVo.nextTitle}</a>
					</td>
				</c:if>
			</tr>
			<tr>
				<c:if test="${preVo.preIdx != 0}">
				<th>이전글</th>
					<td>
						<a href="${ctp}/BoardContent.bo?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}">${preVo.preTitle}</a>
					</td>
				</c:if>
			</tr>
		</table>
	</c:if>
<!-- 댓글 입력  -->
	<form name="replyForm" method="" action="">
		<table class="table table-bordered">
		<colgroup>
			<col width="*" />
			<col width="15%" />
		</colgroup>
			<tr>
				<td>
				<textarea rows="2" name="content" id="content" placeholder="댓글 내용을 입력하세요" class="form-control"></textarea>
				</td>
				<td>
					작성자 : <font color="blue"><b>${sNickName}</b></font>
					<input type="button" value="등록" onclick="replyCheck()" class="btn btn-info btn-sm form-control mt-2"/>
				</td>
			</tr>
		</table>
	</form>
<!-- 댓글 리스트  -->
	<table class="table table-bordered">
		<colgroup>
			<col width="15%" />
			<col width="*" />
			<col width="13%" />
			<col width="13%" />
			<col width="7%" />
		</colgroup>
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>등록일</th>
			<th>IP</th>
			<th>비고</th>
		</tr>
		<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
        <tr class="text-center">
          <td>${replyVo.nickName}</td>
          <td class="text-left">${fn:replace(replyVo.content, newLine, "<br/>")}</td>
          <td>${fn:substring(replyVo.wDate,0,10)}</td>
          <td>${replyVo.hostIp}</td>
          <td>
            <c:if test="${sMid == replyVo.mid || sLevel == 0}">
            	<a href="javascript:replyDelete(${replyVo.idx})" title="댓글삭제" class="btn btn-danger btn-sm"><b>삭제</b></a>
            </c:if>
          </td>
        </tr>
      </c:forEach>
	</table>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>