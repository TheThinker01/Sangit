<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>
<%@include file="baseHeader.jsp"%>
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Songs (Total)</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%MusicInterface mi = new MusicDeclaration();
                                            List res = mi.selectAllMusics();
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

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Playlists (Total)</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%PlaylistInterface pi = new PlaylistDeclaration();
                                            List resPlay = pi.selectAllPlaylists();
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

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Users</div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                    <%
                                                        UserInterface ui = new UserDeclaration();
                                                        List userRes = ui.searchByCategory("user");
                                                        long userNum = 0;
                                                        if(userRes!=null)
                                                        {
                                                            userNum = userRes.size();
                                                        }
                                                        pageContext.setAttribute("playlistnum",userNum);
                                                    %>
                                                    ${playlistnum}
                                                </div>
                                            </div>
<%--                                            <div class="col">--%>
<%--                                                <div class="progress progress-sm mr-2">--%>
<%--                                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-user fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Music Providers</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%
                                                List userRes2 = ui.searchByCategory("mp");
                                                long userNum2 = 0;
                                                if(userRes2!=null)
                                                {
                                                    userNum2 = userRes2.size();
                                                }
                                                pageContext.setAttribute("playlistnum",userNum2);
                                            %>
                                            ${playlistnum}
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Content Row -->
                <div class="row">

                    <div class="col-lg-12 mb-4">

                        <!-- Illustrations -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Links</h6>
                            </div>
                            <div class="card-body">
                                <p>Use the links on the left to access all the subpages</p>
                            </div>
                        </div>

                        <!-- Approach -->
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


<%@include file="baseFooter.jsp"%>