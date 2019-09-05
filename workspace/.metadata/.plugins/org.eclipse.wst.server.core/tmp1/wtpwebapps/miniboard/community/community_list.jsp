<%@page import="files.dao.FilesDAO"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="jdk.nashorn.api.scripting.JSObject"%>
<%@page import="community.bean.CommunityDTO"%>
<%@page import="java.util.List"%>
<%@page import="community.dao.CommunityDAO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//DB
	CommunityDAO communityDAO = new CommunityDAO();
	List<CommunityDTO> list = communityDAO.communityList();

	//JSON
	String rt = null;
	int total = list.size(); //조회된 데이터 수                                               

	//조회된 데이터 수로 성공/실패 판단
	if (total > 0) {
		rt = "OK";
	} else {
		rt = "FAIL";
	}
	//json 객체 생성
	JSONObject json = new JSONObject();
	json.put("rt", rt);
	json.put("total", total);
	//json.put("item", list);

	//json 배열 만들기 
	if (total > 0) {
		JSONArray item = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			CommunityDTO communityDTO = list.get(i);
			JSONObject temp = new JSONObject();
			temp.put("seq", communityDTO.getSeq());
			temp.put("user_name", communityDTO.getUser_name());
			temp.put("user_pwd", communityDTO.getUser_pwd());
			temp.put("email", communityDTO.getEmail());
			temp.put("subject", communityDTO.getSubject());
			temp.put("content", communityDTO.getContent());
			temp.put("reg_date", communityDTO.getReg_date());
			temp.put("edit_date", communityDTO.getEdit_date());
		   FilesDAO filesDAO = new FilesDAO();
			String filename = filesDAO.checkFiles(communityDTO.getSeq());
			System.out.println("filename = " + filename);
			String fileURL ="";
			if(filename!=null){
				fileURL = "http://192.168.0.5:8080/miniboard/storage" + 
			              "/" + filename;
				
			}
			temp.put("filename", fileURL);
			// json 배열에  추가
			item.put(i, temp);
		}
		json.put("item", item);
	}
	// 응답 
	out.println(json);
	System.out.println(json);
    System.out.println();
%>
