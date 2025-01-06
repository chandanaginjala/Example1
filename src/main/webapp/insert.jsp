<!DOCTYPE html>
<html>
<head>
    <title>Insert Employee</title>
</head>
<body>
    <h1>Insert New Employee</h1>
    <form action="insert.jsp" method="post">
        <label for="eid">Employee ID:</label>
        <input type="text" id="eid" name="eid" required>
        <br><br>
        <label for="ename">Employee Name:</label>
        <input type="text" id="ename" name="ename" required>
        <br><br>
        <label for="phono">Phone:</label>
        <input type="text" id="phono" name="phono" required>
        <br><br>
        <button type="submit">Insert Employee</button>
    </form>

    <hr>

    <% 
        // Check if form is submitted
        String eid = request.getParameter("eid");
        String ename = request.getParameter("ename");
        String phono = request.getParameter("phono");

        if (eid != null && ename != null && phono != null) {
            // Display entered employee details
            out.println("<h2>Employee Details:</h2>");
            out.println("<p><strong>Employee ID:</strong> " + eid + "</p>");
            out.println("<p><strong>Employee Name:</strong> " + ename + "</p>");
            out.println("<p><strong>Phone:</strong> " + phono + "</p>");
        }
    %>
</body>
</html>
