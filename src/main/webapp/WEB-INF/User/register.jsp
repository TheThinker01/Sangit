<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 01-04-2020
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
<%--    <%@include file="../common/commonlinks.jsp"%>--%>
    <link href="static/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="static/admin/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<%--<body>--%>

<%--<div class="container">--%>
<%--    <form method="post" action="/addUser" enctype="multipart/form-data" >--%>
<%--        <fieldset class="form-group">--%>
<%--            <label>Name</label>--%>
<%--            <input type="text" name="name" value="${st.getName()}" class="form-control" required/>--%>
<%--        </fieldset>--%>
<%--        <fieldset class="form-group">--%>
<%--            <label>Category</label>--%>
<%--            <input type="text" name="category" value="${st.getCategory()}" class="form-control" required/>--%>
<%--        </fieldset>--%>
<%--        <fieldset class="form-group">--%>
<%--            <label>Email</label>--%>
<%--            <input type="text" name="email" value="${st.getEmail()}" class="form-control" required/>--%>
<%--        </fieldset>--%>
<%--        <fieldset class="form-group">--%>
<%--            <label>Mobile No.</label>--%>
<%--            <input type="text" name="mobile_num" value="${st.getMobile_Num()}" class="form-control" required/>--%>
<%--        </fieldset>--%>
<%--        <fieldset class="form-group">--%>
<%--            <label>Image</label>--%>
<%--            <input type="file" name="photo" value="${st.getPhotopath()}" class="form-control" required/>--%>
<%--        </fieldset>--%>
<%--        <fieldset class="form-group">--%>
<%--            <label>Username</label>--%>
<%--            <input type="text" name="username" value="${st.getUsername()}" class="form-control" required/>--%>
<%--        </fieldset>--%>
<%--        <fieldset class="form-group">--%>
<%--            <label>Password</label>--%>
<%--            <input class="form-control" type="password" value="${st.getPassword()}" name="password" required/>--%>
<%--        </fieldset>--%>
<%--        <button type="submit" class="btn btn-success">Submit Details</button>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<body class="bg-gradient-primary">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                        </div>
                        <div class="register-alert alert alert-danger" role="alert" style="width: 100%;margin:20px 0;">
                            <hr>
                            <p></p>
                            <hr>

                        </div>
                        <form class="user" method="post" action="/addUser" enctype="multipart/form-data">
                            <input type="hidden" name="category" value="user">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" name="name" id="name" placeholder="Your Name" required/>
                                </div>
                                <div class="col-sm-6">
                                    <input type="number" class="form-control form-control-user" name="mobile_num" id="mobile_num" placeholder="Mobile Number" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" name="email" id="email" placeholder="Email Address" required/>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" name="username" id="username" placeholder="Username" required/>
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" name="password" id="password" placeholder="Password" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label style="margin-left: 10px">Select Image</label>
                                <input type="file" class="form-control form-control-user" name="photo" id="photo" placeholder="Choose Image" required/>
                            </div>
                            <a href="/addUser" class="btn btn-primary btn-user btn-block register-button">
                                Register Account
                            </a>
                            <hr>
                            <!--                <a href="index.html" class="btn btn-google btn-user btn-block">-->
                            <!--                  <i class="fab fa-google fa-fw"></i> Register with Google-->
                            <!--                </a>-->
                            <!--                <a href="index.html" class="btn btn-facebook btn-user btn-block">-->
                            <!--                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook-->
                            <!--                </a>-->
                        </form>

                        <div class="text-center">
                            <a class="small" href="/forgot-password">Forgot Password?</a>
                        </div>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="/login">Already have an account? Login!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Bootstrap core JavaScript-->
<script src="static/admin/vendor/jquery/jquery.min.js"></script>
<script src="static/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="static/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="static/admin/js/sb-admin-2.min.js"></script>

<script>
    // Code for Validation of the fields
    $('.register-alert').hide();
    // $('.register-button').on("click",function (e) {
    //     console.log($(this));
    //
    //     var par = $(this).parents().eq(0);
    //     console.log(par);
    //     var name = par.find('#name').val();
    //     var mob = par.find('#mobile_num').val();
    //     var mob = par.find('#email').val();
    //     var mob = par.find('#username').val();
    //     var mob = par.find('#password').val();
    //     var mob = par.find('#photo').val();
    //
    // })
</script>

</body>

</html>

