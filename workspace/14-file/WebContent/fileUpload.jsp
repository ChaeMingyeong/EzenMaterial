<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% //데이터 처리: 문자열 + 파일 
   //실제 저장 폴더 위치 찾기(=업로드할 실제 서버경로)
   String realFolder = request.getServletContext().getRealPath("/storage");
   System.out.println("realFolder = " +realFolder);
   //파일 저장                                       
   //cos.jar의 클래스  클라이언트에서 넘어온 정보가 request에게 전달됨(얘가 문자열과 파일을 담고있음)
     MultipartRequest multi = new MultipartRequest(request, realFolder, 
		   5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()); //파일용량설정, encoding설정
		                                // new MultipartRequest하면 실제로 storage에 파일이 저장됨 
                                        //renamePolicy 생략하면 똑같은 파일은 저장안됨.
   //String subject = request.getParameter("subject");  //request로는 넘어온 데이터를 꺼낼 수 없다(문자열만가능)
   //String content = request.getParameter("content");
   //enctype="multipart/form-data" 방식으로 데이터를 넘기면 파일형식으로 data가 넘어간다고 함
   //그래서 일반 request.getParameter 를 이용해서 data를 가져올 수 없음.


  
     String subject =  multi.getParameter("subject");
     String content =  multi.getParameter("content");
     
     //클라이언트에서 넘어온 파일 이름 
     String originalFileName1 = multi.getOriginalFileName("upload1");
     String originalFileName2 = multi.getOriginalFileName("upload2");
     
     //서버에 저장되는 파일 이름
     String fileName1 = multi.getFilesystemName("upload1");
     String fileName2 = multi.getFilesystemName("upload2");
     
     //파일 크기 
     File file1 = multi.getFile("upload1");
     File file2 = multi.getFile("upload2");
     System.out.println("file1 = " + file1);
     
     long fileSize1 = 0;
     long fileSize2 = 0;
     
     if(file1 != null) fileSize1 =file1.length();
     if(file2 != null) fileSize2 =file2.length();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
   <li>제목 : <%= subject %></li>
   <li>내용 : <%= content %></li>
   <li>파일 : <%= originalFileName1 %> &nbsp;&nbsp;&nbsp;&nbsp;
             <a href ="fileDownload.jsp?fileName=<%= URLEncoder.encode(fileName1, "UTF-8") %> ">
             <%= fileName1 %></a>
   <li>크기: <%= fileSize1 %> </li>
   <br><br>
   <li>파일: <%= originalFileName2 %>
            <%= fileSize2 %> </li>

   <li>크기: <%= fileSize2 %> </li>
            
</ul>

</body>
</html>