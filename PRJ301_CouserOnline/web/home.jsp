<%-- 
    Document   : home
    Created on : Oct 29, 2022, 11:02:49 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Latest compiled JavaScript -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="asset/css/common.css" rel="stylesheet" type="text/css"/>
        <script src="asset/js/common.js" type="text/javascript"></script>
        <link href="asset/css/slick.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link href="asset/css/app.css" rel="stylesheet" type="text/css"/>
        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    </head>
    <body>
        <div class="sideBar">
            <i class="fa-solid fa-xmark" id="icon-close" onclick="CloseSideBar();"></i>
            <div style="margin-top:50px"></div>
            <div class="item-sideBar">
                <a href="home">Home</a>
            </div>
            <c:if test="${sessionScope.user != null}">
                <div class="item-sideBar">
                    <a href="changePassword">Change password</a>
                </div>
            
                <div class="item-sideBar">
                    <a href="logout">Logout</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <div class="item-sideBar">
                    <a href="login">Login</a>
                </div>
            </c:if>
        </div>

        <div class="header">
            <div class="header-top">
                <i class="fa-sharp fa-solid fa-bars" id="icon-open-sidebar" onclick="OpenSideBar()"></i>
                <h2 style="text-align:center;">ONLINE LERNING</h2>
            </div>
            <div class="header-botom"></div>
        </div>

        <div class="search" style="margin: 50px 0 ">
            <form action="home" method="post">
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label style="font-size: 20px;" class="col-sm-1 col-form-label">Title</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter course's title" value="${requestScope.title}">
                    </div>
                    <div class="col-sm-1">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>
            
            <c:if test="${requestScope.courseSearch != null}">
                <c:if test="${requestScope.totalCourseSearch == 0}">
                    <i style="font-size: 15px; margin-left: 260px">Not found</i>
                </c:if>
                <c:if test="${requestScope.totalCourseSearch > 0}">
                    <table class="table" style="width: 1000px;  width: 700px; margin-left: 120px">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Image</th>
                            <th>Category</th>
                            <th>Author</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody> 
                        <c:forEach items="${requestScope.courseSearch}" var="c">
                            <tr>
                                <td>${c.title}</td>
                                <td><img src="${c.image}" style="width: 80px; height: 80px"/></td>
                                <td>${c.courseCategory.name}</td>
                                <td>${c.user.username}</td>
                                <td>
                                    <button type="button" class="btn btn-info" onclick="viewCourseDetail(${c.id})">Learn now</button>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                </c:if>
            </c:if>
        </div>

        <div class="image-slider">
            <c:forEach items="${requestScope.course}" var="c">
                <div class="image-item">
                    <div class="image">
                        <img src="${c.image}" alt="" />
                    </div>
                    <h3 class="image-title">${c.title}</h3>
                    <h6>${c.user.username}</h6>
                    <button type="button" class="btn btn-info" onclick="viewCourseDetail(${c.id})">Learn now</button>
                </div>
            </c:forEach>
        </div>






        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="asset/js/app.js" type="text/javascript"></script>
        
        <script>
            function viewCourseDetail(id){
                window.location.href = 'viewCourseDetail?id=' + id;
            }
            $(document).ready(function () {
                $('#myTable').DataTable({
                    "searching": false,
                    "lengthMenu": false,
                    'lengthChange': false
                });
            });
        </script>
    </body>
</html>
