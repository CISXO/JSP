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
String query = "SELECT * FROM train";

String query2="SET @cnt = 0; UPDATE train SET ID = @cnt:= @cnt + 1; ALTER TABLE train AUTO_INCREMENT = 1;";

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
String getType = request.getParameter("Type");
String getConditions = request.getParameter("Conditions");
value="INSERT INTO train (Type, Conditions) VALUES ('"+ getType +"', '"+ getConditions +"');";

} else if(manage_num==2){
	String select = request.getParameter("select");
	String getID = request.getParameter("trainupdate_id");
	String update = request.getParameter("update");
	value="UPDATE train SET "+ select +" = '"+ update +"' WHERE ID = "+ getID +"";
	System.out.println(value);
} else if(manage_num==3){
String delete = request.getParameter("traindelete_id");
value="DELETE FROM train WHERE ID = "+ delete +"";
}

stmt.executeUpdate(value);
String redirect = "../train.jsp";
response.sendRedirect(redirect);
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	String redirect = "../train.jsp";
	response.sendRedirect(redirect);
}
%>
</body>
</html>