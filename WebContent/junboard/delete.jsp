<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.board.beans.Board" %> 
<%@ page import="java.util.ArrayList" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����! �Խ��� - �Խñ� ����</title>
<style type="text/css">
     table, td, th   {
     border:1px solid green;
     }
     th{
    background-color:green;
     color:white;
     }
 </style>
<!-- ������ ��ܿ� �ߴ� �����Դϴ�. -->
</head>
<%
		String idx = request.getParameter("idx");

	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		ResultSet rs = null;
		Class.forName(driverName);
		
		Connection con = DriverManager.getConnection(url, "system", "1111");
		out.println("Oracle Database Connection Success.");
		
		Statement stmt = con.createStatement();
		String sql = "delete from board where idx = " + idx ;
		rs = stmt.executeQuery(sql);
		
		con.close();
	}catch(Exception e){
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>

<script>
	alert("�Խñ��� �����Ǿ����ϴ�.");
	location.href="redirect.jsp";

</script>

	

<body>
</body>

</html>