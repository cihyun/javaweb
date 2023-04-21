<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script type="text/javascript">
  		'use strict';
  		
  		let idx =0;
  		let newText = '';
  		// 박스 추가 버튼을 클릭할 때마다 입력폼 동적 추가 : 각 TextField마다 고유한 id를 지정해준다.
  		function inputBox() {
  			idx++;
  			newText = '<div id="proTxt'+idx+'">';
  			newText += '<table class="table" width="100%">';
  			newText += '<tr>';
  			newText += '<td><input type="text" name="product" id="product'+idx+'" /></td>';
  			newText += '<td><input type="number" name="price" id="price'+idx+'" /></td>';
  			newText += '<td><input type="number" name="su" id="su'+idx+'" /></td>';
  			newText += '<td><input type="button" value="삭제" onclick="deleteBox('+idx+')" class="btn btn-secondary"></td>';
  			newText += '</tr>';
  			newText += '</table>';
  			newText += '</div>';
  			
  			demo.innerHTML += newText;
  		}
  		// 삭제버튼 클릭시에 해당 테이블 박스 1개만 삭제하기
  	    function deleteBox(idx) {
  	    	let proTxt = "proTxt"+idx;
  	    	let item = document.getElementById(proTxt);
  	    	item.parentNode.removeChild(item);
  	    }
  	    
  	    function reloadCheck() {
  	    	// idx = "";
  	    	location.reload();
  	    }
  	    // 상품 등록하기 전에 기본적인 사항을 체크 후 정상적인 값을 서버로 전송한다.
  	    function fCheck() {
  	    	let name = document.getElementById("name");
  	    	let part = document.getElementById("part").value;
  	    	let products = document.getElementsByName("product");
  	    	let prices = document.getElementsByName("price");
  	    	let sus = document.getElementsByName("su");
  	    	
  	    	if(name.value.trim() == "") {
  	    		alert("상품 등록자 성명을 입력하세요!");
  	    		name.focus();
  	    		return false;
  	    	}
  	    	else if(part == "") {
  	    		alert("상품 분류를 선택 하세요!");
  	    		return false;
  	    	}
  	    	
  	    	for(let i=0; i<products.length; i++) {
  	    		if(products[i].value == "") {
  	    			alert("상품명을 입력하세요!");
  	    			document.getElementById("product"+i).focus();
  	    			return false;
  	    		}
  	    		else if(prices[i].value == "") {
  	    			alert("상품가격을 입력하세요!");
  	    			document.getElementById("price"+i).focus();
  	    			return false;
  	    		}
  	    		else if(sus[i].value == "") {
  	    			alert("수량을 입력하세요!");
  	    			document.getElementById("su"+i).focus();
  	    			return false;
  	    		}
  	    	}
  	    	myform.submit();
  	    }
  	</script>
</head>
<body>
	<div class="container mt-5">
	<h2>판매 상품 등록</h2>
	<form name="myform" method="post" action="${pageContext.request.contextPath}/t0420/test7Ok">
		<p> 상품등록 : 
			<input type="text" name="name" id="name" value="" autofocus required class="form-control">
		</p>
		<p> 상품 분류 :
			<select name="part" id="part"class="form-control">
				<option>전자제품</option>
				<option>가구</option>
				<option>의류</option>
				<option>생활용품</option>
				<option>식품</option>
			</select>
		</p>
		<hr />
		<p>
			<input type="button" value="입력창 추가" onclick="inputBox()" class="btn btn-primary" />
			<input type="button" value="입력창 모두제거" onclick="reloadCheck()" class="btn btn-danger" />
		</p>
		<table class="text-center table table-bordered mt-4">
			<tr>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>비고</th>
			</tr>
			<tr>
				<td colspan="4">
					<table class="text-center table table-borderless tbl2">
						<tr>
							<td><input type="text" name="product" id="product0" value="냉장고" /></td>
							<td><input type="number" name="price" id="price0" value="5000000" /></td>
							<td><input type="number" name="su" id="su0" value="1" /></td>
							<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
						</tr>
					</table>
					<div id=demo></div>
				</td>
			</tr>
		</table>
		<p>
			<input type="button" value="상품가격계산" onclick="fCheck()" class="btn btn-success form-control">
		</p>
		</form>
	</div>
</body>
</html>