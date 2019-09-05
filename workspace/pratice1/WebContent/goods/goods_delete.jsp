<%@page import="org.json.JSONObject"%>
<%@page import="goods.DAO.GoodsDAO"%>
<%@page import="goods.DTO.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String code = request.getParameter("code");
	
	GoodsDTO goodsDTO = new GoodsDTO();
    goodsDTO.setCode(code);
    GoodsDAO goodsDAO = new GoodsDAO();
    
    int result = goodsDAO.goodsDelete(goodsDTO);
    
    String rs= null;
    if(result>0){
    	rs="deleteOK";
    }else{
    	rs="deleteFAIL";
    }
    
    JSONObject json = new JSONObject();
    json.put("rs", rs);
    out.println(json);
    System.out.println(json);
%>
<!DOCTYPE html>
