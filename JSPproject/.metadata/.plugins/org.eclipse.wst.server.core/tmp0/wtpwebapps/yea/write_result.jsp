<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import= "java.sql.*"%>
 <%@ page import="java.util.Date" %>
 <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

Class.forName("org.mariadb.jdbc.Driver");
String jdbcDriver = "jdbc:mariadb://localhost:3306/web";
String dbUser = "root";
String dbPass = "22489612up!";
String query = "SELECT * FROM board";
ResultSet result = null;

Connection conn = null;
Statement stmt = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	result = stmt.executeQuery(query);
	
	String title = request.getParameter("title");
	String context = request.getParameter("content");

	String user_id = (String) session.getAttribute("user_id");
	long time = System.currentTimeMillis();
	SimpleDateFormat datess = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String date = datess.format(new Date(time));
	
	int prim =(int) session.getAttribute("check");
	prim= prim +1;
	
	String insert_value="INSERT INTO board VALUES ('"+ prim /* auto primarykey*/+"', '"+ title +"', '"+ user_id +"','"+ date +"', '"+ context +"','1');";
	
	stmt.executeUpdate(insert_value);
	String redirect = "board.jsp";
	response.sendRedirect(redirect);
	
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	
}%>
</body>
</html>