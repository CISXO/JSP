<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("org.mariadb.jdbc.Driver");
String jdbcDriver = "jdbc:mariadb://localhost:3306/homework";
String dbUser = "root";
String dbPass = "22489612up!";
String query = "SELECT * FROM connect";

Connection conn = null;
Statement stmt = null;
ResultSet result = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	result = stmt.executeQuery(query);

int manage_num = Integer.parseInt(request.getParameter("manage_num"));
String value = null;

if(manage_num==1){
String stID = request.getParameter("Station_ID");
String liID = request.getParameter("Line_ID");
value="INSERT INTO connect (Station_ID, Line_ID) VALUES ('"+ stID +"', '"+ liID +"');";

} else if(manage_num==3){
String delete = request.getParameter("connectdelete_id");
String delete2 = request.getParameter("connectdelete_id2");
value="DELETE FROM connect WHERE Station_ID = "+ delete +" AND Line_ID = "+ delete2+" ";
}

stmt.executeUpdate(value);
String redirect = "../connect.jsp";
response.sendRedirect(redirect);
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {

String redirect = "../connect.jsp";
response.sendRedirect(redirect);
}
%>
</body>
</html>