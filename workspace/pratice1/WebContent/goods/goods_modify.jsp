<%@page import="org.json.JSONObject"%>
<%@page import="goods.DAO.GoodsDAO"%>
<%@page import="goods.DTO.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String code = request.getParameter("code");
	String name = request.getParameter("name");
	String str_price = request.getParameter("price");
	int price = 0;
	if (str_price != null) { //equals("") 이 부분은 postman seq 체크해두고 입력 아무것도 하지 않았을 경우 
		if (!str_price.trim().equals("") && str_price.matches("^[0-9]*$")) {
			price = Integer.parseInt(str_price);
		}
	}
	String maker = request.getParameter("maker");
	
	GoodsDTO goodsDTO = new GoodsDTO();
    goodsDTO.setCode(code);
    goodsDTO.setName(name);
    goodsDTO.setPrice(price);
    goodsDTO.setMaker(maker);
    GoodsDAO goodsDAO = new GoodsDAO();
    int result = goodsDAO.goodsModify(goodsDTO);
    
    String rs = null;
    if(result>0){
    	rs ="modifyOK";
    }else{
    	rs ="modifyFAIL";
    }
    
   JSONObject json = new JSONObject();
    json.put("rs", rs);
    out.println(json);
    System.out.println(json);

  %>