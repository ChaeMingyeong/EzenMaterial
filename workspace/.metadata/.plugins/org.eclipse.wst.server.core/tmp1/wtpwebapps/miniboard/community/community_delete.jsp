<%@page import="files.dao.FilesDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.json.JSONObject"%>
<%@page import="community.dao.CommunityDAO"%>
<%@page import="community.bean.CommunityDTO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  // 데이터 
	request.setCharacterEncoding("UTF-8"); //post방식일때, 한글처리	
	String str_seq = request.getParameter("seq");
	String user_pwd = request.getParameter("user_pwd");
	int seq = 0;
	if(str_seq!=null){
		if(!str_seq.trim().equals("") && str_seq.matches("^[0-9]*$")){
			seq = Integer.parseInt(str_seq);
		}
	}
	//실제 폴더위치
	String dir = request.getServletContext().getRealPath("/storage");
	
	// DB 
	CommunityDTO communityDTO = new CommunityDTO();
	communityDTO.setSeq(seq);
	//communityDTO.setUser_pwd(user_pwd);
	
	CommunityDAO communityDAO = new CommunityDAO();
	int result = communityDAO.communityDelete(seq, user_pwd);
	
	System.out.println(result);
	String rt = null;
	if(result>0){
		rt ="OK";
		System.out.println("OK1");
	}else{
		rt ="FAIL";
		System.out.println("FAIL1");
	}
	//게시판 글을 지운 후에 파일 삭제 
	String filename =null;
	if(rt.equals("OK")){
		
		  FilesDAO filesDAO = new FilesDAO();
		 //파일이 있는지 검사해서, 있으면 파일이름 얻어오기 
		 filename = filesDAO.checkFiles(seq);
		 System.out.println("filename = " + filename);
		 int result2=0;
		 //파일이 있으면 삭제 
		 if(filename!=null){
			 String filePath = dir + "/" + filename;
			 result2=filesDAO.filesDelete(seq, filePath);
			 if(result2>0){
				 rt="OK"; //파일까지 지워야만 OK
				 System.out.println("OK2");
			 }else{
				 rt ="FAIL";
				 System.out.println("FAIL2");
			 }
		 }
		
	}
	
	
	
	JSONObject json = new JSONObject(); // { } : 객체 생성 직후에는  텅 빈 { }만 만들어진 것임 
	 json.put("rt", rt); // { "rt" : "OK" } 또는 { "rt" : "FAIL" }
	 out.println(json);
	   
     System.out.println(json);
%>
<!DOCTYPE html>
