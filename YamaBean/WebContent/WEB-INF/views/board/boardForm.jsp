<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<c:set value="${twelve - 2}" var="mywidth"></c:set>
<c:set value="1" var="myoffset"></c:set>
<c:set value="1" var="formleft"></c:set>
<c:set value="${twelve - formleft}" var="formright"></c:set>

<script type="text/javascript">
	$(function() {
		$("#writerForm").submit(function() {
			if($("#title").val() == "") {
				alert("Title를 입력해주세요");
				return false;
			} else if($("#divcontext").text() == "") {
				alert("내용을 입력해주세요");
				return false;
			} else {
				$("#divtext").val($("#divcontext").text());
				return true;
			}
		});
		
	});
</script>

</head>
<body>

	<div class="col-sm-offset-${myoffset} col-sm-${mywidth}"
		style="margin-top: 100px;">
		<form id="writerForm" class="form-horizontal" role="form"
			action="${pageContext.request.contextPath}/board/boardWriter"
			method="post" id="frm">
			<label>BOARD WRITE</label><br> * 답변은 등록하신 이메일로 보내드리겠습니다<br>
			<hr style="border: solid;">
			<div class="form-group ">
				<label class="control-label col-sm-${formleft}" for="subject">TITLE</label>
				<div class="col-sm-${mywidth}">
					<input type="text" class="form-control" name="title" id="title">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-${formleft}" for="content">NOTE</label>
				<div class="col-sm-${mywidth}">
					<input type="hidden" id="divtext" name="contents" value="">
					<input type="hidden" name="b_category" value="qna">
					<div id="divcontext" class="form-control" contentEditable="true"
						style="height: 300px; overflow: auto;"></div>
				</div>
			</div>
			<div class="form-group">
				<div align="center" class="col-sm-offset-6 col-sm-9">
					<button class="w3-btn w3-white w3-border w3-round-large"
						type="submit" id="savebtn">SAVE</button>
				</div>
			</div>
		</form>
	</div>


</body>
</html>