/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.CourseCategory;
import model.User;

/**
 *
 * @author Admin
 */
public class CourseCategoryDBContext extends DBContext {

    public ArrayList<CourseCategory> getAllCourseCategory() {
        ArrayList<CourseCategory> courseCategorys = new ArrayList<>();
        try {
            String sql = "SELECT [Id]\n"
                    + "      ,[Name]\n"
                    + "  FROM [dbo].[CourseCategory]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CourseCategory course = new CourseCategory();
                course.setId(rs.getInt(1));
                course.setName(rs.getString(2));
                courseCategorys.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courseCategorys;
    }

    public boolean checkCourseCateogoryExisted(String name) {
        try {
            String sql = "SELECT [Id]\n"
                    + "      ,[Name]\n"
                    + "  FROM [dbo].[CourseCategory]\n"
                    + "  where [Name] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void createNewCourseCategory(String name) {
        try {
            String sql = "INSERT INTO [dbo].[CourseCategory]\n"
                    + "           ([Name])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
