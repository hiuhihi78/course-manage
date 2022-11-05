<%-- 
    Document   : changePassword
    Created on : Oct 27, 2022, 10:58:52 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="asset/css/common.css" rel="stylesheet" type="text/css"/>
        <script src="asset/js/common.js" type="text/javascript"></script>
    </head>
    <body>
        
        <div class="sideBar">
            <i class="fa-solid fa-xmark" id="icon-close" onclick="CloseSideBar();"></i>
            <div style="margin-top:50px"></div>
            <div class="item-sideBar">
                <c:choose>
                    <c:when test="${sessionScope.user.isAdmin || sessionScope.user.isAuthor}">
                        <a href="dashboard">Home</a>
                    </c:when>
                    <c:otherwise>
                        <a href="home">Home</a>
                    </c:otherwise>
                </c:choose>   
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
        
        <div class="search" style="margin: 50px 0 ">

            <form action="changePassword" method="post">
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="username" class="col-sm-1 col-form-label">Username</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="username" = placeholder="Enter username" value="${requestScope.user.username}" disabled="">
                        <input type="hidden" name="username"  value="${requestScope.user.username}">
                    </div>
                </div>
                    <br>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="password" class="col-sm-1 col-form-label">Password</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" value="">
                    </div>
                </div>
                    <br> 
                
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="repassword" class="col-sm-1 col-form-label">Reenter password</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Reenter password" value="">
                    </div>
                </div>   
                <br>
                <i style="color: red" id="message"></i>
                <div style="margin-left: 130px">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>

        </div>
    </body>
</html>
