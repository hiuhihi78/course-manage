
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="asset/js/common.js" type="text/javascript"></script>
        <link href="asset/css/common.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <div class="sideBar">
                <i class="fa-solid fa-xmark" id="icon-close" onclick="CloseSideBar();"></i>
                <div style="margin-top:50px"></div>
                <div class="item-sideBar">
                    <a href="dashboard">Home</a>
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
        </div>
        <div>
            <h1 class="text-center m-b-50">Update course</h1>
            <form action="updateCourse" method="post" id="addForm"style="width: 90%; margin: 0 auto">
                <input type="hidden" name="id" value="${requestScope.course.id}">

                <div class="form-group row">
                    <label for="" class="col-sm-2 col-form-label">Title</label>
                    <div class="col-sm-10">
                        <input type="text" name="title" id="title" value="${requestScope.course.title}" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="" class="col-sm-2 col-form-label">Summary</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="summary"  id="summary" form="addForm" >${requestScope.course.summary}</textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="" class="col-sm-2 col-form-label">Category</label>
                    <div class="col-sm-3">
                        <select name="category" class="form-control" id="category">
                            <c:forEach items="${requestScope.category}" var="c">
                                <option value="${c.id}"
                                        <c:if test="${requestScope.course.courseCategory.id == c.id}">
                                            selected=""
                                        </c:if>
                                        >
                                    ${c.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-1">
                        <button type="button" class="btn-increase" onclick="window.location.href = 'createNewCourseCategory'">+</button>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="" class="col-sm-2 col-form-label">Image</label>
                    <div class="col-sm-10">
                        <input type="text" name="image" id="image" value="${requestScope.course.image}" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="" class="col-sm-2 col-form-label">Content</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="info" id="info" form="addForm"  rows="3">
                            ${requestScope.course.info}
                        </textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <c:if test="${requestScope.message != null}">
                        <div class="col-sm-10">
                            <i style="color: red">${requestScope.message}</i>
                        </div>
                    </c:if>
                </div>

                <div class="form-group row">
                    <div class="col-sm-5"></div>
                    <div class="col-sm-1">
                        <input type="submit" class="btn btn-primary m-center" value="Save">
                    </div>
                    <div class="col-sm-1">
                        <button type="button" class="btn btn-primary m-center" onclick="window.history.go(-1)">Cancel</button>
                    </div>
                    <div class="col-sm-5"></div>
                </div>

            </form>

        </div>
        <script>
            ClassicEditor
                    .create(document.querySelector('#info'))
                    .then(editor => {
                        editor.ui.view.editable.element.style.height = '250px';
                    })
                    .catch(error => {
                        console.error(error);
                    });


            function CloseSideBar() {
                document.querySelector('.sideBar').style.display = 'none';
            }
            function OpenSideBar() {
                document.querySelector('.sideBar').style.display = 'block';
            }
        </script>
    </body>
</html>
