<%@page import="org.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="member2.dao.MemberDAO"%>
<%@page import="member2.bean.MemberDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

  MemberDAO memberDAO = new MemberDAO();
  List<MemberDTO> list = memberDAO.memberlist();
  

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
			MemberDTO memberDTO = list.get(i);
			JSONObject temp = new JSONObject();
			temp.put("phone", memberDTO.getPhone());
			temp.put("name", memberDTO.getName());
			temp.put("addr", memberDTO.getAddr());
			temp.put("email", memberDTO.getEmail());
			temp.put("logtime", memberDTO.getLogtime());
			temp.put("filename", memberDTO.getFilename());
			String filename = memberDTO.getFilename();
			 System.out.println("filename = " + filename);
			String fileURL = "";
			if(filename!=null){
				fileURL = "http://192.168.0.5:8080/app_test1/storage" + 
			              "/" + filename;
				
			}
			temp.put("fileURL", fileURL);
			// json 배열에  추가
			item.put(i, temp);
		}
		json.put("item", item);
	}	
	out.println(json);
	System.out.println(json);
    System.out.println();
	
%>