<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판</title>
<style type="text/css">
 #currentPaging{ color:red; text-decoration: underline;}
 #paging{ color: blue; text-decoration: none}
</style>
</head>
<body>
<table border ="1">
  <tr>
    <th width ="100">번호</th>
    <th width ="150">이미지</th>
    <th width ="150">상품명</th>
    <th width ="100">단가</th>
    <th width ="100">개수</th>
    <th width ="100">합계</th>
  </tr>
  
 <c:forEach var ="imageboardDTO" items ="${requestScope.imglist}">
    <tr align="center">
      <td>${imageboardDTO.seq}</td> <%-- imageboardDTO.getseq 와 동일--%>  
      <td>                               <!-- seq는 imageboardDTO에 있음 , pg는 다시그페이지로 돌아오기 위해--> 
      <a href ="imageboardView.jsp?seq=${imageboardDTO.seq}&pg=${pg}">
      <img alt="이미지" src="../storage/${imageboardDTO.image1}" width="50" height="50">
      </a></td>
      
      <td>${imageboardDTO.imageName}</td>
      <td>${imageboardDTO.imagePrice}</td>
      <td>${imageboardDTO.imageQty}</td>
      <td>${imageboardDTO.imagePrice * imageboardDTO.imageQty}</td>
    </tr>
    
</c:forEach>

        <!-- 페이징 처리 -->
        <tr>
          <td colspan="6" align="center">
            <c:if test="${startPage > 1 }">
              <a href ="imageboardList.jsp?pg=${startPage -1}">[이전]</a>
            </c:if>    
            
                                           <!-- requestScope.startPage -->
            <c:forEach var ="i" begin = "${startPage}" end="${endPage}" step="1">
              <c:if test="${i == pg }">
              [<a id ="currentPaging" href ="imageboardList.jsp?pg=${i}">[${i}</a>]  <!-- 같은폴더인 imageboard에서 이동 //상대경로가 헷갈리면 절대경로로 --> 
               <!-- "/17-imageboard/imageboard/imageboardList.jsp?pg=${i}" -->
              </c:if>
              
             <c:if test="${i != pg}">
                [<a id ="paging" href ="imageboardList.jsp?pg=${i}">[${i}</a>]  <!-- 같은폴더인 imageboard에서 이동 //상대경로가 헷갈리면 절대경로로 --> 
               <!-- "/17-imageboard/imageboard/imageboardList.jsp?pg=${i}" -->
             </c:if>             
            </c:forEach>
            
              
             <c:if test="${ endPage < totalPage }">
               <a href ="imageboardList.jsp?pg=${endPage +1 }">[다음]</a> 
             </c:if>  
          </td>
        </tr>
</table>
   
</body>
</html>