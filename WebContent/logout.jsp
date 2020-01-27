<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%	//모든 세션 값 가지고 오기
		Enumeration enumeration = session.getAttributeNames();
	
		while(enumeration.hasMoreElements()) {
			String sName = enumeration.nextElement().toString();
			String sValue = (String)session.getAttribute(sName);
			
			if(sValue.equals("abcde")) session.removeAttribute(sName);
		}/*while end*/
		
	%>
	
	<a href="sessiontest.jsp">sessionTest</a>
	
</body>
</html>