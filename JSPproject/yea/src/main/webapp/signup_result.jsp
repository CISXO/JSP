<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import= "java.sql.*"%>
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
String query = "SELECT * FROM user";
ResultSet result = null;

Connection conn = null;
Statement stmt = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	result = stmt.executeQuery(query);
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	String insert_value="INSERT INTO user(id, password, name) VALUES ('"+ id +"', '"+ pw +"', '"+ name +"');";
	
	stmt.executeUpdate(insert_value);
	String redirect = "login.jsp";
	response.sendRedirect(redirect);
	
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	
}%>
</body>
</html>