<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
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
String query = "SELECT * FROM operation";
Connection conn = null;
Statement stmt = null;
ResultSet result = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	result = stmt.executeQuery(query);

int manage_num = Integer.parseInt(request.getParameter("manage_num"));
String value = null;
String Engineer_ID = (String) session.getAttribute("Engineer_ID");

if(manage_num==1){
String getDeptStatus = request.getParameter("DeptStatus");
String getArvStatus = request.getParameter("ArvStatus");
String getUpdateTime = request.getParameter("UpdateTime");
String getTrainCode_ID = request.getParameter("TrainCode_ID");
String getEngineer_ID = request.getParameter("Engineer_ID");
String getTrain_ID = request.getParameter("Train_ID");
value="INSERT INTO operation (DeptStatus, ArvStatus, UpdateTime, Engineer_ID, TrainCode_ID, Train_ID) VALUES ('"+ getDeptStatus +"', '"+ getArvStatus +"', '"+ getUpdateTime +"',"+ getEngineer_ID +",'"+ getTrainCode_ID +"','"+ getTrain_ID +"');";

} else if(manage_num==2){
	String select = request.getParameter("select");
	String getID = request.getParameter("masterupdate_id");
	String update = request.getParameter("update");
	value="UPDATE operation SET "+ select +" = '"+ update +"' WHERE ID = "+ getID +" AND Engineer_ID = "+ Engineer_ID +"";
	System.out.println(value);
} else if(manage_num==3){
String delete = request.getParameter("masterdelete_id");
value="DELETE FROM operation WHERE ID = "+ delete +" AND Engineer_ID = "+ Engineer_ID +"";
}

stmt.executeUpdate(value);
String redirect = "login_engineer.jsp";
response.sendRedirect(redirect);
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	String redirect = "login_engineer.jsp";
	response.sendRedirect(redirect);
}
%>
</body>
</html>