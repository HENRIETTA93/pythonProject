import utils.CourseUtils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PreparedStatementExample extends ExampleRunner {
    public static void main(String[] args) {
        print("Starting");
        ExampleRunner r = new PreparedStatementExample();
        r.run();
        r.insert();

        r.close();
    }

    public void run() {
        print("running");
        String name = "Database Applications and Systems";
        try {
            String query = "SELECT * FROM course WHERE name=? AND semester='F20'";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, name);


            ResultSet rs = statement.executeQuery();

            printCourses(CourseUtils.fromResultSet(rs));
        } catch (SQLException s) {
            s.printStackTrace();
        }
    }

    public void insert() {
        String name = "George";
        String email = "g1@example.com";
        try {
            String insertQuery = "INSERT INTO student(name, email, major) VALUES(?, ?, 'ITWS')";
            PreparedStatement statement = connection.prepareStatement(insertQuery);
            statement.setString(1, name);
            statement.setString(2, email);

            int updateCount = statement.executeUpdate();
            printCount(updateCount);
        } catch (SQLException s) {
            s.printStackTrace();
        }
    }
}
