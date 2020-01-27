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

	<%
		//���ͷ� ���� �Ӽ� ������ ����(��ȯ���� ������ ������Ʈ Ÿ��)
		Object obj1 = session.getAttribute("mySessionName");
		String mySessionName = (String)obj1; //��Ʈ������ ĳ����
		out.println(mySessionName +"<br />");
		
		Object obj2 = session.getAttribute("myNum");
		Integer myNum = (Integer)obj2;
		out.println(myNum +"<br />");
		
		out.println("--------------- <br />");
		
		String sName;
		String sValue;
		/*Enumeration�� ������ ������ �ִ� �迭�� �� ������� �����Ͻø� �˴ϴ�.
Enumeration�� ���� �߿��� ������ Ŀ����� ���Դϴ�.
Ŀ���� ������ ��ġ�� ����Ű�� �ִ� ���ε� ���� 0���� �����մϴ�.
hanMoreElement()�� Ŀ�� �ٷ� �տ� ����Ÿ�� ����ִ����� üũ�ϴ� ���Դϴ�.
���� Ŀ���� 0�̶�� ù��°ĭ�� ����Ű�� ������ ����Ÿ�� �ϳ��� ����ִٸ�
true�� ������ �ݴϴ�.
https://m.blog.naver.com/PostView.nhn?blogId=unicone&logNo=60065986564&proxyReferer=https%3A%2F%2Fwww.google.com%2F*/
		Enumeration enumeration = session.getAttributeNames(); //��� ���� ������ ����
		while(enumeration.hasMoreElements()){ //�����Ͱ� �ֱ� ������ true ��ȯ ���� ��� ����
			sName = enumeration.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName : " + sName + "<br>");
			out.println("sValue : " + sValue + "<br>");
		}
		
		out.println("--------------- <br>");
		
		//sessionID : �� �������� ������ �� ������(�����̳ʰ� �˾Ƽ� ����)
		String sessionID = session.getId();
		out.println("sessionID : " + sessionID + "<br>");
		int sessionInter =  session.getMaxInactiveInterval(); //��ȿ�ð�(�⺻ 30��)
		out.println("sessionInter : " + sessionInter + "<br>");
		
		out.println("--------------- <br>");
		
		session.removeAttribute("mySessionName"); //�ش� ���� ����
		Enumeration enumeration1 = session.getAttributeNames();
		while(enumeration1.hasMoreElements()){
			sName = enumeration1.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName : " + sName + "<br>");
			out.println("sValue : " + sValue + "<br>");
		}
		
		out.println("--------------- <br>");
		
		session.invalidate(); //���ǿ� �ִ� ��� ������ ����
		if(request.isRequestedSessionIdValid()) { //��ȿ�� ���� �ִ��� ���
			out.println("session valid");
		}/*if end*/ else {
			out.println("session invalid");
		}/*else end*/
	%>

</body>
</html>