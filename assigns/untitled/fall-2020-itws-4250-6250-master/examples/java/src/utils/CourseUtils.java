package utils;

import beans.Course;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class CourseUtils {
    public static String toString(Course course) {
        return String.format("%s %s\t\t%s %s \t\t%d capacity",
                course.getSemester(), course.getName(), course.getLocation(), course.getTime(), course.getCapacity());
    }

    public static List<Course> fromResultSet(ResultSet rs) throws SQLException {
        List<Course> courses = new LinkedList<>();
        while(rs.next()) {
            Course c = new Course();
            c.setName(rs.getString(1));
            c.setLocation(rs.getString("location"));
            c.setSemester(rs.getString("semester"));
            c.setTime(rs.getString(3));
            c.setCapacity(rs.getInt("capacity"));

            courses.add(c);
        }
        return courses;
    }
}
