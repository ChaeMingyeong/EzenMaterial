<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글수정</title>
<style type="text/css">
h2{text-align: center;}
table{
margin :auto;
width :450px;
}
.th_left{
  width: 150px;
  background: orange;
}

.th_right{
  width: 300px;
  background-color: skyblue;
}
</style>

</head>
<body>
          <form action="boardModifyPro.do" method="post" 
        name ="boardForm" enctype="multipart/form-data">
        <input type="hidden" name="pg" value="${pg}">  <!-- 공유건 데이터를 그다음페이지로 보냄 -->
        <input type="hidden" name="board_num" value="${boardBean.board_num}">
<table style="width: 600px;">
   <tr>
     <th class ="th_left">글쓴이</th>
     <td class ="th_right"><input type="text" name ="board_name" required="required" value="${boardBean.board_name}"></td>
   </tr>
   <tr>
     <th class ="th_left">비밀번호</th>
     <td class ="th_right"><input type="password" name ="board_pass" required="required"></td>
   </tr>
   <tr>
     <th class ="th_left">제목</th>
     <td class ="th_right"><input type="text" name ="board_subject" required="required" value="${boardBean.board_subject}"></td>
   </tr>
   <tr>
     <th class ="th_left">내용</th>
     <td class ="th_right"><textarea rows ="15" cols="40" name ="board_content" required="required">${boardBean.board_content}</textarea></td>
   </tr>
   
   <tr>
     <th class ="th_left">파일첨부</th>
     <td class ="th_right"><input type= "file" name ="board_file"  ></td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <a href="javascript: document.boardForm.submit()">[수정]</a>
       <a href="javascript: history.back()" >[뒤로]</a>
                          <!-- onclick속성을 서서 하던, 앞에 javascript을 붙이던  -->
     </td>

  </tr>
</table>
  
   
</form>
</body>
</html>