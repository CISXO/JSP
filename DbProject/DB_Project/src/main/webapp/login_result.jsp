<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import= "java.sql.*" %>
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


Connection conn = null;
Statement stmt = null;
ResultSet result = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	String query = "select id, CONVERT(AES_DECRYPT(unhex(password),'testkey123') using utf8 ) as password, Engineer_ID, name from USER;";
	result = stmt.executeQuery(query);
	String ID_check = request.getParameter("id");
	String PS_check = request.getParameter("pw");
	String redirect = null;
	String trigger_id = null;
	String trigger_ps = null;
	int check_c = -1;
	while(result.next()) {
		trigger_id = result.getString("id");
		trigger_ps = result.getString("password");
	if(ID_check.equals(trigger_id) && PS_check.equals(trigger_ps)) {
		check_c = result.getInt("Engineer_ID");
		session.setAttribute("user_id", result.getString("id"));
		session.setAttribute("user_name", result.getString("name"));
		session.setAttribute("Engineer_ID", result.getString("Engineer_ID"));
		if(check_c==1) {
		redirect = "Sys_admin.jsp";
		} else if(check_c>1){
		redirect= "login_engineer.jsp";
		} else {
			redirect = "Login.jsp";
		}
	}
	}

	if(redirect != null){
		response.sendRedirect(redirect);
	} else {
		response.sendRedirect("Login.jsp");
	}
result.close();
stmt.close();
conn.close();

} catch (NumberFormatException e) {

String redirect = "Login.jsp";
response.sendRedirect(redirect);
}%>
</body>
</html>