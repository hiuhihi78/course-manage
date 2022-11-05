/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CourseCategoryDBContext;
import dal.CourseDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.CourseCategory;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateCourseController", urlPatterns = {"/updateCourse"})
public class UpdateCourseController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CourseCategoryDBContext courseCategoryDB = new CourseCategoryDBContext();
        ArrayList<CourseCategory> courseCategorys = courseCategoryDB.getAllCourseCategory();

        CourseDBContext courseDB = new CourseDBContext();
        Course course = courseDB.getCourseById(id);

        request.setAttribute("course", course);
        request.setAttribute("category", courseCategorys);
        request.getRequestDispatcher("updateCourse.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        int category = Integer.parseInt(request.getParameter("category"));
        String info = request.getParameter("info");
        String image = request.getParameter("image");

        Course courseOfUserWasInput = new Course(id, title, null, summary, new CourseCategory(id, ""), null, info, image);

        CourseCategoryDBContext courseCategoryDB = new CourseCategoryDBContext();
        CourseDBContext courseDb = new CourseDBContext();
        boolean isCourseTitleWasExisted = courseDb.checkCourseTitleWasExisted(title);
        Course courseBeforeUpdate = courseDb.getCourseById(id);

        if(courseBeforeUpdate.getTitle().equals(title)){
            courseDb.updateCourse(title, summary, category, info, image, id);
            response.sendRedirect("courseManage");
        }else if(!isCourseTitleWasExisted){
            courseDb.updateCourse(title, summary, category, info, image, id);
            response.sendRedirect("courseManage");
        }else if(isCourseTitleWasExisted){
            request.setAttribute("message", "This title's course was existed!");
            ArrayList<CourseCategory> courseCategorys = courseCategoryDB.getAllCourseCategory();
            request.setAttribute("category", courseCategorys);
            request.setAttribute("course", courseOfUserWasInput);
            request.getRequestDispatcher("updateCourse.jsp").forward(request, response);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
