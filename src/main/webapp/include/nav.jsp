<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int level = session.getAttribute("sLevel")==null ? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<script>
	function deleteAsk() {
		let ans = confirm("탈퇴하시겠습니까 ? ");
		if(ans) {
			let ans2 = ("탈퇴 후 같은 아이디로 1개월간 재가입이 불가능합니다.\n탈퇴 하시겠습니까 ?");
			if(ans2) location.href="${ctp}/MemberDeleteAsk.mem";
		}
	}
</script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<!-- <a class="navbar-brand" href="http://localhost:9090/javaweb/">Home</a> -->
	<a class="navbar-brand" href="http://192.168.50.81:9090/javaweb/">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/GuestList.gu">Guest</a>
			</li>
			<c:if test="${level <= 4}">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/BoardList.bo">Board</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${ctp}/PdsList.pds">PDS</a></li>
				<li>
					<div class="dropdown">
						<button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">Study1</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/study/0428_database/login.jsp">로그인연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/mapping/Test1">URL매핑(디렉토리패턴)</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/mapping/Test5.do">URL매핑(확장자패턴1)</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/mapping2/Test5.mi">URL매핑(확장자패턴2)</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/study/0428_database/Login.re">로그인연습2</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/Password.st">암호화연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/UuidForm.st">UUID연습</a>
							<a class="dropdown-item" href="${ctp}/AjaxTest1">aJax연습1</a>
							<a class="dropdown-item" href="${ctp}/UserList.st">aJax연습2</a>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">Study2</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${ctp}/FileUpLoad1.st">싱글파일업로드연습1</a>
							<a class="dropdown-item" href="${ctp}/FileUpLoad2.st">멀티파일업로드연습2</a>
							<a class="dropdown-item" href="${ctp}/FileUpLoad3.st">멀티파일업로드연습3</a>
							<a class="dropdown-item" href="${ctp}/FileUpLoad4.st">멀티파일업로드연습4</a>
							<a class="dropdown-item" href="${ctp}/ModalTest1.st">Modal 연습1</a>
							<a class="dropdown-item" href="${ctp}/ModalTest2.st">Modal 연습2</a>
							<a class="dropdown-item" href="${ctp}/Calendar.st">달력연습1</a>
							<a class="dropdown-item" href="${ctp}/Calendar2.st">달력연습2</a>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">MyPage</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${ctp}/MemberMain.mem">회원정보</a>
							<a class="dropdown-item" href="${ctp}/ScheduleList.sc">스케줄관리</a>
							<a class="dropdown-item" href="${ctp}/MemberPwdUpdate.mem">비밀번호변경</a>
							<a class="dropdown-item" href="${ctp}/MemberPwdCheckForm.mem">회원정보수정</a>
							<c:if test="${sLevel != 1}">
								<a class="dropdown-item" href="${ctp}/MemberList.mem">회원목록</a>
							</c:if>
							<a class="dropdown-item" href="javascript:deleteAsk()">회원탈퇴</a>
							<c:if test="${sLevel == 0}">
								<a class="dropdown-item" href="${ctp}/AdminMain.ad">관리자</a>
							</c:if>
						</div>
					</div>
				</li>
			</c:if>
			<li class="nav-item">
				<c:if test="${level > 4}">
					<a class="nav-link" href="${pageContext.request.contextPath}/MemberLogin.mem">Login</a>
				</c:if>
				<c:if test="${level <= 4}">
					<a class="nav-link" href="${pageContext.request.contextPath}/MemberLogout.mem">Logout</a>
				</c:if>
			</li>
			<li class="nav-item">
				<c:if test="${level > 4}">
					<a class="nav-link" href="${pageContext.request.contextPath}/MemberJoin.mem">Join</a>
				</c:if>
			</li>
		</ul>
	</div>
</nav>
<div class="mb-3"></div>