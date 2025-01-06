<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
    <h1>Update Employee Details</h1>
    
    <% 
        // Simulating retrieving an existing employee from a "database"
        // In this case, we simulate with hardcoded values.
        String existingEid = "123";  // Example employee ID
        String existingEname = "John Doe";  // Example employee name
        String existingPhono = "9876543210";  // Example phone number

        // Checking if the form is submitted and retrieving the updated values
        String eid = request.getParameter("eid");
        String ename = request.getParameter("ename");
        String phono = request.getParameter("phono");

        if (eid != null && ename != null && phono != null) {
            // Simulating the update of employee details in the "database"
            existingEid = eid;
            existingEname = ename;
            existingPhono = phono;
        }
    %>
    
    <!-- Form for updating employee details -->
    <form action="update.jsp" method="post">
        <label for="eid">Employee ID:</label>
        <input type="text" id="eid" name="eid" value="<%= existingEid %>" readonly>
        <br><br>
        <label for="ename">Employee Name:</label>
        <input type="text" id="ename" name="ename" value="<%= existingEname %>" required>
        <br><br>
        <label for="phono">Phone:</label>
        <input type="text" id="phono" name="phono" value="<%= existingPhono %>" required>
        <br><br>
        <button type="submit">Update Employee</button>
    </form>

    <hr>

    <!-- Display updated employee details -->
    <h2>Updated Employee Details:</h2>
    <p><strong>Employee ID:</strong> <%= existingEid %></p>
    <p><strong>Employee Name:</strong> <%= existingEname %></p>
    <p><strong>Phone:</strong> <%= existingPhono %></p>
</body>
</html>
