package dao;

import java.sql.*;
import java.util.*;
import model.Student;
import util.DBConnection;

public class StudentDAO {

    public static List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        // Note: Using the column name 'class' as seen in your MySQL Workbench
        String sql = "SELECT * FROM students";

        // Using try-with-resources to AUTO-CLOSE everything
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setAge(rs.getInt("age"));
                s.setStudentClass(rs.getString("class")); 
                list.add(s);
            }
            
            // Helpful Debug: Check your Eclipse Console!
            System.out.println("DAO Success: Fetched " + list.size() + " students.");

        } catch (Exception e) {
            System.err.println("DAO Error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    
 // Add these to your StudentDAO class
    public static Student getStudentById(int id) {
        Student s = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id=?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s = new Student();
                    s.setId(rs.getInt("id"));
                    s.setName(rs.getString("name"));
                    s.setAge(rs.getInt("age"));
                    s.setStudentClass(rs.getString("class"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return s;
    }

    public static void updateStudent(Student s) throws Exception {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE students SET name=?, age=?, class=? WHERE id=?")) {
            ps.setString(1, s.getName());
            ps.setInt(2, s.getAge());
            ps.setString(3, s.getStudentClass());
            ps.setInt(4, s.getId());
            ps.executeUpdate();
        }
    }

    public static void addStudent(Student s) throws Exception {
        String sql = "INSERT INTO students(name, age, class) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, s.getName());
            ps.setInt(2, s.getAge());
            ps.setString(3, s.getStudentClass());
            ps.executeUpdate();
        }
    }

    public static void deleteStudent(int id) throws Exception {
        String sql = "DELETE FROM students WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    public static int getTotalStudentsCount() {
        int count = 0;
        try (Connection conn = DBConnection.getConnection()) { // Aapka connection method
            String sql = "SELECT COUNT(*) FROM students";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}