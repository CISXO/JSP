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
String query = "SELECT * FROM headquarter";


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
String getName = request.getParameter("Name1");
String getPlanet = request.getParameter("Planet1");
String getContinent = request.getParameter("Continent1");
String getManagerName = request.getParameter("ManagerName1");
int getBudget = Integer.parseInt(request.getParameter("Budget1"));
value="INSERT INTO Headquarter (Name, Planet, Continent, ManagerName, Budget) VALUES ('"+ getName +"', '"+ getPlanet +"', '"+ getContinent +"','"+ getManagerName +"','"+ getBudget +"');";

} else if(manage_num==2){
	String select = request.getParameter("select");
	String getID = request.getParameter("headupdate_id");
	String update = request.getParameter("update");
	value="UPDATE Headquarter SET "+ select +" = '"+ update +"' WHERE ID = "+ getID +"";
} else if(manage_num==3){
String delete = request.getParameter("headdelete_id");
value="DELETE FROM Headquarter WHERE ID = "+ delete +"";
}
stmt.executeUpdate(value);
String redirect = "../Headquarter.jsp";
response.sendRedirect(redirect);
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	String redirect = "../Headquarter.jsp";
	response.sendRedirect(redirect);
}
%>
</body>
</html>