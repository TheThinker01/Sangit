<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 02-05-2020
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Playlist</title>
    <%@include file="../common/commonlinks.jsp"%>
    <style>
        .options{
            color: #999999;

            margin: 0 10px;
        }
    </style>
</head>
<body>
<div class="container m-5">
    <form method="post" action="/user/addPlaylist">
    <div>
    <fieldset class="form-group">
        <h4><label>Name</label></h4>
        <input type="text" name="name" class="form-control" required/>
    </fieldset>
    </div>
    <fieldset class="form-group">
        <h4>Share</h4>
        <h5>Do you want to share this playlist with other users?</h5>
        <div class="form-check m-4">
            <input class="form-check-input" type="radio" name="visibility" id="exampleRadios1" value="global" checked>
            <label class="form-check-label" for="exampleRadios1">
                Yes
            </label>
        </div>
        <div class="form-check m-4">
            <input class="form-check-input" type="radio" name="visibility" id="exampleRadios2" value="local">
            <label class="form-check-label" for="exampleRadios2">
                No
            </label>
        </div>
    </fieldset>
    <button type="submit" class="btn btn-success">Submit Details</button>
    </form>
    <div class="alert alert-success" style="margin-top: 20px">
        <h4>You can add songs to this playlist by clicking  <span class="options"><i class="fas fa-ellipsis-h fa-lg"></i></span> at the footer</h4>
    </div>
</div>
</body>
</html>
