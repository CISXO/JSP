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
String query = "SELECT * FROM Engineer";

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
String id = request.getParameter("enginID");
String getyear = request.getParameter("year");
String getvariety = request.getParameter("variety");
String getamount = request.getParameter("amount");
String getID = request.getParameter("Headquarter_ID");
value="INSERT INTO Engineer (ID, year, variety, amount, Headquarter_ID) VALUES ('"+ id +"', '"+ getyear +"', '"+ getvariety +"', '"+ getamount +"','"+ getID +"');";
} else if(manage_num==2){
	String select = request.getParameter("select");
	String getID = request.getParameter("Engineerupdate_id");
	String update = request.getParameter("update");
	value="UPDATE Engineer SET "+ select +" = '"+ update +"' WHERE ID = "+ getID +"";
	System.out.println(value);
} else if(manage_num==3){
String delete = request.getParameter("Engineerdelete_id");
value="DELETE FROM Engineer WHERE ID = "+ delete +"";
}

stmt.executeUpdate(value);
String redirect = "../Engineer.jsp";
response.sendRedirect(redirect);
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	String redirect = "../Engineer.jsp";
	response.sendRedirect(redirect);
}
%>
</body>
</html>