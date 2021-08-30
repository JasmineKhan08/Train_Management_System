<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ page import="java.sql.*" %>
<%@page import="com.trainProject.DBconnection"%>
<%!Connection con = DBconnection.connectDB();%>
<%
String TrainNo = request.getParameter("TrainNo");
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

<body>
<head>
<link rel="stylesheet" href="Jspfiles.css">
</head>
<body>
<h1>Your Train Details</h1>
<div class="table-wrapper">
<table class="fl-table">
<thead>
  <tr>
<th>Train Number</th>
<th>Train Name</th>
<th>From Station</th>
<th>To Station</th>
<th>Availablity</th>
</tr>
</thead>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/train", "root" , "");
statement=connection.createStatement();
String sql ="Select * from traindata";
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
</tr>
</tbody>
<%
}connection.close();
}catch (Exception e) {
e.printStackTrace();
}

%>
</table>
</div>
</body>
</html>
