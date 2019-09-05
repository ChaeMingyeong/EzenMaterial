<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="goods.DTO.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="goods.DAO.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GoodsDAO goodsDAO = new GoodsDAO();
	List<GoodsDTO> list = new ArrayList<GoodsDTO>();
	list = goodsDAO.list();
	
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
		
		if (total > 0) {
			JSONArray item = new JSONArray();

			for (int i = 0; i < list.size(); i++) {
				//GoodsDTO goodsDTO = new GoodsDTO();
				JSONObject temp = new JSONObject();
				temp.put("code", list.get(i).getCode());
				temp.put("name", list.get(i).getName());
				temp.put("price", list.get(i).getPrice());
				temp.put("maker", list.get(i).getMaker());		
       			// json 배열에  추가
				item.put(i, temp);
			}
		
			json.put("item", item);
		}
		// 응답 
		out.println(json);
		System.out.println(json);
%>
