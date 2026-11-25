<%-- 
    Document   : login
    Created on : Oct 15, 2026, 9:28:01 AM
    Author     : phuct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <title>Login</title>
    </head>
    <body class="container">
        
        <form action="LoginController" method="post">
            <div>
              <label for="account" class="form-label">Account:</label>
              <input type="text" class="form-control" placeholder="Enter account" name="account" required>
            </div>
            <div class="mb-3">
              <label for="pwd" class="form-label">Password:</label>
              <input type="password" class="form-control" placeholder="Enter password" name="pswd" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <p>${error}</p>
    </body>
</html>
