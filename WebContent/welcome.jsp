<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%	// ��� ���� ������ ������ ����
		Enumeration enumeration = session.getAttributeNames();
		
		while(enumeration.hasMoreElements()) {
			String sName = enumeration.nextElement().toString();
			String sValue = (String)session.getAttribute(sName);
					
			if(sValue.equals("java")) out.println(sValue + "�� �ȳ��ϼ���." + "<br>");
		}/*while end*/
	%>
	
	<a href="logout.jsp">�α׾ƿ�</a>
	
</body>
</html>