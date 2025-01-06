<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
</head>
<body>
    <h1>Delete Employee</h1>

    <% 
        // Simulating retrieving employee details based on the employee ID
        // In a real scenario, the employee details would be fetched from a database or backend service
        String eid = request.getParameter("eid");  // Get employee ID from the request
        String ename = null;
        String phono = null;

        if (eid != null) {
            // Simulating existing employee data for the given eid (in a real case, data would be fetched from DB)
            if ("123".equals(eid)) {  // Example employee with ID 123
                ename = "John Doe";
                phono = "9876543210";
            } else {
                ename = "Employee not found";
                phono = "";
            }
        }
        
        // Deleting the employee if the form is submitted
        String action = request.getParameter("action");
        if ("Delete".equals(action)) {
            // Simulate deletion by clearing employee details
            eid = null;
            ename = null;
            phono = null;
        }
    %>

    <!-- Check if employee is found -->
    <form action="delete.jsp" method="post">
        <label for="eid">Employee ID:</label>
        <input type="text" id="eid" name="eid" value="<%= eid != null ? eid : "" %>" readonly>
        <br><br>

        <% if (eid != null && ename != null) { %>
            <p>Are you sure you want to delete the following employee?</p>
            <p><strong>Employee Name:</strong> <%= ename %></p>
            <p><strong>Phone:</strong> <%= phono %></p>
            <br>
            <button type="submit" name="action" value="Delete">Delete</button>
            <br><br>
        <% } else { %>
            <p>Employee not found!</p>
        <% } %>
    </form>

    <% if ("Delete".equals(action)) { %>
        <h2>Employee Deleted Successfully!</h2>
    <% } %>

</body>
</html>
