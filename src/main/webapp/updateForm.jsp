<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
    <h1>Update Employee</h1>
    <%
        // Cast the employee attribute to Employee type
        Employee employee = (Employee) request.getAttribute("employee");
        if (employee != null) {
    %>
    <form action="/update" method="post">
        <input type="hidden" name="eid" value="<%= employee.getEid() %>">
        <label for="ename">Name:</label>
        <input type="text" name="ename" value="<%= employee.getEname() %>" required>
        <br>
        <label for="phono">Phone:</label>
        <input type="text" name="phono" value="<%= employee.getPhono() %>" required>
        <br>
        <button type="submit">Update</button>
    </form>
    <% 
        } else { 
    %>
    <p>No employee data available to update.</p>
    <% 
        } 
    %>
</body>
</html>
