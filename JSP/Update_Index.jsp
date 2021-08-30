
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.trainProject.DBconnection"%>
<%
Connection con = DBconnection.connectDB();
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<link rel="stylesheet" href="Jspfiles.css">
</head>
<body>
<h1>Update Train Details</h1>
<div class="table-wrapper">
<table class="fl-table">
<thead>
  <tr>
<th>Train Number</th>
<th>Train Name</th>
<th>From Station</th>
<th>To Station</th>
<th>Availablity</th>
<th>Update</th>
</tr>
</thead>
<%
try{
connection= DBconnection.connectDB();
statement=connection.createStatement();
String sql ="select * from traindata";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
 <tbody>
<tr>
<td><%=resultSet.getString("TrainNo") %></td>
<td><%=resultSet.getString("TrainName") %></td>
<td><%=resultSet.getString("FromStation") %></td>
<td><%=resultSet.getString("ToStation") %></td>
<td><%=resultSet.getString("Availaiblity") %></td>
<td><a href="update.jsp?TrainNo=<%=resultSet.getString("TrainNo")%>">update</a></td>
</tr>
</tbody>
<%
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