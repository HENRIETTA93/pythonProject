import utils.CourseUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BasicExample extends ExampleRunner {

    public static void main(String[] args) {
        print("Starting");
        ExampleRunner r = new BasicExample();
        r.run();
        r.insert();

        r.close();
    }

    public void run() {
        print("running");
        String name = "Database Applications and Systems";
        try {
            Statement statement = connection.createStatement();
            //DON"T DO THIS!!!
            String query = "SELECT * FROM course WHERE name='" + name + "' AND semester='F20'";

            ResultSet rs = statement.executeQuery(query);

            printCourses(CourseUtils.fromResultSet(rs));
        } catch (SQLException s) {
            s.printStackTrace();
        }
    }

    public void insert() {
        try {
            Statement statement = connection.createStatement();
            String insertQuery = "INSERT INTO student(name, email, major) VALUES('Fran', 'fran@example.com', 'ARCH')";

            int updateCount = statement.executeUpdate(insertQuery);
            printCount(updateCount);
        } catch (SQLException s) {
            s.printStackTrace();
        }
    }




}
