<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Account" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>PC Components - List of CPUs</title>
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
            .dark-theme .list {
                background-color: #3b3b3b;
            }
            .dark-theme thead {
                color: white;
            }
            .list {
                max-height: 100vh;
                border-radius: 10px;
                overflow-y: auto;
            }
            .admin {
                position: sticky;
                top: 75px;
                left: 94%;
                display: inline-block;
            }
            .admin button {
                height: 50px;
                width: 50px;
                border-radius: 50px;
                display: inline-block;
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
                <h1 class="fw-bolder">CPU</h1>
                <p class="lead">Browse CPU Database</p>
                <a class="btn btn-lg btn-light" href="#about">Start scrolling!</a>
            </div>
        </header>
        <!-- About section-->
        <section class="features-icons bg-light" id="about">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-4">
                        <h1>Refine Search Parameters</h1>
                        <div>
                            <form action="filter" method="get">
                                <div>
                                    <ul>
                                        <li>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <label class="my-1" for="mfgr">Manufacturer</label>
                                                </div>
                                                <div class="col-md-7">
                                                    <select class="form-select" id="mfgr" name="mfgr">
                                                        <option value="">All</option>
                                                        <c:forEach items="${manulist}" var="manu">
                                                            <option value="${manu}" ${manu==mfgrsl?"selected":""}>${manu}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row mt-2">
                                                <div class="col-md-2">
                                                    <label class="my-1" for="tdp">TDP</label>
                                                </div>
                                                <div class="col-md-10">
                                                    <select class="form-select" id="tdp" name="tdp">
                                                        <option value="">All</option>
                                                        <c:forEach items="${tdplist}" var="tdp">
                                                            <option value="${tdp}" ${tdp==tdpsl?"selected":""}>${tdp}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row my-2">
                                                <div class="col-md-2">
                                                    <label class="my-1" for="core">Cores</label>
                                                </div>
                                                <div class="col-md-10">
                                                    <select class="form-select" id="core" name="core">
                                                        <option value="">All</option>
                                                        <c:forEach items="${corelist}" var="core">
                                                            <option value="${core}" ${core==coresl?"selected":""}>${core}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row mb-2">
                                                <div class="col-md-3">
                                                    <label class="my-1" for="thread">Threads</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-select" id="thread" name="thread">
                                                        <option value="">All</option>
                                                        <c:forEach items="${threadlist}" var="thread">
                                                            <option value="${thread}" ${thread==threadsl?"selected":""}>${thread}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <label for="family">Family</label>
                                            <select class="form-select mt-2" id="family" name="family">
                                                <option value="">All</option>
                                                <c:forEach items="${familylist}" var="family">
                                                    <option value="${family}" ${family==familysl?"selected":""}>${family}</option>
                                                </c:forEach>
                                            </select>
                                        </li>
                                        <li>
                                            <div class="row mt-2">
                                                <div class="col-md-3">
                                                    <label class="my-1" for="socket">Socket</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <select class="form-select" id="socket" name="socket">
                                                        <option value="">All</option>
                                                        <c:forEach items="${socketlist}" var="socket">
                                                            <option value="${socket.replace("AMD","").replace("Intel","").trim()}"
                                                                    ${socket.replace("AMD","").replace("Intel","").trim()==socketsl?"selected":""}>
                                                                ${socket}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row my-2">
                                                <div class="col-md-4">
                                                    <label class="my-1" for="litho">Lithography</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <select class="form-select" id="litho" name="litho">
                                                        <option value="">All</option>
                                                        <c:forEach items="${litholist}" var="litho">
                                                            <option value="${litho}" ${litho==lithosl?"selected":""}>${litho}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row mt-2">
                                                <div class="col-md-7">
                                                    <label class="my-1" for="igp">Integrated Graphics</label>
                                                </div>
                                                <div class="col-md-5">
                                                    <select class="form-select" id="igp" name="igp">
                                                        <option value="">All</option>
                                                        <option value="No">No</option>
                                                        <option value="Yes">Yes</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <fieldset class="sort" style="display:none">
                                    <legend>Sort by:</legend>
                                    <select name="sort">
                                        <option value="name" selected="">Name</option>
                                        <option value="released">Released</option>
                                        <option value="generation">Generation</option>
                                    </select>
                                </fieldset>


                                <div class="container">
                                    <div class="row">
                                        <input class="btn btn-primary col-md-6" type="submit" value="Search" />
                                        <a class="col-md-6 text-md-center" href="cpulist">Reset Filter</a>
                                        <input class="col-md-12 mt-2 form-control" name="q" id="quicksearch" type="text" placeholder="or type to Search...">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-8 list">
                        <h2>List of CPUs:</h2>
                        <div>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Title</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<String> cpulist = (List<String>) request.getAttribute("cpulist");
                                        if (cpulist == null || cpulist.isEmpty()) {
                                    %>
                                <center><h1 class="text-danger">Nothing matched your search!</h1></center>
                                    <%
                                            } else {
                                    %>
                                    <c:forEach items="${requestScope.cpulist}" var="cpu">
                                    <tr>
                                        <th scope="row">
                                            <a href="cpu?cpuID=${cpu.cpuID}" class="text-decoration-none">${cpu.title}</a>
                                        </th>
                                    </tr>
                                </c:forEach>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services section-->
        <section class="testimonials bg-light" id="services">
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
        <section class="testimonials bg-light" id="contact">
            <div class="container px-4">
                <div class="row gx-4 justify-content-center">
                    <div class="col-lg-8">
                        <h2>Contact us</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero odio fugiat voluptatem dolor, provident officiis, id iusto! Obcaecati incidunt, qui nihil beatae magnam et repudiandae ipsa exercitationem, in, quo totam.</p>
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
