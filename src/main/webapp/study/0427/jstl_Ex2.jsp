<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-5">
		<div>
			콤보상자에 숫자 1~6까지 기억시키고 화면에 보여준다.<br />
			콤보상자 옆에 텍스트박스를 위치시키고, 해당 그림의 '그림명'을 입력 후 '저장'버튼을<br />
			클릭하면 '그림이름'과, '그림파일명'을 저장시켜준다.(여러개를 저장할 수 있도록 처리)
			이 때, 숫자를 선택하면 아래쪽(demo)로 선택한 숫자의 그림파일을 출력한다.
		</div>
	</div>
</body>
</html>