<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Employee" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
    <h1>List of Employees</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        <% 
            List<Employee> employees = (List<Employee>) request.getAttribute("list");
            if (employees != null) {
                for (Employee emp : employees) {
        %>
        <tr>
            <td><%= emp.getEid() %></td>
            <td><%= emp.getEname() %></td>
            <td><%= emp.getPhono() %></td>
            <td>
                <a href="/update/<%= emp.getEid() %>">Update</a> |
                <a href="/delete/<%= emp.getEid() %>">Delete</a>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="4">No employees found.</td>
        </tr>
        <% } %>
    </table>
    <br>
    <a href="/index.jsp">Go to Home</a>
</body>
</html>
