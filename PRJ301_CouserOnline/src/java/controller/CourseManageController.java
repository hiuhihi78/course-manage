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

/**
 *
 * @author Admin
 */
@WebServlet(name = "CourseManageController", urlPatterns = {"/courseManage"})
public class CourseManageController extends HttpServlet {


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
        CourseDBContext courseDB = new CourseDBContext();
        ArrayList<Course> courses = courseDB.getAllCourse();
        CourseCategoryDBContext courseCategoryDB = new CourseCategoryDBContext();
        ArrayList<CourseCategory> courseCategorys = courseCategoryDB.getAllCourseCategory();
        request.setAttribute("courses", courses);
        request.setAttribute("category", courseCategorys);
        request.getRequestDispatcher("courseManage.jsp").forward(request, response);
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
        String title = request.getParameter("title");
        int category = Integer.parseInt(request.getParameter("category"));
        String author = request.getParameter("author");
        CourseDBContext courseDB = new CourseDBContext();
        ArrayList<Course> courses = courseDB.getCoursesWithCondition(title,category,author);
        
        CourseCategoryDBContext courseCategoryDB = new CourseCategoryDBContext();
        ArrayList<CourseCategory> courseCategorys = courseCategoryDB.getAllCourseCategory();
        request.setAttribute("category", courseCategorys);
        
        request.setAttribute("title", title);
        request.setAttribute("categorySelected", category);
        request.setAttribute("author", author);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("courseManage.jsp").forward(request, response);
        
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
