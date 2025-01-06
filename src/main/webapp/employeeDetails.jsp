<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Details</title>
</head>
<body>
    <h1>Updated Employee Details</h1>
    <% 
        // Cast the employee attribute to Employee type
        Employee employee = (Employee) request.getAttribute("employee"); 
        if (employee != null) {
    %>
        <p>ID: <%= employee.getEid() %></p>
        <p>Name: <%= employee.getEname() %></p>
        <p>Phone: <%= employee.getPhono() %></p>
    <% 
        } else { 
    %>
        <p>No employee data available.</p>
    <% 
        } 
    %>
    <br>
    <a href="/getall">View All Employees</a>
    <br>
</body>
</html>
