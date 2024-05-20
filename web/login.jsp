<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>PC Component</title>
        <!-- Icon-->
        <link rel="icon" type="image/x-icon" href="assets/component.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./css/styleindex.css" rel="stylesheet" />
        <link href="./css/stylelogin.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <div id="login"></div>
        <div id="signup"></div>
        <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="home">PC Components</a>
                <div>
                    <button class="btn btn-outline-dark" id="theme-toggle" title="Dark Theme"><i class="bi bi-moon-fill"></i></button>
                </div>
            </div>
        </nav>
        <div class="container">
            <form action="login" method="post" class="form-control login" id="loginForm">
                <div>
                    <h1 class="form-label text-center">Login</h1>
                    <p class="form-label text-center">Don't have an account? <a id="toSignup" href="#signup">Register Now!</a></p>
                </div>
                <div class="mb-3">
                    <label for="emailAddress" class="form-label">Username</label>
                    <input type="text" class="form-control" id="emailAddressLogin" placeholder="Username" name="userName" />
                    <span class="error" id="emailErrorLogin" hidden>*This field is not empty</span>
                </div>
                <div class="mb-3 position-relative">
                    <label for="password" class="form-label">Password</label>
                    <div class="icon-container">
                        <input type="password" class="form-control" id="passwordLogin" name="password" />
                        <i class="bi bi-eye-fill icon-3"></i>
                    </div>
                </div>
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null && error.equals("Wrong Username or Password. Please double check!")) {
                %>
                <div class="error">
                    <span>${error}</span>
                </div>
                <%}%>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary remain-outline" id="submitButtonLogin" disabled>Submit</button>
                </div>
            </form>
            <%
                String isSignup = (String) request.getAttribute("isSignup");
            %>
            <form action="signup" method="post" class="form-control signup
                  <%if(isSignup != null && isSignup.equals("isSignup")){%><%} else {%>
                  hidden<%}%>" id="signupForm">
                <div>
                    <h1 class="form-label text-center">Sign Up</h1>
                    <p class="form-label text-center">Already signed up? <a id="toLogin" href="#login">Login Now!</a></p>
                </div>
                <div class="mb-3">
                    <label for="emailAddressSignup" class="form-label">Username</label>
                    <input type="text" class="form-control" id="emailAddressSignup" placeholder="Username" name="userNameSignup" />
                    <span class="error" id="emailErrorSignup" hidden>*This field is not empty</span>
                    <%
                        if (error != null && error.equals("This username might has been used by another user. Please choose a different username.")) {
                    %>
                    <div class="error">
                        <span>${error}</span>
                    </div>
                    <%}%>
                </div>
                <div class="mb-3 position-relative">
                    <label for="passwordSignup" class="form-label">Password</label>
                    <div class="icon-container">
                        <input type="password" class="form-control" id="passwordSignup" name="passwordSignup" />
                        <i class="bi bi-eye-fill icon-1"></i>
                    </div>
                </div>
                <div class="mb-3 position-relative">
                    <label for="confirmPasswordSignup" class="form-label">Re-enter Password</label>
                    <div class="icon-container">
                        <input type="password" class="form-control" id="confirmPasswordSignup" />
                        <i class="bi bi-eye-fill icon-2"></i>
                    </div>
                    <span class="error" id="passwordErrorSignup" hidden>Entered password does not match!</span>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary remain-outline" id="submitButtonSignup" disabled>Submit</button>
                </div>
            </form>
        </div>
        <div class="gradient"></div>
        <script src="./js/changeTheme.js"></script>
        <script src="./js/loginScripts.js"></script>
    </body>
</html>

