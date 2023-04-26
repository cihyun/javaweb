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
			콤보상자 옆에 텍스트박스를 위치시키고, 해당 그림의 '그림명'을 입력 후 '저장'버튼을 클릭하면<br />
			'그림이름'과, '그림파일명'을 저장시켜준다.(여러개를 저장할 수 있도록 처리)<br />
			이 때, 숫자를 선택하면 아래쪽(demo)로 선택한 숫자의 그림파일을 출력한다.
		</div>
		<hr />
		<div class="dropdown mt-2">
		<form name="myform" class="comboboxForm row">
			<select id="comboBox" class="custom-select col-3">
				<option selected>선택하세요 </option>
				<%-- <c:forEach begin="1" end="6" var="idx">
					<option value="${idx}">${idx}번</option>
				</c:forEach> --%>
			</select>
			<input type="text" class="col-3 form-control ml-2">
			<input type="button" value="그림저장" onclick="imgSave()" class="col-1 btn btn-sm btn-info ml-2">
			<input type="button" value="전체보기" onclick="imgAll()" class="col-1 btn btn-sm btn-primary ml-2">
		</form>
	</div>
	<hr />
	<div id="demo"></div>
	</div>
</body>
</html>