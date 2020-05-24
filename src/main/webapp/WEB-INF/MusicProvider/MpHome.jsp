<%@ page import="DAO.MusicDeclaration" %>
<%@ page import="DAO.MusicInterface" %>
<%@ page import="DAO.PlaylistDeclaration" %>
<%@ page import="DAO.PlaylistInterface" %>
<%@ page import="java.util.List" %>
<%@include file="MpHomeHeader.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <!-- Content Row -->
    <div class="row">


        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Songs (Added By You)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%MusicInterface mi = new MusicDeclaration();
                                List res = mi.selectByUser(u.getId());
                                long size = 0;
                                if(res!=null)
                                {
                                    size = res.size();
                                }
                                pageContext.setAttribute("size",size);
                            %>
                                ${size}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-headphones-alt fa-2x icon text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Playlists (Your)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%PlaylistInterface pi = new PlaylistDeclaration();
                                List resPlay = pi.selectByUser(u);
                                long sizePlay = 0;
                                if(resPlay!=null)
                                {
                                    sizePlay = resPlay.size();
                                }
                                pageContext.setAttribute("playlistnum",sizePlay);
                            %>
                                ${playlistnum}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-list-ul fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    <!-- Content Row -->
    <div class="row">

        <div class="col-lg-6 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Links</h6>
                </div>
                <div class="card-body">
                    <p>Use the links on the left to access all the subpages<br>&nbsp;</p>
                </div>
            </div>
        </div>
        <div class="col-lg-6 mb-4">
            <!-- Approach -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Thank You for Your Contribution!</h6>
                </div>
                <div class="card-body">
                    <p>Spread the word in your circles about Sangit. Help us grow. We cannot thank you enough. :)</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Developer Details</h6>
                </div>
                <div class="card-body">
                    <p>Designed and Maintained by Archisman Pathak</p>
                    <p class="mb-0"><a href="https://github.com/TheThinker01" target="_blank">Look at My Github Profile -></a></p>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- /.container-fluid -->


<%@include file="MpHomeFooter.jsp"%>