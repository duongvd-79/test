<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.Account"%>
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
        <link href="./css/stylehome.css" rel="stylesheet" />
        <style>
            .dark-theme .btn-light {
                --bs-btn-color: #f8f9fa;
                --bs-btn-bg: #212529;
                --bs-btn-hover-color: #000;
                --bs-btn-hover-bg: #fff;
            }
        </style>
    </head>

    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-light bg-light static-top">
            <div class="container">
                <a class="navbar-brand" href="home">PC Components</a>
                <div class="d-flex">
                    <div class="me-1">
                        <button class="btn btn-outline-dark" id="theme-toggle" title="Dark Theme">
                            <i class="bi bi-moon-fill"></i>
                        </button>
                    </div>
                    <%
                        Account account = (Account) session.getAttribute("account");
                        if (account != null) {
                            if(!account.getImg().equals("")) {
                    %>
                    <a href="accountDetail" class="mx-1">
                        <img role="button" class=" img-fluid img-thumbnail rounded-circle" 
                             src="${account.img}" style="max-height: 49.6px;" alt="alt"/>
                    </a>
                    <%}else{%>
                    <form action="accountDetail" class="mx-1">
                        <button class="btn btn-light btn-outline-dark">${account.displayName}</button>
                    </form>
                    <%}%>
                    <form action="logout" method="get" class="ms-1">
                        <button class="btn btn-danger btn-outline-dark">Logout</button>
                    </form>
                    <%
                        } else {
                    %>
                    <a class="btn btn-primary" href="login">Log In</a>
                    <%
                        }
                    %>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container position-relative">
                <div class="row justify-content-left">
                    <div class="col-xl-6">
                        <div class="text-center text-white">
                            <!-- Page heading-->
                            <h1 class="mb-5" id="color-shifting">Generate more leads with a professional landing page!</h1>
                            <form class="form-subscribe" id="contactForm">
                                <!-- Email address input-->
                                <div class="row">
                                    <div class="col">
                                        <input class="form-control form-control-lg" id="search" type="text"
                                               placeholder="Search something..." />
                                    </div>
                                    <div class="col-auto">
                                        <button class="btn btn-primary btn-lg remain-outline" id="searchButton" type="submit">Search</button>
                                    </div>
                                </div>
                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                                <div class="d-none" id="submitSuccessMessage">
                                    <div class="text-center mb-3">
                                        <div class="fw-bolder">Form submission successful!</div>
                                        <p>To activate this form, sign up at</p>
                                        <a class="text-white"
                                           href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                    </div>
                                </div>
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                                <div class="d-none" id="submitErrorMessage">
                                    <div class="text-center text-danger mb-3">Error sending message!</div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Icons Grid-->
        <section class="features-icons bg-light text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6" id="cpu-icon" onclick="location.href = 'cpulist'">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                            <div class="features-icons-icon d-flex">
                                <i class="bi-cpu-fill m-auto text-primary"></i>
                            </div>
                            <h3>CPU</h3>
                            <p class="lead mb-0">This theme will look great on any device, no matter the size!</p>
                        </div>
                    </div>
                    <div class="col-lg-6" id="gpu-icon">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                            <div class="features-icons-icon d-flex">
                                <i class="bi-gpu-card m-auto text-primary"></i>
                            </div>
                            <h3>GPU</h3>
                            <p class="lead mb-0">Featuring the latest build of the new Bootstrap 5 framework!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Image Showcases-->
        <section class="showcase">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-6 order-lg-2 text-white showcase-img"
                         style="background-image: url('https://images.fpt.shop/unsafe/filters:quality(5)/fptshop.com.vn/uploads/images/2015/Tin-Tuc/TP/21-01-2016/cpu-la-gi.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>The Unstoppable Force</h2>
                        <p class="lead mb-0">Evokes a sense of power and invincibility. The description can further emphasize this by stating that this CPU is engineered for unmatched performance and efficiency, allowing users to conquer any task.</p>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col-lg-6 text-white showcase-img"
                         style="background-image: url('https://www.google.com/url?sa=i&url=https%3A%2F%2Ffptshop.com.vn%2Ftin-tuc%2Fdanh-gia%2Fcpu-la-gi-37083&psig=AOvVaw1uynEscI7KPmiNu6IYsKJ2&ust=1711177773657000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCODyjJCoh4UDFQAAAAAdAAAAABAD')"></div>
                    <div class="col-lg-6 my-auto showcase-text">
                        <h2>The Silent Assassin</h2>
                        <p class="lead mb-0">Intriguing and suggests a CPU that is both powerful and quiet. The description can elaborate on this by stating that the CPU delivers earth-shattering performance while remaining whisper-quiet, making it ideal for users who value both performance and a peaceful working environment.</p>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col-lg-6 order-lg-2 text-white showcase-img"
                         style="background-image: url('https://cdn.mos.cms.futurecdn.net/R6zbNW4EyUFXHdD4Laq8tb.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>The Architect of Creation</h2>
                        <p class="lead mb-0">Targets creative professionals by portraying the CPU as a tool that can help them bring their visions to life. The description can reinforce this concept by mentioning that the CPU is meticulously crafted to empower demanding creative applications, such as video editing, 3D rendering, and animation.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonials-->
        <section class="testimonials text-center bg-light">
            <div class="container">
                <h2 class="mb-5">What people are saying...</h2>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-1.jpg" alt="..." />
                            <h5>Margaret E.</h5>
                            <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-2.jpg" alt="..." />
                            <h5>Fred S.</h5>
                            <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of
                                super nice landing pages."</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-3.jpg" alt="..." />
                            <h5>Sarah W.</h5>
                            <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to
                                us!"</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Call to Action-->
        <section class="call-to-action text-white text-center" id="signup">
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <h2 class="mb-4">Ready to get started? Sign up now!</h2>
                        <!-- Signup form-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form class="form-subscribe" id="contactFormFooter" data-sb-form-api-token="API_TOKEN">
                            <!-- Email address input-->
                            <div class="row">
                                <div class="col">
                                    <input class="form-control form-control-lg" id="emailAddressBelow" type="email"
                                           placeholder="Email Address" data-sb-validations="required,email" />
                                    <div class="invalid-feedback text-white" data-sb-feedback="emailAddressBelow:required">
                                        Email Address is required.</div>
                                    <div class="invalid-feedback text-white" data-sb-feedback="emailAddressBelow:email">
                                        Email Address Email is not valid.</div>
                                </div>
                                <div class="col-auto">
                                    <button class="btn btn-primary btn-lg remain-outline disabled" id="submitButton" type="submit">Submit</button>
                                </div>
                            </div>
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    <p>To activate this form, sign up at</p>
                                    <a class="text-white"
                                       href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage">
                                <div class="text-center text-danger mb-3">Error sending message!</div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./js/indexScripts.js"></script>
        <script src="./js/changeTheme.js"></script>
    </body>

</html>
