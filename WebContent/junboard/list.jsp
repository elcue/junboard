<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.regex.Pattern"%>

<%@ page import="com.board.beans.Board" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����! �Խ��� - �Խñ� ����Ʈ</title>
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

<body>
	<!-- HTML������ �� ������ ���� �κ��Դϴ�. -->

	<h1>�Խñ� ����Ʈ</h1>
	<!-- ������ �۾��� ǥ���ϴ� �±��Դϴ�. -->

	<table>
		<!-- ǥ ������ �����͸� ǥ���ϴ� �±��Դϴ�. -->

		<tr>
			<!-- table�±� ������ ���� �����Ҷ� ���� �±��Դϴ�. -->
			<th>��ȣ</th>
			<!-- Table Header�� ���ڷ� table�±� ������ -->
			<th>����</th>
			<!-- �����ϰ���� �÷��� ��Ÿ���� ���� �±��Դϴ�. -->
			<th>�ۼ���</th>
			<th>��¥</th>
			<th>��ȸ��</th>

		</tr>

		<c:forEach items="${articleList}" var="article">

			<tr>
				<td>${article.idx}</td><!-- jstl�� ǥ������ ��ũ��Ʈ���� �Ӽ��� ���Ƽ� ��𿡾��� �켱�� -->
				<td><a href='./junboard/content.jsp?idx=${article.idx}'>${article.title}</a></td>
				<td>${article.writer}</td>
				<td>${article.regdate}</td>
				<td>${article.count}</td>

			</tr>

		</c:forEach>

	</table>

	<a href="./junboard/write.jsp">�۾���</a>
	
</body>

</html>