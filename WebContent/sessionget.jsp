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
		//게터로 세션 속성 가지고 오기(반환값은 무조건 오브젝트 타입)
		Object obj1 = session.getAttribute("mySessionName");
		String mySessionName = (String)obj1; //스트링으로 캐스팅
		out.println(mySessionName +"<br />");
		
		Object obj2 = session.getAttribute("myNum");
		Integer myNum = (Integer)obj2;
		out.println(myNum +"<br />");
		
		out.println("--------------- <br />");
		
		String sName;
		String sValue;
		/*Enumeration은 순서를 가지고 있는 배열의 한 종류라고 생각하시면 됩니다.
Enumeration의 가장 중요한 개념이 커서라는 것입니다.
커서란 현재의 위치를 가리키고 있는 것인데 최초 0부터 시작합니다.
hanMoreElement()는 커서 바로 앞에 데이타가 들어있는지를 체크하는 것입니다.
현재 커서가 0이라면 첫번째칸을 가리키기 때문에 데이타가 하나라도 들어있다면
true를 리턴해 줍니다.
https://m.blog.naver.com/PostView.nhn?blogId=unicone&logNo=60065986564&proxyReferer=https%3A%2F%2Fwww.google.com%2F*/
		Enumeration enumeration = session.getAttributeNames(); //모든 네임 가지고 오기
		while(enumeration.hasMoreElements()){ //데이터가 있기 때문에 true 반환 따라서 모두 실행
			sName = enumeration.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName : " + sName + "<br>");
			out.println("sValue : " + sValue + "<br>");
		}
		
		out.println("--------------- <br>");
		
		//sessionID : 한 브라우저당 고유한 값 생성됨(컨테이너가 알아서 생성)
		String sessionID = session.getId();
		out.println("sessionID : " + sessionID + "<br>");
		int sessionInter =  session.getMaxInactiveInterval(); //유효시간(기본 30분)
		out.println("sessionInter : " + sessionInter + "<br>");
		
		out.println("--------------- <br>");
		
		session.removeAttribute("mySessionName"); //해당 세션 삭제
		Enumeration enumeration1 = session.getAttributeNames();
		while(enumeration1.hasMoreElements()){
			sName = enumeration1.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName : " + sName + "<br>");
			out.println("sValue : " + sValue + "<br>");
		}
		
		out.println("--------------- <br>");
		
		session.invalidate(); //세션에 있는 모든 데이터 삭제
		if(request.isRequestedSessionIdValid()) { //유효한 세션 있는지 물어봄
			out.println("session valid");
		}/*if end*/ else {
			out.println("session invalid");
		}/*else end*/
	%>

</body>
</html>