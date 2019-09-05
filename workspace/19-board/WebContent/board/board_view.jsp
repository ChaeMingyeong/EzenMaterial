<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type ="text/css">
#articleForm{
   width: 500px;
   height : 500px;
   border : 1px solid red;
   margin : auto;
}
h2{text-align: center;}

#basicInfoArea{
   height:40px;
   text-align: center;
}

#articleContentArea{
  background: orange;
  margin-top: 20px;
  height: 350px;
  text-align: center;
  overflow: auto;
}

#commandList{
  margin: auto;
  width: 500px;
  text-align: center;
}

</style>
</head>
<body>
    <div id="articleForm">
		<h2>글 내용 상세보기</h2>
		<div id="basicInfoArea">
			제목 : ${bean.board_subject } 첨부파일 : <a href="">${bean.board_file }</a>
		</div>

		<div id="articleContentArea">
			<pre>${bean.board_content }</pre>
		</div>
	</div>

	<div id="commandList">
		<a href="boardReflyForm.do?board_num=${bean.board_num}&pg=${pg}">답변</a> 
		<a href="boardModifyForm.do?board_num=${bean.board_num}&pg=${pg}">수정</a> 
		<a href="boardDeleteForm.do?board_num=${bean.board_num}&pg=${pg}">삭제</a> 
		<a href="boardList.do?pg=${pg}">목록</a>
	</div>

 
</body>
</html>