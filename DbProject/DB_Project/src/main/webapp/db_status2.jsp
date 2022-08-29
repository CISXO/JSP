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
String query = "SELECT Name, COUNT(Headquarter_ID) as count FROM station GROUP BY Headquarter_ID HAVING COUNT(Headquarter_ID);";

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
	
	name = result.getString("Name");
	count = Integer.parseInt(result.getString("count"));
	%>
          ['<%=name%>',      <%=count%>],
          <%}%>
        ]);

        var options = {
          title: 'Headquarter'
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
      <iframe src="db_status3.jsp" width="50%" height="500" frameborder="1"></frame>

  </body>
</html>