

import java.sql.*;
import java.util.ArrayList;

public class A02MiddleTier {
	//This class will contain your code for interacting with Database, acquire the query result and display it in the GUI text area.

    // A connection to the database
    Connection connection;

    // Statement to run queries
    Statement sql;

    // Prepared Statement
    PreparedStatement ps;

    // Resultset for the query
    ResultSet rs;

    public A02MiddleTier(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean connectDB(String url,String username, String password){
        try {
            connection = DriverManager.getConnection(url, username, password);
            if (connection != null) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public ArrayList<String> doQueryConferences(String from, String to){
        String querySQL="select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventconference ec on e.ID=ec.EventID ";

        if (from!=null &&from.length()>0 && to!=null && to.length()>0) {
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID " +
                                 "join eventconference ec on e.ID=ec.EventID " +
                    "where ah.ActivityDate between '" + from + "' and '" + to+"'";
        }else if(from!=null &&from.length()>0 && to==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventconference ec on e.ID=ec.EventID " +
                    "where ah.ActivityDate >='" + from + "'" ;
        }else if(to!=null && to.length()>0&& from==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventconference ec on e.ID=ec.EventID " +
                    "where ah.ActivityDate <='" + to + "'" ;
        }
        ArrayList<String> resultList=new ArrayList<>();
        resultList.add("ID,Name,EventWebLink,CFPText");

        try {
            ps = connection.prepareStatement(querySQL);
            rs = ps.executeQuery();
            if (rs == null) {
                return resultList;
            }
            while (rs.next()) {
                String rsStr=rs.getString("ID")+","+rs.getString("Name")+","+rs.getString("EventWebLink")+","+rs.getString("CFPText");
                resultList.add(rsStr);
                System.out.println(rsStr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultList;

    }

    public ArrayList<String> doQueryJournal(String from, String to){
        String querySQL="select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventjournal ej on e.ID=ej.EventID"
                ;
        if (from!=null &&from.length()>0 && to!=null && to.length()>0) {
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventjournal ej on e.ID=ej.EventID " +
                    "where ah.ActivityDate between '" + from + "' and '" + to+"'";
        }else if(from!=null &&from.length()>0 && to==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventjournal ej on e.ID=ej.EventID " +
                    "where ah.ActivityDate >='" + from + "'" ;
        }else if(to!=null && to.length()>0&& from==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventjournal ej on e.ID=ej.EventID " +
                    "where ah.ActivityDate <='" + to + "'" ;
        }
        ArrayList<String> resultList=new ArrayList<>();
        resultList.add("ID,Name,EventWebLink,CFPText");

        try {
            ps = connection.prepareStatement(querySQL);
            rs = ps.executeQuery();
            if (rs == null) {
                return resultList;
            }
            while (rs.next()) {
                String rsStr=rs.getString("ID")+","+rs.getString("Name")+","+rs.getString("EventWebLink")+","+rs.getString("CFPText");
                resultList.add(rsStr);
                System.out.println(rsStr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultList;

    }
    public ArrayList<String> doQueryBook(String from, String to){
        String querySQL=" select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventbook eb on e.ID=eb.EventID "
                ;
        if (from!=null &&from.length()>0 && to!=null && to.length()>0) {
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventbook eb on e.ID=eb.EventID " +
                    "where ah.ActivityDate between '" + from + "' and '" + to+"'";
        }else if(from!=null &&from.length()>0 && to==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventbook eb on e.ID=eb.EventID " +
                    "where ah.ActivityDate >='" + from + "'" ;
        }else if(to!=null && to.length()>0&& from==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID join eventbook eb on e.ID=eb.EventID " +
                    "where ah.ActivityDate <='" + to + "'" ;
        }
        ArrayList<String> resultList=new ArrayList<>();
        resultList.add("ID,Name,EventWebLink,CFPText");

        try {
            ps = connection.prepareStatement(querySQL);
            rs = ps.executeQuery();
            if (rs == null) {
                return resultList;
            }
            while (rs.next()) {
                String rsStr=rs.getString("ID")+","+rs.getString("Name")+","+rs.getString("EventWebLink")+","+rs.getString("CFPText");
                resultList.add(rsStr);
                System.out.println(rsStr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultList;

    }

    public ArrayList<String> doQueryEvents(){
        String querySQL="select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID";

        ArrayList<String> resultList=new ArrayList<>();
        resultList.add("ID,Name,EventWebLink,CFPText");

        try {
            ps = connection.prepareStatement(querySQL);
            rs = ps.executeQuery();
            if (rs == null) {
                return resultList;
            }
            while (rs.next()) {
                String rsStr=rs.getString("ID")+","+rs.getString("Name")+","+rs.getString("EventWebLink")+","+rs.getString("CFPText");
                resultList.add(rsStr);
                System.out.println(rsStr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultList;

    }

    public ArrayList<String> doQueryEvents(String from, String to){
        String querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID ";
        if (from!=null &&from.length()>0 && to!=null && to.length()>0) {
           querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID " +
                    "where ah.ActivityDate between '" + from + "' and '" + to+"'";
        }else if(from!=null &&from.length()>0 && to==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID " +
                    "where ah.ActivityDate >='" + from + "'" ;
        }else if(to!=null && to.length()>0&& from==null){
            querySQL = "select distinct e.* from Event e join ActivityHappens ah on e.ID =ah.EventID " +
                    "where ah.ActivityDate <='" + to + "'" ;
        }
//        System.out.println(querySQL);

        ArrayList<String> resultList=new ArrayList<>();
        resultList.add("ID,Name,EventWebLink,CFPText");

        try {
            ps = connection.prepareStatement(querySQL);
            rs = ps.executeQuery();
            if (rs == null) {
                return resultList;
            }
            while (rs.next()) {
                String rsStr=rs.getString("ID")+","+rs.getString("Name")+","+rs.getString("EventWebLink")+","+rs.getString("CFPText");
                resultList.add(rsStr);
                System.out.println(rsStr);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultList;

    }

    public boolean disconnectDB() {
        try {
            if (rs != null)
                rs.close();
            if (ps != null)
                ps.close();
            if (connection != null)
                connection.close();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    public ArrayList<String> displayQueryEvents(){
        A02MiddleTier q3=new A02MiddleTier();
        q3.connectDB("jdbc:mysql://127.0.01:3306/a02schema", "root", "");
        ArrayList<String> resultList=q3.doQueryEvents();
        q3.disconnectDB();
        return resultList;
    }
    public ArrayList<String> displayQueryEvents(String fromm, String to){
        A02MiddleTier q3=new A02MiddleTier();
        q3.connectDB("jdbc:mysql://127.0.01:3306/a02schema", "root", "");
        ArrayList<String> resultList=q3.doQueryEvents(fromm,to);
        q3.disconnectDB();
        return resultList;
    }




    public ArrayList<String> displayQueryConferences(String fromm, String to){
        A02MiddleTier q3=new A02MiddleTier();
        q3.connectDB("jdbc:mysql://127.0.01:3306/a02schema", "root", "");
        ArrayList<String> resultList=q3.doQueryConferences(fromm,to);
        return resultList;
    }
    public ArrayList<String> displayQueryJournal(String fromm, String to){
        A02MiddleTier q3=new A02MiddleTier();
        q3.connectDB("jdbc:mysql://127.0.01:3306/a02schema", "root", "");
        ArrayList<String> resultList=q3.doQueryJournal(fromm,to);
        return resultList;
    }
    public ArrayList<String> displayQueryBook(String fromm, String to){
        A02MiddleTier q3=new A02MiddleTier();
        q3.connectDB("jdbc:mysql://127.0.01:3306/a02schema", "root", "");
        ArrayList<String> resultList=q3.doQueryBook(fromm,to);
        return resultList;
    }


    public static void main(String[] args) {
        new A02MiddleTier().displayQueryEvents();

        System.out.println("---------------------");
        new A02MiddleTier().displayQueryConferences(null,null);
        System.out.println("---------------------");
        new A02MiddleTier().displayQueryJournal(null,"2019-07-01");
        System.out.println("---------------------");
        new A02MiddleTier().displayQueryBook("2019-04-01",null);

        System.out.println("----------------");


    }
}
