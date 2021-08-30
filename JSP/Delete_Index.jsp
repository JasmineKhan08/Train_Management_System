<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.trainProject.DBconnection"%>
<%
String driver = "com.mysql.jdbc.Driver";
Connection con = DBconnection.connectDB();
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<html>
<head>
<link rel="stylesheet" href="Jspfiles.css">
</head>
<body>
<h1>Delete Train Details</h1>
<div class="table-wrapper">
<table class="fl-table">
<thead>
  <tr>
<th>Train Number</th>
<th>Train Name</th>
<th>From Station</th>
<th>To Station</th>
<th>Availablity</th>
<th>Action</th>
</tr>
</thead>
<%
try{
	connection= DBconnection.connectDB();
statement=connection.createStatement();
String sql ="select * from traindata";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tbody>
<tr>
<td><%=resultSet.getString("TrainNo") %></td>
<td><%=resultSet.getString("TrainName") %></td>
<td><%=resultSet.getString("FromStation") %></td>
<td><%=resultSet.getString("ToStation") %></td>
<td><%=resultSet.getString("Availaiblity") %></td>
<td><a href="delete.jsp?TrainNo=<%=resultSet.getString("TrainNo") %>"><button type="button" class="delete">Delete</button></a></td>
</tr>
</tbody>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>