<%--
  Created by IntelliJ IDEA.
  User: archi
  Date: 01-05-2020
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Music Track</title>
    <%@include file="../common/commonlinks.jsp"%>
</head>
<body>

<div class="container">
    <form method="post" action="/addMusic" enctype="multipart/form-data" >
        <fieldset class="form-group">
            <label>Title</label>
            <input type="text" name="title"  class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Artist</label>
            <input type="text" name="artist"  class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Music Image Upload</label>
            <input type="file" name="albumart"  class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Music Track Upload</label>
            <input type="file" name="musicfile"  class="form-control" required/>
        </fieldset>
        <fieldset class="form-group">
            <label>Duration</label>
            <input type="text" name="duration"  class="form-control" required/>
        </fieldset>
        <button type="submit" class="btn btn-success">Add Track</button>
    </form>
</div>
</body>
</html>
