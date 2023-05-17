<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>modalTest1.jsp</title>
<jsp:include page="/include/bs4.jsp" />
<script type="text/javascript">
	'use strict';
	
	function nameCheck() {
    	let name = $("#myModal1 #name").val();
    	alert("성명 : " + name);
    	location.reload();
    }
    
    function fCheck() {
    	let name = $("#myModal2 #name").val();
    	let nickName = $("#myModal2 #nickName").val();
    	let mid = $("#myModal2 #mid").val();
    	let email = $("#myModal2 #email").val();
    	alert("성명:"+name+",별명:"+nickName+",아이디:"+mid+",이메일:"+email);
    	location.reload();
    }
</script>
</head>

<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3>Modal 연습2</h3>
	<hr />
	<h5>메세지 띄우기</h5>
	<div>
		<input type="button" value="Form내용처리1" class="btn btn-primary" data-toggle="modal" data-target="#myModal1"/>
		<input type="button" value="Form내용처리2" class="btn btn-secondary" data-toggle="modal" data-target="#myModal2"/>
		<a href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal2">Form내용처리3</a>
	</div>
		
		
		<!-- 표준 모달 -->
		<div class="modal fade" id="myModal1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">표준Modal</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						 <form name="modalForm" class="was-validated" action="">
						 	성명 
						 	<input type="text" name="name" id="name" placeholder="성명을 입력하세요." class="form-control mt-2" required />
						 	<input type="button" value="확인" onclick="nameCheck()" class="btn btn-success form-control mt-2" />
						 </form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /표준 모달 -->
		
		<!-- 표준 모달 -->
		<div class="modal fade" id="myModal2">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">표준Modal</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						 <form name="modalForm" class="was-validated" action="">
						 	성명 
						 	<input type="text" name="name" id="name" value="${vo.name}" placeholder="성명을 입력하세요." class="form-control mb-2" required />
						 	닉네임 
						 	<input type="text" name="nickName" id="nickName" value="${sNickName}" placeholder="닉네임을 입력하세요." class="form-control mb-2" required />
						 	아이디
						 	<input type="text" name="mid" id="mid" value="${sMid}" placeholder="아이디를 입력하세요." class="form-control mb-2" required />
						 	
						 	이메일 : ${vo.email}
						 	<input type="button" value="확인" onclick="fCheck()" class="btn btn-success form-control" />
						 	<input type="hidden" name="email" id="email" value="${vo.email}"/>
						 </form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /표준 모달 -->
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>