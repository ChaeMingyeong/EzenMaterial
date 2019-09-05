<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

     //이미지 상세화면에서 수정하기 버튼을 눌렀을 때 onclick 속성에서 보내준 seq와 pg 값 꺼내오기  
     int seq = Integer.parseInt(request.getParameter("seq"));
     int pg = Integer.parseInt(request.getParameter("pg")); 
     
     ImageboardDTO imageboardDTO = new ImageboardDTO();
     ImageboardDAO imageboardDAO = new ImageboardDAO();
     imageboardDTO = imageboardDAO.selectboard(seq);
     
     //데이터공유 seq, pg, imageboardDTO 총 세개 공유  
     request.setAttribute("seq", seq);
     request.setAttribute("pg", pg); //출발한곳으로 되돌아가기 위해 
     request.setAttribute("imageboardDTO", imageboardDTO);
     //ModifyFormReady(현재) -> modifyForm - > modify
     //request 는 다음 페이지까지 밖에 못 넘어감 
                                                        
     RequestDispatcher dispatcher =                       //imageboardModifyForm를 메인화면쪽에 보내줌 
    request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyForm");
     dispatcher.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>