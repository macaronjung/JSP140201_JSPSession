<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%!
		String id, pw;
	%>
	
	<%
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		if(id.equals("java") && pw.equals("1234")) {
			session.setAttribute("id", id); //쿠키가 아닌 세션에 저장
			response.sendRedirect("welcome.jsp");
		}/*if end*/ else {
			response.sendRedirect("login.html");
		}/*else end*/
	%>
</body>
</html>