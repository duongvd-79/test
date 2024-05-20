<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Account" %>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
              type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./css/styleindex.css" rel="stylesheet" />
        <link rel="stylesheet" href="./css/styleAccountDetail.css"/>
        <style>
            .dark-theme .form-box {
                color: black;
            }
            .dark-theme h2 {
                color: black;
            }
            body {
                min-height: 100vh;
            }
            .navbar, .footer-container {
                transition: all .25s ease-in;
            }
            .footer {
                min-width: 100vw;
            }
            .account-detail {
                margin: auto;
                background-color: #f5f5f5;
                border-radius: 10px;
            }
            .outer-border {
                background-color: inherit;
                transition: all .05s ease-in;
            }
            #submit, #cancel, #noti {
                margin-bottom: 10px;
            }
            #submit, #cancel {
                max-width: 100px;
            }
            @media (max-width: 992px) {
                .footer {
                    max-height: 180px
                }
                #submit {
                    max-height: 50px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="home">PC Components</a>
                <div>
                    <button class="btn btn-outline-dark" id="theme-toggle" title="Dark Theme">
                        <i class="bi bi-moon-fill"></i>
                    </button>
                    <%
                        Account account = (Account) session.getAttribute("account");
                        if (account != null) {
                    %>
                    <button class="btn btn-danger remain-outline">
                        <a href="logout" class="text-decoration-none text-white">Logout</a>
                    </button>
                    <%
                        } else {
                            request.getRequestDispatcher("error.jsp").forward(request, response);
                        }
                    %>
                </div>
            </div>
        </nav>
        <div class="container-fluid outer-border">
            <form action="accountDetail" method="post" class="container-fluid account-detail me-1 py-3">
                <div class="container col-12">
                    <h2>Account Detail</h2>
                </div>
                <div class="form-box container light-style flex-grow-1 container-p-y col-12">
                    <div class="card overflow-hidden">
                        <div class="row no-gutters row-bordered row-border-light">
                            <div class="col-md-3 pt-0">
                                <div class="list-group list-group-flush account-settings-links">
                                    <a class="list-group-item list-group-item-action active" data-toggle="list"
                                       href="#account-general">General</a>
                                    <a class="list-group-item list-group-item-action" data-toggle="list"
                                       href="#account-change-password">Change password</a>
                                    <c:if test="${account.getAccountID()==1}">
                                        <a class="list-group-item list-group-item-action"
                                           href="admin">Admin Page</a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show" id="account-general">
                                        <div class="card-body media align-items-center row">
                                            <div class="col-md-2">
                                                <img src="${account.img}" alt
                                                     class="d-block ui-w-80 img-fluid img-thumbnail">
                                            </div>
                                            <div class="col-md-10">
                                                <div class="media-body ml-4">
                                                    <label class="btn btn-outline-primary">
                                                        Upload new photo
                                                        <input type="file" class="account-settings-fileinput" name="file" id="fileInput">
                                                    </label> &nbsp;
                                                    <button type="button" class="btn btn-default md-btn-flat">Reset</button>
                                                    <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="border-light m-0">
                                        <div class="card-body">
                                            <div class="form-group mb-3">
                                                <label class="form-label">Username</label>
                                                <input type="text" class="form-control" name="userName" value="${sessionScope.account.userName}">
                                            </div>
                                            <div class="form-group mb-2">
                                                <label class="form-label">Name</label>
                                                <input type="text" class="form-control" name="displayName" value="${sessionScope.account.displayName}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-change-password">
                                        <div class="card-body pb-3">
                                            <div class="form-group mb-3">
                                                <label class="form-label">Current password</label>
                                                <input type="password" class="form-control" name="password" autocomplete="new-password">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label class="form-label">New password</label>
                                                <input type="password" class="form-control" name="newPassword" id="password">
                                            </div>
                                            <div class="form-group mb-2">
                                                <label class="form-label">Repeat new password</label>
                                                <input type="password" class="form-control"  id="confirmPassword">
                                            </div>
                                            <div>
                                                <span class="text-danger" id="passwordError" hidden>Entered password does not match!</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container text-right mt-3 row align-items-center">
                        <button type="submit" class="btn btn-primary remain-outline col-md-2" id="submit">Save</button>&nbsp;
                        <button type="button" class="btn btn-default col-md-2" id="cancel" onclick="location.href = 'home';">Cancel</button>&nbsp;
                        <%
                            String noti = (String) request.getAttribute("noti");
                            String failedNoti = (String) request.getAttribute("failedNoti");
                            if (noti != null) {
                        %>
                        <div class="text-success col-md-6" id="noti">${requestScope.noti}</div>
                        <%} else if (failedNoti != null) {%>
                        <div class="text-danger col-md-6" id="noti">${requestScope.failedNoti}</div>
                        <%}%>
                    </div>
                </div>
            </form>
        </div>
        <!-- Footer-->
        <div class="footer-container position-relative" style="height: 180px">
            <div class="position-absolute bottom-0">
                <footer class="footer bg-light">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                                <ul class="list-inline mb-2">
                                    <li class="list-inline-item"><a href="#!">About</a></li>
                                    <li class="list-inline-item">⋅</li>
                                    <li class="list-inline-item"><a href="#!">Contact</a></li>
                                    <li class="list-inline-item">⋅</li>
                                    <li class="list-inline-item"><a href="#!">Terms of Use</a></li>
                                    <li class="list-inline-item">⋅</li>
                                    <li class="list-inline-item"><a href="#!">Privacy Policy</a></li>
                                </ul>
                                <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2023. All Rights Reserved.</p>
                            </div>
                            <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item me-4">
                                        <a href="#!"><i class="bi-facebook fs-3"></i></a>
                                    </li>
                                    <li class="list-inline-item me-4">
                                        <a href="#!"><i class="bi-twitter fs-3"></i></a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#!"><i class="bi-instagram fs-3"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script>
                            const signupPasswordInput = document.getElementById('password');
                            const confirmPasswordInput = document.getElementById('confirmPassword');
                            const passwordErrorSpan = document.getElementById('passwordError');

                            confirmPasswordInput.addEventListener('keyup', function () {
                                const password = signupPasswordInput.value;
                                const confirmPassword = this.value;

                                if (password === "") {
                                    // Handle empty password case
                                    passwordErrorSpan.hidden = true;
                                } else {
                                    // Handle non-empty password case
                                    if (password === confirmPassword) {
                                        passwordErrorSpan.hidden = true; // Hide error message
                                    } else {
                                        passwordErrorSpan.hidden = false; // Make error message visible
                                    }
                                }
                            });
        </script>
        <script src="./js/indexScripts.js"></script>
        <script src="./js/changeTheme.js"></script>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./js/accountDetailScripts.js"></script>
    </body>

</html>
