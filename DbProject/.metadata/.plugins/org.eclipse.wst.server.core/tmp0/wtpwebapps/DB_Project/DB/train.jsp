<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<style>

body {
    font-family: 'Noto Sans KR', sans-serif;
    display: flex;
    justify-content: center;
    height: 95vh;
}

</style>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head><%

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
	String query = "SELECT * FROM train";
	result = stmt.executeQuery(query);
	int check=1;
	if(request.getParameter("checkcheck") == null) {
		
	} else {
	check = Integer.parseInt(request.getParameter("checkcheck"));
	}
%>

<body style="background-color: #edf2f9 !important;">
    <div>
        <h1 class="title">train</h1>
        <h4 class="titleScript">
				show your train!!
        </h4>
        <div>
                <table border = "1">
                    <thead>
                        <tr>
                        <td>ID</td>
                        <td>Type</td>
                        <td>Conditions</td>
                        </tr>
                    </thead><%
                    while(result.next()) {
                    	if(check==1){
                    %>
                    <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("Type")%></td>
                            <td><%=result.getString("Conditions")%></td>
                        </tr>
                   
                    </tbody>
                    <%} else if(check==2) {

                    	String search = request.getParameter("search");
                		String Text = result.getString("Conditions");
                		if(search.equals(Text)){

                    	%> <tbody>
                        <tr onclick="trClick(this)">
                        	<td><%=result.getInt("ID")%></td>
                            <td><%=result.getString("Type")%></td>
                            <td><%=result.getString("Conditions")%></td>
                        </tr>
                   
                    </tbody><%
                    }
                    }
                    	} %>
                </table>
        </div>
        <form action ="./manage/train_manage.jsp" method="get">
        <h4>Insert</h4>
        <div class="row">
        <input name="Type" type="text" placeHolder="Type">
        </div>
        <div class="row">
      <select name="Conditions">
        <option>S</option>
        <option>A</option>
        <option>B</option>
        <option>C</option>
        <option>D</option>
        <option>F</option>
      </select>
        </div>
        <div class="hd_insert_button">
        <button id="insert_button1" type = "submit" style="background-color: #4c59fd">insert</button>
        </div>
        <input name="manage_num" type="hidden" value="1">
        </form>
          
        <form id="Head_update" action="./manage/train_manage.jsp" method="get">
         <h4>Update</h4>
        <p>update�� ���̵� �Է��ϼ���!</p>
       <div class="row">
        <input id="train_id" name="trainupdate_id" type="text" placeHolder="id">
        </div>
       <div class="row">
      <select name="select">
        <option>Type</option>
        <option>Conditions</option>
      </select>
        </div>
       <div class="row">
        <input name="update" type="text" placeHolder="������">
        </div>
        <div>
        <button type = "submit" style="background-color: #4c59fd">update</button>
        </div>
        <input name="manage_num" type="hidden" value="2">
        </form>
        
        <form id="Head_delete" action="./manage/train_manage.jsp" method="get">
        <h4>Delete</h4>
        <p>delete�� ���̵� �Է��ϼ���!</p>
        <div class="row">
        <input id="head_id" name="traindelete_id" type="text" placeHolder="id">
        </div>
        <div>
        <button id="delete_button1" type = "submit" style="background-color: #4c59fd">delete</button>
        </div>
        <input name="manage_num" type="hidden" value="3">
        </form>
        
        <form action="../Sys_admin.jsp" method="get">
        <h4>������� �̵��ϱ�!</h4>
        <div>
        <button>���</button>
        </div>
        <br><br><br><br><br><br><br><br>
        </form>
    </div>
<%
	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println("err."+e.toString());
}
	%>
</body>
</html>