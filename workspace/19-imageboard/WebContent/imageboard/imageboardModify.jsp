<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    //ModifyForm에서 인코딩타입을 multipart/form-data으로 해 놓았기 때문에  받을 때 이렇게 multi로 데이처터처리함 
	
    String realFolder = request.getServletContext().getRealPath("/storage");
	System.out.println("realFolder = " + realFolder);
	//realFolder = D:\android_3rd_mingyeong\jsp\workspace\.metadata\.plugin
	//org.eclipse.wst.server.core\tmp1\wtpwebapps\17-imageboard\storage

	MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "UTF-8");
	request.setCharacterEncoding("UTF-8");

	String imagdId = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getOriginalFileName("image1");
    int seq = Integer.parseInt(multi.getParameter("seq"));
    int pg = Integer.parseInt(multi.getParameter("pg"));
	
	//DB작업 
	ImageboardDTO imgboardDto = new ImageboardDTO();
	imgboardDto.setSeq(seq); 
	imgboardDto.setImagdId(imagdId);
	imgboardDto.setImageName(imageName);
	imgboardDto.setImagePrice(imagePrice);
	imgboardDto.setImageQty(imageQty);
	imgboardDto.setImageContent(imageContent);
	imgboardDto.setImage1(image1);
		
	ImageboardDAO imgboardDao = new ImageboardDAO();
	int su = imgboardDao.imageboardModify(imgboardDto);
	request.setAttribute("su", su);
	request.setAttribute("pg", pg);
	
	RequestDispatcher dispatcher = 
			request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyResult");
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