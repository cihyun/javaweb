<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<!-- <a class="navbar-brand" href="http://localhost:9090/javaweb/">HOME</a> -->
	<a class="navbar-brand" href="http://192.168.50.81:9090/javaweb/">HOME</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">GUEST</a></li>
			<li class="nav-item"><a class="nav-link" href="#">BOARD</a></li>
			<li class="nav-item"><a class="nav-link" href="#">PDS</a></li>
			<li class="nav-item">
				<div class="dropdown">
				    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">
				      STUDY1
				    </button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/study/0428_database/login.jsp">로그인연습</a>
				      <a class="dropdown-item" href="#">Link2</a>
				      <a class="dropdown-item" href="#">Link3</a>
				    </div>
				</div>
			</li>
			<li class="nav-item">
				<div class="dropdown">
				    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">
				      STUDY2
				    </button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="#">URL매핑</a>
				      <a class="dropdown-item" href="#">Link2</a>
				      <a class="dropdown-item" href="#">Link3</a>
				    </div>
				</div>
			</li>
			<li class="nav-item">
				<div class="dropdown">
				    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">
				      INFOMATION
				    </button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="#">회원정보수정</a>
				      <a class="dropdown-item" href="#">회원리스트</a>
				      <a class="dropdown-item" href="#">회원탈퇴</a>
				    </div>
				</div>
			</li>
		</ul>
	</div>
</nav>