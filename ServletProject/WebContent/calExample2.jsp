<%@page import="javax.script.ScriptException"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="javax.script.ScriptEngine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String value = request.getParameter("value");
		System.out.print(value);
		String operator = request.getParameter("operator");
		
		String exp = request.getParameter("exp");
		if (exp == null) exp = "0";
		
		if (operator!= null && operator.equals("=")) {
	
			ScriptEngine engine = new ScriptEngineManager().getEngineByName("JavaScript");
			
			try {
				exp = String.valueOf(engine.eval(exp));
			} catch (ScriptException e) {
				e.printStackTrace();
			}
			
		} else {
			exp += (value == null) ? "" : value;
			exp += (operator == null) ? "" : operator;		
			System.out.print(exp);
		}
		
		if(operator != null && operator.equals("C")) {
			exp = "0";
		}
		
		request.setAttribute("exp", exp);
	
		RequestDispatcher rd = request.getRequestDispatcher("jspcalpage.jsp");
		rd.forward(request, response);
	%>

</body>
</html>