import utils.CourseUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

public class UpdateExample extends ExampleRunner {
    Random random = new Random();

    public static void main(String[] args) {
        ExampleRunner r = new UpdateExample();
        r.run();

        r.close();
    }

    public void run() {
        String select = "SELECT * FROM course";

        //Don't do it this way
        String insert = "INSERT INTO student(name, email, major) VALUES('Anonymous%d', 'A%d@example.com', 'ITWS')";

        try {
            Statement statement = connection.createStatement();

            boolean results;
            if(random.nextBoolean()) {
                results = statement.execute(select);
            } else {
                int num = random.nextInt();
                results = statement.execute(String.format(insert, num, num));
            }

            if(results) {
                ResultSet rs = statement.getResultSet();
                printCourses(CourseUtils.fromResultSet(rs));
            } else {
                printCount(statement.getUpdateCount());
            }
        } catch (SQLException s) {
            s.printStackTrace();
        }

    }
}
