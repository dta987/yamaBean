<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}

</script>
</head>
<body>
	
	<div align="center">
		<br>
		<h1>UpdateMenu</h1>
		<hr width="500px">
		<form method="POST" enctype="multipart/form-data" >
		메뉴번호 menu_num <input type="text" name="menu_num" disabled="disabled"/> <br><br>
		분류(커피/원두) m_group <input type="radio" value="A" name="m_group" />커피 
							<input type="radio" value="B" name="m_group" />원두<br><br>
		카테고리 m_category <input type="radio" value="콜드브루" name="m_category" />콜드브루
						<input type="radio" value="브루드커피" name="m_category" />브루드커피
						<input type="radio" value="에스프레소" name="m_category" />에스프레소
						<input type="radio" value="프라푸치노" name="m_category" />프라푸치노
						<input type="radio" value="원두" name="m_category" />원두<br><br>
		메뉴 이름 m_name <input type="text" name="m_name"/><br><br>
		이미지 image <input type="file" name="image" /><br><br>
		설명 content <input type="text" path="content" /><br><br>
		가격 price <input type="text" name="price" /><br><br>
	 	수량 qty : 메뉴수정에는 수량 등록 없음 
	 	
	 	<br><br>
	 	<button type="reset" onclick="goBack()">취소</button>
	 	<button type="submit" >메뉴 수정</button>
	 	
		</form>
	</div>
	
</body>
</html>