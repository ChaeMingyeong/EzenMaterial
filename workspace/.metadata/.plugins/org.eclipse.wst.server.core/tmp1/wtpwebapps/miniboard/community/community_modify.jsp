<%@page import="org.json.JSONObject"%>
<%@page import="jdk.nashorn.api.scripting.JSObject"%>
<%@page import="community.dao.CommunityDAO"%>
<%@page import="community.bean.CommunityDTO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //post방식일때, 한글처리 
	String user_name = request.getParameter("user_name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String user_pwd = request.getParameter("user_pwd");
	String str_seq = request.getParameter("seq");
	int seq = 0;
	if(str_seq !=null){ //equals("") 이 부분은 postman seq 체크해두고 입력 아무것도 하지 않았을 경우 
	  if(!str_seq.trim().equals("") && str_seq.matches("^[0-9]*$")){
		seq = Integer.parseInt(str_seq);
	  }
	}
	 CommunityDTO communityDTO = new CommunityDTO();
	   communityDTO.setUser_name(user_name);
	   communityDTO.setUser_pwd(user_pwd);
	   communityDTO.setEmail(email);
	   communityDTO.setSubject(subject);
	   communityDTO.setContent(content);
	   communityDTO.setSeq(seq);
	   
	   CommunityDAO communityDAO = new CommunityDAO();
	   int result = communityDAO.communityModify(communityDTO);
	   
	   String rt = null;
	   if(result >0){
		   rt = "OK";
	   }else{
		   rt = "FAIL";
	   }
	   
	   JSONObject json = new JSONObject();
	   json.put("rt", rt);
	   json.put("seq", seq);
	   out.println(json);
	   
	   System.out.println(json);
	   
%>
