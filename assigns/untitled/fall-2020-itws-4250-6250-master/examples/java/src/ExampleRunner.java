import beans.Course;
import utils.CourseUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class ExampleRunner {

    protected Connection connection;

    public ExampleRunner() {
        try {
            this.connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/example_db?user=example_user&password=password"
            );
        } catch (SQLException s) {
            s.printStackTrace();
        }
    }

    public void run() {

    }

    public void insert() {

    }

    protected void close() {
        try {
            connection.close();
        } catch (SQLException s) {
            s.printStackTrace();
        }
    }

    public static void print(String s) {
        System.out.println(s);
    }

    public static void printCourses(List<Course> courses) {
        for (Course c: courses) {
            print(CourseUtils.toString(c));
        }
    }

    protected static void printCount(int updateCount) {
        print("Updated " + String.valueOf(updateCount) + " rows in the database");
    }
}
