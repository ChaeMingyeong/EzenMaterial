<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${param.pg} ${param.board_num }                     <!-- get으로 데이터 보내려면 히든으로 보내던지 -->
                                                    <!-- 아니면 post 방식으로 보내던지 -->
   <form action="boardDeletePro.do?pg=${param.pg}" name ="deleteForm" method="post">
         <div>
      
      <input type="hidden" name ="board_num" value ="${param.board_num}">
              글비밀번호:  <input type="password" name ="board_pass"> <br>
              
            
       <input type="submit" value ="삭제">
       <input type="button" value ="돌아가기" onclick="history.back()">   
         </div>
        
      
      
      </form>
      
      
</body>
</html>