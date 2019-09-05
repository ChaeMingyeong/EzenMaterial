<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 쓰기위해서 taglib에 지시자를 써줌 -->
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  html, body{
    margin: 0;
    padding: 0;
    height: 100%; 
  }
  
  #header{
    text-align: center;
    border: 1px solid gray; 
    width: 100%; 
    height: 10%;
   
  }
  
 
  
  #container{
    width: 100%;
    height: 500px; 
  }
  
  
  #container:after{
    content: "";
    display: block;
    clear: both;
  }
  
  #nav{
   width: 20%;
   height: 100%; 
   float: left;
   background-color: orange;
  }
  
  #section{
   width: 80%;
   height: 100%;
   float: left;
   
  }
  
  #footer{
    width: 100%;
    height: 10%;
    text-align: center;
    border-top: 1px solid gray;
    
  }
  
</style>
</head>
<body>
<div id ="header">
  <h1 id ="font">이미지 게시판</h1>
</div>

<div id ="container">
    <div id ="nav">
		<h3><a href="/19-imageboard/main/index.jsp">메인화면</a></h3><br>
		
		<a href="/19-imageboard/main/index.jsp?req=boardList">글목록</a><br>
		<c:if test="${sessionScope.memId ==null}"> <!-- sessionScope생략하고 memId만사용가능 -->	
		<a href="/19-imageboard/main/index.jsp?req=writeForm">회원가입</a><br>
		<a href="/19-imageboard/main/index.jsp?req=loginForm">로그인</a><br>
		</c:if>
		 <!-- \${sessonScope.memId} : ${sessionScope.memId}:세션쪽에서넘어온데이터 --> 
		<c:if test="${sessionScope.memId !=null }">
		<a href="/19-imageboard/main/index.jsp?req=boardWriteForm">글쓰기</a><br>
		<a href="/19-imageboard/main/index.jsp?req=logout">로그아웃</a><br>
		<a href="/19-imageboard/main/index.jsp?req=modifyForm">회원정보수정</a><br>
		<a href="/19-imageboard/main/index.jsp?req=deleteForm">회원탈퇴</a><br>
		<a href="/19-imageboard/main/index.jsp?req=memberList&pg=1">회원목록</a><br>
		</c:if>
		
		
		<a href ="/19-imageboard/main/index.jsp?req=imageboardWriteForm">이미지등록</a><br> <!-- 데이터처리없는애는 인데스를 바로보여줌 -->
		
		<a href ="/19-imageboard/imageboard/imageboardList.jsp?pg=1">이미지목록</a><br> <!-- 데이터처리있는애  -->
	</div>
	
	<div id ="section">
	    <c:if test="${param.req ==null }">
	     <jsp:include page="body.jsp"/>
	    </c:if>
	    
	    <c:if test="${param.req == 'imageboardWriteForm' }">
	     <jsp:include page="../imageboard/imageboardWriteForm.jsp"/>       <!-- 컴파일시킨걸 가져와서 include -->
	     </c:if>                                                             <!-- 데이터처리 ->인덱스-> include -->
	     
	     <c:if test="${param.req == 'imageboardWriteResult' }">
	     <jsp:include page="../imageboard/imageboardWriteResult.jsp"/>
	     </c:if> 
	     
		     
	     <c:if test="${param.req == 'imageboardListResult' }">
	     <jsp:include page="../imageboard/imageboardListResult.jsp"/>
	     </c:if> 
	     
	      <c:if test="${param.req == 'imageboardViewResult' }">
	     <jsp:include page="../imageboard/imageboardViewResult.jsp"/>
	     </c:if> 
	     
	     <c:if test="${param.req == 'imageboardDeleteResult' }">
	     <jsp:include page="../imageboard/imageboardDeleteResult.jsp"/>
	     </c:if>
	  
	    <c:if test="${param.req == 'imageboardModifyForm' }">
	     <jsp:include page="../imageboard/imageboardModifyForm.jsp"/>
	     </c:if>
	    
	    <c:if test="${param.req == 'imageboardModifyResult' }">
	     <jsp:include page="../imageboard/imageboardModifyResult.jsp"/>
	     </c:if>
	     <!-- 회원관리 -->
	     <c:if test="${param.req == 'loginForm' }">
	     <jsp:include page="../member/loginForm.jsp"/>
	     </c:if>
	     
	     <c:if test="${param.req == 'loginOk' }">
	     <jsp:include page="../member/loginOk.jsp"/>
	     </c:if>
	     
	     <c:if test="${param.req == 'loginFail' }">
	     <jsp:include page="../member/loginFail.jsp"/>
	     </c:if>
	     
	     <c:if test="${param.req == 'logout' }">
	     <jsp:include page="../member/logout.jsp"/>
	     </c:if>
	     
	     
	     <c:if test="${param.req == 'writeForm' }">
	     <jsp:include page="../member/writeForm.jsp"/>
	     </c:if>
	     
	     <c:if test="${param.req == 'write' }">
	     <jsp:include page="../member/write.jsp"/>
	     </c:if>
	     
	      <c:if test="${param.req == 'modifyForm' }">
	     <jsp:include page="../member/modifyForm.jsp"/>
	     </c:if>
	     
	     <c:if test="${param.req == 'modify' }">
	     <jsp:include page="../member/modify.jsp"/>
	     </c:if>
	     
	     <c:if test="${param.req == 'deleteForm' }">
	     <jsp:include page="../member/deleteForm.jsp"/>
	     </c:if>
	     
	     <c:if test="${param.req == 'delete' }">
	     <jsp:include page="../member/delete.jsp"/>
	     </c:if>
	     
	      <c:if test="${param.req == 'memberList' }">
	     <jsp:include page="../member/memberList.jsp"/>
	     </c:if>
	     
	     
	     <!-- 글관리 -->
	     <c:if test="${param.req == 'boardList' }">
	     <jsp:include page="../board/boardList.jsp"/> <!-- include는 파일에 데이터값을 주지못하고 걍 뜨게만 -->
	     </c:if>
	     
	     <c:if test="${param.req == 'boardWriteForm' }">
	     <jsp:include page="../board/boardWriteForm.jsp"/> 
	     </c:if>
	     
	     <c:if test="${param.req == 'boardWrite' }">
	     <jsp:include page="../board/boardWrite.jsp"/> 
	     </c:if>
	     
	     <c:if test="${param.req == 'boardView' }">
	     <jsp:include page="../board/boardView.jsp"/> 
	     </c:if>
	     
	     <c:if test="${param.req == 'boardModifyForm' }">
	     <jsp:include page="../board/boardModifyForm.jsp"/> 
	     </c:if>
	     
	     <c:if test="${param.req == 'boardModify' }">
	     <jsp:include page="../board/boardModify.jsp"/> 
	     </c:if>
	     
	     <c:if test="${param.req == 'boardDelete' }">
	     <jsp:include page="../board/boardDelete.jsp"/> 
	     </c:if>
	    
	</div>
</div>

<div id = "footer">
   <p>Ezen IT Academy</p>
</div>
</body>
</html>