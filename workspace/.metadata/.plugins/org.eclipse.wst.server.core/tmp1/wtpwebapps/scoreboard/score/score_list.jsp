<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="score.bean.ScoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="score.dao.ScoreDAO"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

    ScoreDAO scoreDAO = new ScoreDAO();
    List<ScoreDTO> list = scoreDAO.scoreList();
   
    String rt = null;
	int total = list.size();                           
    
    if (total > 0) {
		rt = "listOK";
	} else {
		rt = "listFAIL";
	}
	//json 객체 생성
	JSONObject json = new JSONObject();
	json.put("rt", rt);
	json.put("total", total);
	
	if(total>0){
		JSONArray item = new JSONArray();
		for(int i=0; i<list.size(); i++){
			ScoreDTO scoreDTO = list.get(i);
			JSONObject temp = new JSONObject();
			temp.put("studNo", scoreDTO.getStudNo());
			temp.put("name", scoreDTO.getName());
			temp.put("kor", scoreDTO.getKor());
			temp.put("eng", scoreDTO.getEng());
			temp.put("mat", scoreDTO.getMat());
			temp.put("tot", scoreDTO.getTot());
			temp.put("avg", scoreDTO.getAvg());
			temp.put("logtime",scoreDTO.getLogtime());
			item.put(i, temp);
		}
		json.put("item", item);
	}
	out.println(json);
	System.out.println(json);
    System.out.println();

%>