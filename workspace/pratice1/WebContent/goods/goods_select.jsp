<%@page import="goods.DAO.GoodsDAO"%>
<%@page import="goods.DTO.GoodsDTO"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");

//DB
    GoodsDTO goodsDTO = new GoodsDTO();
    goodsDTO.setCode(code);
    
    
    GoodsDAO goodsDAO = new GoodsDAO();
    goodsDTO = goodsDAO.goodsSelect(code);
  

//JSON
	String rt = null;                                               

	//조회된 데이터 수로 성공/실패 판단
	if (goodsDTO !=null) {
		rt = "selectOK";
	} else {
		rt = "selectFAIL";
	}
	//json 객체 생성
	JSONObject json = new JSONObject();
	json.put("rt", rt);
	json.put("total", 1);

	
	//json 배열 만들기 
	if (goodsDTO!=null) {
		JSONArray item = new JSONArray();
		JSONObject temp = new JSONObject();
	    temp.put("code", goodsDTO.getCode());
		temp.put("name", goodsDTO.getName());
		temp.put("price", goodsDTO.getPrice());
		temp.put("maker", goodsDTO.getMaker());
			// json 배열에  추가
			item.put(0, temp);		
		json.put("item", item);
	}
	// 응답 
	out.println(json);
	System.out.println(json);

%>
