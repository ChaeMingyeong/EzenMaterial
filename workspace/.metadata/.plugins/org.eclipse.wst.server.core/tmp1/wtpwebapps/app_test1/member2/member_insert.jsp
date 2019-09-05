<%@page import="java.io.File"%>
<%@page import="org.json.JSONObject"%>
<%@page import="member2.dao.MemberDAO"%>
<%@page import="member2.bean.MemberDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //post방식일때, 한글처리 
 //실제 폴더 위치
 String dir = request.getServletContext().getRealPath("/storage");  //--> 이 폴더랑 똑같은 이름의 폴더를 [WebContent] -[storage폴더]에 만듬
 //요청처리객체(request가 아닌, cos.jar에 있는 multipart 객체를 사용하게 됨)
 //요청정보,저장할폴더경로,처리할최대파일크기,엔코딩설정,(+파일이름중복허용) ..디폴트는 똑같은 파일을 불러오면 불러온파일이름으로 저장됨,이때는중복허용안함
 MultipartRequest multi = new MultipartRequest(request, dir, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()); //파일을 이때 dir 폴더에 저장
 
 String phone = multi.getParameter("phone");
 String name = multi.getParameter("name");
 String req_fileName = multi.getParameter("req_fileName");
 String addr = multi.getParameter("addr");
 String logtime = multi.getParameter("logtime");   
 String email = multi.getParameter("email");
 
//DB
 MemberDTO memberDTO = new MemberDTO();
 memberDTO.setPhone(phone);
 memberDTO.setName(name);
 //memberDTO.setFileURL(fileURL);
 memberDTO.setAddr(addr);
 memberDTO.setLogtime(logtime);
 memberDTO.setEmail(email);

 String orginname = multi.getOriginalFileName("req_fileName"); 
 String filename = multi.getFilesystemName("req_fileName");
 int lastIndex = orginname.lastIndexOf(".");
 String filetype = orginname.substring(lastIndex + 1);
 File file = multi.getFile("req_fileName");
 
 int filesize =0;
 if(file!=null) filesize = (int) file.length();
 //DTO에 저장
 memberDTO.setDir(dir);
 memberDTO.setOrginname(orginname);
 memberDTO.setFilename(filename);
 memberDTO.setFiletype(filetype);
 memberDTO.setFilesize(filesize);
 System.out.println(memberDTO.getFilename() + "  --------------------");
 
 MemberDAO memberDAO = new MemberDAO();
 int result = memberDAO.memberWrite(memberDTO);
 
 String rt = null;
 if(result >0){
	   rt = "OK";
 }else{
	   rt = "FAIL";
 }
 
 
 //JSON 객체 생성
 JSONObject json = new JSONObject(); // { } : 객체 생성 직후에는  텅 빈 { }만 만들어진 것임 
 json.put("rt", rt); // { "rt" : "OK" } 또는 { "rt" : "FAIL" }
 out.println(json);
 
 System.out.println(json);
%>
