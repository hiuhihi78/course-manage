<%-- 
    Document   : viewCourseDtail
    Created on : Oct 31, 2022, 10:21:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="asset/css/courseDetail.css" rel="stylesheet" type="text/css"/>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="asset/css/common.css" rel="stylesheet" type="text/css"/>
        <script src="asset/js/common.js" type="text/javascript"></script>
    </head>
    <style>
        p{
            margin: 0;
            padding: 0;
        }
    </style>
    <body>
        <div class="">
            <div class="sideBar">
                <i class="fa-solid fa-xmark" id="icon-close" onclick="CloseSideBar();"></i>
                <div style="margin-top:50px"></div>
                <div class="item-sideBar">
                    <a href="home">Home</a>
                </div>
                <div class="item-sideBar">
                    <a href="changePassword">Change password</a>
                </div>
                <div class="item-sideBar">
                    <a href="logout">Logout</a>
                </div>
            </div>

            <div class="header">
                <div class="header-top">
                    <i class="fa-sharp fa-solid fa-bars" id="icon-open-sidebar" onclick="OpenSideBar()"></i>
                    <h2 style="text-align:center;">ONLINE LERNING</h2>
                </div>
                <div class="header-botom"></div>
            </div>

            <div class="content">
                <div class="head-content">
                    <div style="text-align: center;"> 
                        <img src="${requestScope.course.image}" style="width: 60vw; height: 500px; margin: 0 auto;" >
                    </div>
                    <h1 class="text-center">${requestScope.course.title}</h1>
                    <div class="course-info">
                        <p>Author: ${requestScope.course.user.username}</p>
                        <p>Category: ${requestScope.course.courseCategory.name}</p>
                        <p>Date created: ${requestScope.course.dateCreated}</p>
                    </div>
                </div>
                <div class="body-content">
                    <div class="summary">
                        <h5>Summary</h5>
                        <p>${requestScope.course.summary}</p>
                    </div>
                    <div class="course-content">
                        <h5>Content</h5>
                        ${requestScope.course.info}
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
