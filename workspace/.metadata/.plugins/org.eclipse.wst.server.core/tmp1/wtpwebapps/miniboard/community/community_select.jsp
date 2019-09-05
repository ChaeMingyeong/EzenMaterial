<%@page import="files.dao.FilesDAO"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="community.dao.CommunityDAO"%>
<%@page import="community.bean.CommunityDTO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	/*String user_name = request.getParameter("user_name");
	String user_pwd = request.getParameter("user_pwd");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");*/
	String str_seq = request.getParameter("seq");
	int seq = 0;
	if(str_seq !=null){
		if(!str_seq.trim().equals("")&&str_seq.matches("^[0-9]*$")){
		      seq = Integer.parseInt(str_seq);	
		}
	}
			
	//DB
	/*CommunityDTO communityDTO = new CommunityDTO();
	communityDTO.setSeq(seq);
	communityDTO.setUser_name(user_name);
	communityDTO.setUser_pwd(user_pwd);
	communityDTO.setEmail(email);
	communityDTO.setSubject(subject);
	communityDTO.setContent(content);*/

	CommunityDAO communityDAO = new CommunityDAO();
    CommunityDTO communityDTO = communityDAO.viewCommunity(seq);

  //JSON
  	String rt = null;                                               

  	//조회된 데이터 수로 성공/실패 판단
  	if (communityDTO!=null) {
  		rt = "OK";
  	} else {
  		rt = "FAIL";
  	}
  	//json 객체 생성
  	JSONObject json = new JSONObject();
  	json.put("rt", rt);
  	json.put("total", 1);

  	//json 배열 만들기 
  	if (communityDTO!=null) {
  		JSONArray item = new JSONArray();
  		JSONObject temp = new JSONObject();
  		//파일이름 얻어오기
  		FilesDAO filesDAO = new FilesDAO();
		String filename = filesDAO.checkFiles(communityDTO.getSeq());
		String fileURL ="";
		if(filename!=null){
			fileURL = "http://192.168.0.5:8080/miniboard/storage" + 
		              "/" + filename;		
		}	
  			temp.put("seq", communityDTO.getSeq());
  			temp.put("user_name", communityDTO.getUser_name());
  			temp.put("user_pwd", communityDTO.getUser_pwd());
  			temp.put("email", communityDTO.getEmail());
  			temp.put("subject", communityDTO.getSubject());
  			temp.put("content", communityDTO.getContent());
  			temp.put("reg_date", communityDTO.getReg_date());
  			temp.put("edit_date", communityDTO.getEdit_date());
  			temp.put("filename", fileURL);
  			// json 배열에  추가
  			item.put(0,temp);
  		json.put("item", item);
  	}
  	// 응답 
  	out.println(json);
  	System.out.println(json);

%>
<!DOCTYPE html>
