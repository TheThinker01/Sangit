<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 25-04-2020
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>

        <head>
            <title>Login</title>
            <%--    <%@include file="../common/commonlinks.jsp"%>--%>
                <meta charset="utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="">
                <meta name="author" content="">

                <title>Login</title>

                <!-- Custom fonts for this template-->
                <link href="/static/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

                <!-- Custom styles for this template-->
                <link href="/static/admin/css/sb-admin-2.min.css" rel="stylesheet">

        </head>
        <!-- 
        <body>

            <div class="container">

                <div class="alert alert-${mtype}" role="alert">
                    <p>${error}</p>
                    <hr>
                    <%--        TODO: Login Page needs to look better--%>
                </div>

                <form method="post" action="/login?next=${next}">
                    <input type="hidden" name="category" value="user" />
                    <fieldset class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" class="form-control" required/>
                    </fieldset>
                    <fieldset class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" required/>
                    </fieldset>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
            </div>
        </body>

        </html> -->

        <body class="bg-gradient-primary">

            <div class="container">

                <!-- Outer Row -->
                <div class="row justify-content-center">

                    <div class="col-xl-10 col-lg-12 col-md-9">

                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">
                                    <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                    <div class="col-lg-6">

                                        <div class="p-5">
                                            <div class="text-center">
                                                <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                            </div>
                                            <div class="alert alert-${mtype}" role="alert" style="width: 100%;margin:20px 0;">
                                                <hr>
                                                <p>${error}</p>
                                                <hr>

                                            </div>
                                            <form class="user" method="post" action="/login?next=${next}">
                                                <div class="form-group">
                                                    <input type="text" class="form-control form-control-user" name="username" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Username...">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control form-control-user" name="password" id="exampleInputPassword" placeholder="Password">
                                                </div>
                                                <div class="form-group">
                                                    <div class="custom-control custom-checkbox small">
                                                        <input type="checkbox" class="custom-control-input" id="customCheck">
                                                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                        Login
                                    </button>
                                                <hr>
                                                <%--                                    <a href="index.html" class="btn btn-google btn-user btn-block">--%>
                                                    <%--                                        <i class="fab fa-google fa-fw"></i> Login with Google--%>
                                                        <%--                                    </a>--%>
                                                            <%--                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">--%>
                                                                <%--                                        <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook--%>
                                                                    <%--                                    </a>--%>
                                            </form>
                                            <div class="text-center">
                                                <a class="small" href="/forgotPassword">Forgot Password?</a>
                                            </div>
                                            <div class="text-center">
                                                <a class="small" href="/addUser">Create an Account!</a>
                                            </div>
                                            <hr>
                                            <div class="text-center">
                                                <a href="/" style="text-decoration: none ;color: unset"><button class="btn btn-info" >HOME</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

        </body>

        </html>