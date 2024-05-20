<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Account" %>
<%@page import="model.CPU" %>
<%@page import="java.util.List" %>
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
            .dark-theme h1 {
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
                            request.getRequestDispatcher("error.html").forward(request, response);
                        }
                    %>
                </div>
            </div>
        </nav>
        <div class="container-fluid outer-border">
            <div class="container-fluid account-detail">
                <div class="container col-12">
                    <h1>Admin</h1>
                </div>
                <div class="form-box container light-style flex-grow-1 container-p-y col-12">
                    <div class="card overflow-hidden">
                        <div class="row no-gutters row-bordered row-border-light">
                            <div class="col-md-3 pt-0">
                                <div class="list-group list-group-flush account-settings-links">
                                    <a class="list-group-item list-group-item-action active" data-bs-toggle="list"
                                       href="#account-general" role="tab" aria-controls="account-general">Account Management</a>
                                    <a class="list-group-item list-group-item-action" data-bs-toggle="list"
                                       href="#account-change-password" role="tab" aria-controls="account-change-password">CPU Management</a>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="account-general" role="tabpanel">
                                        <div class="card-body">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Username</th>
                                                        <th scope="col">Display Name</th>
                                                        <th scope="col">Role</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        List<Account> list = (List<Account>) session.getAttribute("allAccountList");
                                                        if (list == null || list.isEmpty()) {
                                                    %>
                                                <center><h1 class="text-danger">There are no account in database!</h1></center>
                                                    <%
                                                            } else {
                                                    %>
                                                    <c:forEach items="${sessionScope.allAccountList}" var="l">
                                                    <tr>
                                                        <td scope="row"><a class="text-decoration-none">${l.accountID}</a></td>
                                                        <td scope="row"><a class="text-decoration-none">${l.userName}</a></td>
                                                        <td scope="row"><a class="text-decoration-none">${l.displayName}</a></td>
                                                        <td scope="row"><a class="text-decoration-none">${l.roleID==1?"Admin":"User"}</a></td>
                                                        <td scope="row">
                                                            <c:if test="${sessionScope.account.accountID!=l.accountID}">
                                                                <button class="btn btn-success remain-outline" data-bs-toggle="modal" data-bs-target="#update-${l.accountID}"
                                                                        aria-controls="update-${l.accountID}">Update role</button>
                                                                <button class="btn btn-danger remain-outline" data-bs-toggle="modal" data-bs-target="#delete-${l.accountID}"
                                                                        aria-controls="delete-${l.accountID}">Delete</button>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-change-password" role="tabpanel">
                                        <div class="card-body pb-3">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Manufacturer ID</th>
                                                        <th scope="col">Title</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        List<CPU> cpulist = (List<CPU>) request.getAttribute("cpulist");
                                                        if (cpulist == null || cpulist.isEmpty()) {
                                                    %>
                                                <center><h1 class="text-danger">There are no CPU in database!</h1></center>
                                                    <%
                                                            } else {
                                                    %>
                                                    <c:forEach items="${requestScope.cpuList}" var="c">
                                                    <tr>
                                                        <td scope="row"><a class="text-decoration-none">${c.cpuID}</a></td>
                                                        <td scope="row"><a class="text-decoration-none">${c.manufacturerID}</a></td>
                                                        <td scope="row"><a data-bs-toggle="modal" href="#cpu-${c.cpuID}" class="text-decoration-none">${c.Title}</a></td>
                                                        <td scope="row">

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <c:forEach items="${sessionScope.allAccountList}" var="l">
                                        <div class="modal fade" id="update-${l.accountID}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="admin" method="post">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5">Update role</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="form-group col-md-6 text-center align-self-center">
                                                                    <h5>User:</h5>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <input type="text" readonly class="form-control-plaintext text-center" value="${l.userName}">
                                                                </div>
                                                                <div class="form-group col-md-6 text-center align-self-center">
                                                                    <h5>Role:</h5>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <input hidden="hidden" type="text" name="accountID" value="${l.accountID}">
                                                                    <select name="role" class="form-control">
                                                                        <option value="1" ${l.roleID==1?"selected":""}>Admin</option>
                                                                        <option value="2" ${l.roleID==2?"selected":""}>User</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary remain-outline" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary remain-outline">Save changes</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:forEach items="${sessionScope.allAccountList}" var="l">
                                        <div class="modal fade" id="delete-${l.accountID}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="admin">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5">Delete Account</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="form-group col-md-12 text-center align-self-center">
                                                                    <h4 class="text-danger">Are you sure you want to remove the following account:</h4>
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <table class="table table-hover">
                                                                        <input hidden="hidden" type="text" name="accountID" value="${l.accountID}">
                                                                        <tr>
                                                                            <td><h2>Username:</h2></td>
                                                                            <td class="table-info">
                                                                                <h3 class="text-center">${l.userName}</h3>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><h2>Display Name:</h2></td>
                                                                            <td class="table-info">
                                                                                <h3 class="text-center">${l.displayName}</h3>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary remain-outline" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-danger remain-outline" name="action" value="delete">Delete</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
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
            </div>
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
        <script src="./js/indexScripts.js"></script>
        <script src="./js/changeTheme.js"></script>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="./js/accountDetailScripts.js"></script>
    </body>

</html>
