<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		//외부객체 세션 이용
		session.setAttribute("mySessionName", "mySessionData");
		session.setAttribute("myNum", 12345); //여러개 지정 가능
	%>
	
	<a href="sessionget.jsp">session get</a>
</body>
</html>