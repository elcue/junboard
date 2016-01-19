<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.board.beans.Board" %> 
<%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

	
	<% 
		int idx = 1;
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String regdate = request.getParameter("regdate");
		int count = 10000;
		String content = request.getParameter("content");
		
		try {
			 
		     String driverName = "oracle.jdbc.driver.OracleDriver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.
		      String url = "jdbc:oracle:thin:@localhost:1521:orcl";            //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)
		     Class.forName(driverName);
		     Connection con = DriverManager.getConnection(url,"system","1111");
		     
		     Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성
		     
		     String sql = "INSERT INTO BOARD "+
		     
		                    "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
		     
		                    "VALUES (board_seq.nextval, '"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
		     
		    stmt.executeUpdate(sql);  
		     
		     
		     out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
		      con.close();
		 
		} catch (Exception e) {
		     out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
		 	   out.println(e.getMessage());
		     e.printStackTrace();
		}finally{
			out.print("<script>location.href='index.jsp';</script>");
		}
		
	%>



<body>

</body>
</html>