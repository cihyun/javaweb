<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="mb-3">
                <h3>로그인</h3>
            </div>
            <form name="myform" method="post" class="shadow p-4" action="<%=request.getContextPath() %>/t0000/LoginOK">                  
                <div class="mb-3">
                    <label for="mid">ID</label>
                    <input type="text" class="form-control" name="mid" id="mid" placeholder="ID를 입력하세요." />
                </div>

                <div class="mb-3">
                    <label for="pwd">Password</label>
                    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" />
                </div>

                <label class="mb-3">
                    <input type="checkbox" name="rememberId" /> 아이디저장
                </label>

                <div class="mb-3 text-center">
                    <button type="submit" class="form-control btn btn-primary">Login</button>
                </div>

                <hr />

                <p class="text-center mb-0">If you have not account <a href="#">Register Now</a></p>
            </form>
        </div>
    </div>
	</div>
</body>
</html>