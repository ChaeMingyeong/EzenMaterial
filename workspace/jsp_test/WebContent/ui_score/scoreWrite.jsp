
<%@page import="bean.ScoreDTO"%>
<%@page import="dao.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int hak = Integer.parseInt(request.getParameter("hak"));
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	int tot = kor + eng + mat;
	double avg = (double) tot / 3;

	ScoreDTO scoreDTO = new ScoreDTO();
	ScoreDAO scoreDAO = new ScoreDAO();
	scoreDTO.setHak(hak);
	scoreDTO.setName(name);
	scoreDTO.setKor(kor);
	scoreDTO.setEng(eng);
	scoreDTO.setMat(mat);
	int su = scoreDAO.ScoreWrite(scoreDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    
<%if (su > 0) {%>
	alert("성적 입력이 완료되었습니다.");
<%} else {%>
	alert("성적 입력 실패")
<%}%>
	location.href = "scoreList.jsp?pg=1";
</script>
</head>
<body>
  

</body>
</html>