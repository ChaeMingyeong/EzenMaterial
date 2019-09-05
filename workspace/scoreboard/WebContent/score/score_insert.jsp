<%@page import="org.json.JSONObject"%>
<%@page import="score.dao.ScoreDAO"%>
<%@page import="score.bean.ScoreDTO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   request.setCharacterEncoding("UTF-8");
  String studNo = request.getParameter("studNo");
  String name = request.getParameter("name");
  String str_kor = request.getParameter("kor");
  String str_eng = request.getParameter("eng");
  String str_mat = request.getParameter("mat");
  
  int kor =0;
  int eng =0;
  int mat =0;
 if(str_kor!=null){
	 if(!str_kor.trim().equals("")&&str_kor.matches("^[0-9]*$")){
		 kor = Integer.parseInt(str_kor);
	 }
 }
 if(str_eng!=null){
	 if(!str_eng.trim().equals("")&&str_eng.matches("^[0-9]*$")){
		 eng = Integer.parseInt(str_eng);
	 }
 }
 if(str_mat!=null){
	 if(!str_mat.trim().equals("")&&str_mat.matches("^[0-9]*$")){
		 mat = Integer.parseInt(str_mat);
	 }
 }
 // int tot = Integer.parseInt(request.getParameter("kor"));
 // double avg = Integer.parseInt(request.getParameter("avg"));
  int tot = kor+eng + mat;
  double avg = (double)tot/3;
 
  ScoreDTO scoreDTO = new ScoreDTO();
  scoreDTO.setStudNo(studNo);
  scoreDTO.setName(name);
  scoreDTO.setKor(kor);
  scoreDTO.setEng(eng);
  scoreDTO.setMat(mat);
  scoreDTO.setTot(tot);
  scoreDTO.setAvg(avg);
  
  ScoreDAO scoreDAO =new ScoreDAO();
  int result =scoreDAO.scoreWrite(scoreDTO);
  
  String rt = null;
  if(result>0){
	  rt ="writeOK";
  }else{
	  rt = "writeFail";
  }
  
  JSONObject json = new JSONObject();
  json.put("rt", rt);
  out.println(json);
  System.out.println(json);
%>