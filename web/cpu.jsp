<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>PC Components - ${cpu.title}</title>
        <link rel="icon" type="image/x-icon" href="assets/component.ico" />
        <!-- Bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./css/stylecpu.css" rel="stylesheet" />
        <link href="./css/styleNavbar.css" rel="stylesheet" />
        <style>
            .dark-theme {
                color: white;
                background-color: #202124;
            }
            .dark-theme .table {
                --bs-table-hover-bg: #808080;
                color: white;
            }
            .light-theme .badge {
                color: #202124;
            }
            .dark-theme .card {
                background-color: #202124;
            }
            .reply-box {
                max-height: 50vh;
                overflow-y: auto;
            }
        </style>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="home">PC Components</a>
                <div>
                    <button class="btn btn-outline-dark" id="theme-toggle" title="Dark Theme">
                        <i class="bi bi-moon-fill"></i>
                    </button>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <%
                        Account account = (Account) session.getAttribute("account");
                        if (account != null) {
                            if(!account.getImg().equals("")) {
                        %>
                        <li><a href="accountDetail" class="mx-1">
                                <img role="button" class=" img-fluid img-thumbnail rounded-circle" 
                                     src="${account.img}" style="max-height: 49.6px;" alt="alt"/>
                            </a>
                        </li>
                        <%}else{%>
                        <li class="li">
                            <form action="accountDetail" class="me-lg-1">
                                <button class="btn btn-light btn-outline-dark">${account.displayName}</button>
                            </form>
                        </li>
                        <%}%>
                        <li class="li">
                            <form action="logout" method="get" class="mx-lg-1">
                                <button class="btn btn-danger btn-outline-dark">Logout</button>
                            </form>
                        </li>
                        <%} else {%>
                        <li class="li">
                            <form action="login" method="get" class="me-lg-1">
                                <button class="btn btn-primary">Login</button>
                            </form>
                        </li>
                        <%}%>
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-primary bg-gradient text-white">
            <div class="container px-4 text-center">
                <h1 class="fw-bolder">Welcome to Scrolling Nav</h1>
                <p class="lead">A functional Bootstrap 5 boilerplate for one page scrolling websites</p>
                <a class="btn btn-lg btn-light" href="#about">Start scrolling!</a>
            </div>
        </header>
        <!-- About section-->
        <section id="about">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-10 d-flex align-items-center">
                                <h2>${cpu.title}</h2>
                            </div>
                            <div class="col-lg-2"><img src="${cpu.img}" alt="${cpu.family}"/></div>
                        </div>
                        <div>
                            <table class="table table-hover">
                                <tr>
                                    <th scope="row">
                                        Family: 
                                    </th>
                                    <td>${cpu.family}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Model Number: 
                                    </th>
                                    <td>${cpu.modelNumber}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Lithography: 
                                    </th>
                                    <td>${cpu.lithography}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Total Cores: 
                                    </th>
                                    <td>${cpu.core}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Total Threads: 
                                    </th>
                                    <td>${cpu.thread}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Base Frequency: 
                                    </th>
                                    <td>${cpu.baseFreq}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Max Boost Frequency: 
                                    </th>
                                    <td>${cpu.maxTurboFreq}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Cache: 
                                    </th>
                                    <td>${cpu.cache}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Bus Speed: 
                                    </th>
                                    <td>${cpu.busSpeed}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        TDP: 
                                    </th>
                                    <td>${cpu.tdp}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Max Memory Size: 
                                    </th>
                                    <td>${cpu.maxMemory}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Memory Type: 
                                    </th>
                                    <td>${cpu.memType}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Integrated GPU: 
                                    </th>
                                    <td>${cpu.integratedGPU}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        GPU Base Frequency: 
                                    </th>
                                    <td>${cpu.gpuBaseFreq}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        4K Support: 
                                    </th>
                                    <td>${cpu.support4K}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        DirectX Support: 
                                    </th>
                                    <td>${cpu.directX}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        OpenGL Support: 
                                    </th>
                                    <td>${cpu.openGL}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        # of Displays Supported: 
                                    </th>
                                    <td>${cpu.numbersOfDisplays}</td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        Socket: 
                                    </th>
                                    <td>${cpu.socket}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services section-->
        <section id="services">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>CPU</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut optio velit inventore, expedita quo laboriosam possimus ea consequatur vitae, doloribus consequuntur ex. Nemo assumenda laborum vel, labore ut velit dignissimos.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact section-->
        <section id="contact">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>Comment</h2>
                    </div>
                    <div class="col-lg-8">
                        <div class="container">
                            <form action="comment">
                                <div class="row mt-2 mb-3">
                                    <div class="col-lg-11">
                                        <input hidden name="cpuID" value="${cpu.cpuID}">
                                        <input type="text" class="form-control" name="comment" placeholder="Say something...">
                                    </div>
                                    <div class="col-lg-1">
                                        <button type="submit" class="btn btn-secondary">Post</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <c:forEach items="${requestScope.commentlist}" var="c">
                            <div class="row justify-content-center mb-3 py-3 px-2 border border-light border-dark rounded-5">
                                <div class="col-lg-2">
                                    <div>
                                        <img class="img-fluid rounded-circle" src="${c.account.getImg()}" alt="alt"/>
                                    </div>
                                </div>
                                <div class="col-lg-10">
                                    <div class="text-muted border-bottom border-secondary">${c.account.getDisplayName()}</div>
                                    <div class="lead">${c.content}</div>
                                    <div class="row">
                                        <div class="col-lg-10"></div>
                                        <div class="col-lg-2 d-flex gap-1">
                                            <a class="badge btn" data-bs-toggle="collapse" href="#reply-${c.commentID}" role="button" aria-expanded="false" aria-controls="reply-${c.commentID}">
                                                Reply
                                            </a>
                                        </div>
                                        <div class="collapse" id="reply-${c.commentID}">
                                            <div class="card card-body reply-box">
                                                <c:forEach items="${requestScope.replylist}" var="r">
                                                    <c:if test="${r.commentID==c.commentID}">
                                                        <div class="row justify-content-center mb-3 py-3 px-2 border border-light border-dark rounded-5">
                                                            <div class="col-lg-2">
                                                                <div>
                                                                    <img class="img-fluid rounded-circle" src="${r.account.getImg()}" alt="alt"/>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-10">
                                                                <div class="text-muted border-bottom border-secondary">${r.account.getDisplayName()}</div>
                                                                <div class="lead">${r.content}</div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                <form action="comment">
                                                    <div class="row mt-2 mb-3">
                                                        <div class="col-lg-10">
                                                            <input hidden name="cpuID" value="${cpu.cpuID}">
                                                            <input hidden name="commentID" value="${c.commentID}">
                                                            <input type="text" class="form-control form-control-sm" name="reply" placeholder="Say something...">
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <button type="submit" class="btn btn-secondary btn-sm">Post</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./js/scripts.js"></script>
        <script src="./js/changeTheme.js"></script>
    </body>
</html>
