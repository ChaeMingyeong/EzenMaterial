
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //Data 처리 
   //실제 폴더 위치 
   String realFolder = request.getServletContext().getRealPath("/storage");
   System.out.println("realFolder = " + realFolder);
   //realFolder = D:\android_3rd_mingyeong\jsp\workspace\.metadata\.plugin
   //org.eclipse.wst.server.core\tmp1\wtpwebapps\17-imageboard\storage
   
   MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8");
   request.setCharacterEncoding("UTF-8");
   
   
   String imagdId = multi.getParameter("imageId");		 
   String imageName = multi.getParameter("imageName");
   int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
   int imageQty  = Integer.parseInt(multi.getParameter("imageQty"));
   String imageContent = multi.getParameter("imageContent");
   String image1 = multi.getOriginalFileName("image1");
   
   //DB작업 
   ImageboardDTO imgboardDto = new ImageboardDTO();
   imgboardDto.setImagdId(imagdId);
   imgboardDto.setImageName(imageName);
   imgboardDto.setImagePrice(imagePrice);
   imgboardDto.setImageQty(imageQty);
   imgboardDto.setImageContent(imageContent);
   imgboardDto.setImage1(image1);
   ImageboardDAO imgboardDao = new ImageboardDAO();
   int su = imgboardDao.imgboardWrite(imgboardDto); 
   
   //데이터공유 
   request.setAttribute("su", su);  //요청해서 응답받을 때 까지만 살아있음  
   request.setAttribute("imageName", imageName); //요청해서 응답받을 때 까지만 
   
   //파일이동(화면이동)                               //get방식은직접적어줄때는 문제없고 자바코드적어줄때만 문제있음 include 
   RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardWriteResult");
   dispatcher.forward(request, response);        //index에서 포함시켜서 보여줌   
   //request에 담긴 정보를 저장하고 있다가 그 다음 페이지 및  그 다다음 페이지에도 해당정보를 볼 수 있게 계속 저장 
   //forward : 서버내 페이지 이동, ../main/index.jsp로  (imagboardWriteResult 데이터를 가지고)request 객체를 이동시킴 
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