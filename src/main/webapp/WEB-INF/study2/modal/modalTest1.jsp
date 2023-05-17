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
</head>

<body>
<jsp:include page="/include/header.jsp" />
<div class="container mt-5">
	<h3>Modal 연습1</h3>
	<hr />
	<h5>메세지 띄우기</h5>
	<div>
		<input type="button" value="표준모달창" class="btn btn-primary" data-toggle="modal" data-target="#myModal1"/>
		<input type="button" value="부드러운 모달창" class="btn btn-secondary" data-toggle="modal" data-target="#myModal2"/>
		<input type="button" value="중앙 모달창" class="btn btn-info" data-toggle="modal" data-target="#myModal3"/>
		<input type="button" value="모달크기변경" class="btn btn-warning" data-toggle="modal" data-target="#myModal4"/>
		<input type="button" value="내용이 많은 모달" class="btn btn-danger" data-toggle="modal" data-target="#myModal5"/>
		<input type="button" value="내용이 많은 모달2" class="btn btn-success" data-toggle="modal" data-target="#myModal6"/>
	</div>
		
		<!-- 표준 모달 -->
		<div class="modal" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">표준Modal</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /표준 모달 -->
		
		<!-- 부드러운 모달(fade) -->
		<div class="modal fade" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">fade추가</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /부드러운 모달 -->
		
		<!-- 중앙 모달(modal-dialog-centered) -->
		<div class="modal fade" id="myModal3">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">중앙 위치</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /중앙 모달 -->
		
		<!-- 대/중/소 모달( modal - xl/lg/sm) -->
		<div class="modal fade" id="myModal4">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">대/중/소 모달</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /대/중/소 모달( modal - xl/lg/sm) -->
		
		<!-- 내용이 많은 모달(스크롤 처리) -->
		<div class="modal fade" id="myModal5">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">내용이 많은 모달</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						긴 문장은 모달 body안에 넣어준다.<br />
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /내용이 많은 모달 -->
		
		<!-- 내용이 많은 모달2(modal-dialog-scrollable) -->
		<div class="modal fade" id="myModal6">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">내용이 많은 모달</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						긴 문장은 모달 body안에 넣어준다.<br />
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
						<p>Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..Modal body ..</p>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- /내용이 많은 모달 -->
		
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>