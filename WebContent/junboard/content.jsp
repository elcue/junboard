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
<title>본격! 게시판 - 게시글 리스트</title>
<style type="text/css">
     table, td, th   {
     border:1px solid green;
     }
     th{
    background-color:green;
     color:white;
     }
 </style>
<!-- 윈도우 상단에 뜨는 내용입니다. -->
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
		String sql = "select * from board where idx = " + idx;
		
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			request.setAttribute("idx", rs.getString("idx"));
			request.setAttribute("writer", rs.getString("writer"));
			request.setAttribute("regdate", rs.getString("regdate"));
			request.setAttribute("count", rs.getString("count"));
			request.setAttribute("title", rs.getString("title"));
			request.setAttribute("content", rs.getString("content"));
		}
		con.close();
	}catch(Exception e){
		out.println("Oracle database connection something problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
			
%>





<body>
	<h1>게시글 조회</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<td>${idx}</td>
			<th>작성자</th>
			<td>${writer}</td>
			<th>날짜</th>
			<td>${regdate}</td>
			<th>조회수</th>
			<td>${count}</td>
		</tr>
			
			<tr>
			
				<th colspan="2">제목</th>
				<td colspan="6">${ title}</td>
			</tr>
			
			<tr>
				<th colspan="2">내용</th>
				<td colspan="6">${content }</td>
			</tr>	
	</table>
	<a href="delete.jsp?idx=${idx}"> 게시글 삭제</a>
	<a href="../list.do">목록으로</a>
</body>

</html>