<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{text-align: center;}
table{
  margin:auto;
  width: 450px;
  
}
#tr_top{
 background: orange;
 
}
#paging { color: blue; text-decoration: none;}
#currentPaging{color:red; text-decoration: underline;}

</style>
</head>
<body>
<h2>글목록</h2>   
  <div id ="listForm">    
   <table>
      <tr id ="tr_top">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>조회수</th>
      </tr>
      
     <c:forEach var ="bean" items ="${list}">
      <tr align="center">
        <td>${bean.board_num}</td>
        <td align="left">
          <!-- board_re_lev 값에 따라 들여쓰기 -->
         <c:if test ="${bean.board_re_lev !=0}">
             <c:forEach var ="a" begin ="0" end ="${bean.board_re_lev*2}" step="1">
                 &nbsp;
             </c:forEach>                          
         </c:if>
         
        <a href="boardDetail.do?board_num=${bean.board_num}&pg=${pg}">
                   ▶ ${bean.board_subject}</a>         
        </td>
        <td>${bean.board_name}</td>
        <td>${bean.board_date}</td>
        <td>${bean.board_readcount}</td>
      
      </tr>   
     </c:forEach>
     
     <!-- 페이징 -->
     <tr>
       <td colspan="5" align="center">
         <c:if test="${startPage>3}">
           [<a href="boardList.do?pg=${startPage -1 }">이전</a>]
         </c:if>  
       <c:forEach var="i" begin="${startPage}" end="${endPage}" step ="1">
          <c:if test ="${i==pg }">
            [<a id ="currentPaging" href ="boardList.do?pg=${i}">${i}</a>]
           </c:if>  
           <c:if test="${i !=pg}">
             [<a id ="paging" href ="boardList.do?pg=${i}">${i}</a>]
           </c:if>
       </c:forEach> 
          <c:if test="${endPage<totalP }">
                  [<a href="boardList.do?pg=${endPage +1 }">다음</a>]
          </c:if>            
       </td>
     </tr> 
   </table>
  </div>      
   <a href ="index.jsp">메인화면</a>&nbsp;&nbsp;&nbsp;
   <a href="boardWriteForm.do">게시판 글쓰기</a>



</body>
</html>