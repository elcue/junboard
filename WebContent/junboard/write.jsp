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
<body>

	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
			제목 : <input type="text" name="title" /><br/>
			작성자 : <input type="text" name="writer" /><br/>
			날짜 : <input type="text" name="regdate" /><br/>
			내용 : <textarea name="content"></textarea><br/>
			<input type="submit" />

	</form>
	
	<script>

	function formCheck() {
		 
	    var title = document.forms[0].title.value;
	    var writer = document.forms[0].writer.value;
	    var regdate = document.forms[0].regdate.value;
	    var content = document.forms[0].content.value;
	 
	    if (title == null || title == ""){                         
	        alert('제목을 입력하세요');           
	        document.forms[0].title.focus();                
	        return false;             
	    }
	    if (writer == null ||  writer  == ""){          
	        alert('작성자를 입력하세요'); 
	        document.forms[0].writer.focus();                      
	        return false;               
	    }else if(writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
	        alert('이메일 형식으로 입력하세요'); 
	        document.forms[0].writer.focus();                      
	        return false; 
	    }
	 
	    if (regdate == null || regdate == "" ){                            
	 
	        alert('날짜를 입력하세요');   
	        document.forms[0].regdate.focus();                      
	        return false;            
	 
	    }else if(regdate.match(/^\d\d\d\d\d\d+$/ig)   == null){
	        alert('숫자 형식(6자리)으로 입력하세요'); 
	        document.forms[0].regdate.focus();                      
	        return false; 
	    }
	}

	
</script>
	

</body>
</html>