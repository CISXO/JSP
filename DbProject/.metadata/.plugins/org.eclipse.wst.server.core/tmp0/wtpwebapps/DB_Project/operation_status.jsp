<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
  <%
Class.forName("org.mariadb.jdbc.Driver");
String jdbcDriver = "jdbc:mariadb://localhost:3306/homework";
String dbUser = "root";
String dbPass = "22489612up!";
String query = "select S.Engineer_ID, S.ID ,name, COUNT(S.Engineer_ID) as count from user S,operation T where S.Engineer_ID = T.Engineer_ID  GROUP BY S.Engineer_ID HAVING COUNT(S.Engineer_ID);";

Connection conn = null;
Statement stmt = null;
ResultSet result = null;

try {
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	result = stmt.executeQuery(query);
	
	String name = null;
	int count = 0;
	%>
  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['name', 'score'],<%
	while(result.next()) {
	
	name = result.getString("name");
	count = Integer.parseInt(result.getString("count"));
	%>
          ['<%=name%> 기장님',      <%=count%>],
          <%}%>
        ]);

        var options = {
          title: '엔지니어의 운행 수'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script><%
    	result.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println("err."+e.toString());
}%>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>