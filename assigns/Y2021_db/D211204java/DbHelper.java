import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class DbHelper {
    // A connection to the database
    Connection connection;

    // Statement to run queries
    Statement sql;

    // Prepared Statement
    PreparedStatement ps;

    // Resultset for the query
    ResultSet rs;
    SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd");

    SimpleDateFormat sdf1=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");

    public DbHelper(){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
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


    /**
     * insert into department
     * @param deptName
     * @return
     */
    public int insertDepartment(String deptName) {
        String queryCount="select max(dept_id) from department";
        String queryDeptName="select * from department where lower(dept_name)=?";
        String sql="insert into department values (?,?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(queryDeptName);
            ps.setString(1,deptName.trim().toLowerCase());
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(sql);
            ps.setInt(1,count+1);
            ps.setString(2,deptName);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    /**
     * insert into job
     * @param jobType
     * @param jobTitle
     * @param salary
     * @return
     */
    public int insertJob(String jobType, String jobTitle, String salary) {
        String queryCount="select max(job_id) from job";
        String queryJob="select * from job where lower(job_type)=? and lower(job_title)=? and salary=?";
        String sql="insert into job values (?,?,?,?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(queryJob);
            ps.setString(1,jobType.trim().toLowerCase());
            ps.setString(2,jobTitle.trim().toLowerCase());
            ps.setString(3,salary.trim());
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(sql);
            ps.setInt(1,count+1);
            ps.setString(2,jobType);
            ps.setString(3,jobTitle);
            ps.setString(4,salary);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int insertEmployee(String firstName, String lastName, String deptId,String jobId){
        String queryCount="select max(employee_id) from employee";
        String queryEmployee="select * from employee where lower(first_name)=? and lower(last_name)=? and dept_id=? and job_id=?";
        String sql="insert into employee values (?,?,?,?,?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(queryEmployee);
            ps.setString(1,firstName.trim().toLowerCase());
            ps.setString(2,lastName.trim().toLowerCase());
            ps.setString(3,deptId.trim());
            ps.setString(4,jobId.trim());
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(sql);
            ps.setInt(1,count+1);
            ps.setString(2,firstName);
            ps.setString(3,lastName);
            ps.setString(4,deptId);
            ps.setString(5,jobId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }


    public int insertServices(String serviceType,String deptId, String servicePrice) {

        String queryJob="select * from services where lower(service_type)=? and dept_id=? and service_price=?";
        String sql="insert into services values (?,?,?)";
        try {

            ps=connection.prepareStatement(queryJob);
            ps.setString(1,serviceType.trim().toLowerCase());
            ps.setString(2,deptId);
            ps.setString(3,servicePrice);
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(sql);
            ps.setString(1,serviceType.trim().toLowerCase());
            ps.setString(2,deptId);
            ps.setString(3,servicePrice);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }



    public int insertUsers(String firstName, String lastName) {
        String queryCount="select max(user_id) from users";
        String queryUser="select * from users where lower(first_name)=? and lower(last_name)=?";
        String sql="insert into users values (?,?,?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(queryUser);
            ps.setString(1,firstName.trim().toLowerCase());
            ps.setString(2,lastName.trim().toLowerCase());
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(sql);
            ps.setInt(1,count+1);
            ps.setString(2,firstName.trim().toLowerCase());
            ps.setString(3,lastName.trim().toLowerCase());
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }


    public int insertAppointments(String userId, String serviceType, java.util.Date appointDate, java.util.Date beginTime, java.util.Date endTime){
        String queryCount="select max(appoint_id) from appointment";
        String queryAppoint="select * from appointment where user_id=? and lower(service_type)=? and to_char(appointment_date,'YYYY-MM-DD')=? and to_char(begin_time,'hh24:mi:ss')=?" +
                "and to_char(end_time,'hh24:mi:ss')=?" +
                "union " +
                "select * from appointment where (user_id=? and begin_time between to_date(?,'YYYY-MM-DD hh24:mi:ss') and to_date(?,'YYYY-MM-DD hh24:mi:ss'))" +
                "or (user_id=? and end_time is null and begin_time<to_date(?,'YYYY-MM-DD hh24:mi:ss'))";
        String sql = "insert into appointment values (?,?,?,to_date(?,'YYYY-MM-DD'),to_date(?,'hh24:mi:ss'),to_date(?,'hh24:mi:ss'))";
        if(endTime!=null) {
             sql= "insert into appointment values (?,?,?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD hh24:mi:ss'),to_date(?,'YYYY-MM-DD hh24:mi:ss'))";
        }else{
            sql = "insert into appointment values (?,?,?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD hh24:mi:ss'),null)";
        }
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(queryAppoint);
            ps.setString(1,userId);
            ps.setString(2,serviceType.trim().toLowerCase());

            ps.setString(3,sdf.format(appointDate));
//            System.out.println(sdf.format(appointDate));
//            System.out.println(sdf1.format(beginTime));
            ps.setString(4,sdf1.format(beginTime));
            if (endTime!=null) {
                ps.setString(5, sdf1.format(endTime));
                ps.setString(8,sdf1.format(endTime));
            }else{
                ps.setString(5,null);
                ps.setString(8,null);
            }
            ps.setString(6,userId);
            ps.setString(7,sdf1.format(beginTime));
            ps.setString(9,userId);
            ps.setString(10,sdf1.format(beginTime));
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(sql);
            ps.setInt(1,count+1);
            ps.setString(2,serviceType.trim());
            ps.setString(3,userId);
            ps.setString(4,sdf.format(appointDate));
            ps.setString(5,sdf1.format(beginTime));
            if (endTime!=null) {
                ps.setString(6, sdf1.format(endTime));
            }
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int insertTransactions(String appointId, String payPrice){
        String queryCount="select max(transaction_id) from transactions";
        String queryTrans="select * from transactions where appoint_id=? and pay_price=?";
        String insert="insert into transactions values(?,?,?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(queryTrans);
            ps.setString(1,appointId);
            ps.setString(2,payPrice);
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(insert);
            ps.setInt(1,count+1);
            ps.setString(2,appointId);
            ps.setString(3,payPrice);

            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;

    }

    public int insertStateId(String userId, java.util.Date dateIssued, java.util.Date dateExpired){
        String queryCount="select max(state_id) from stateid";
        String query="select * from stateid where user_id=? and to_char(date_issued,'YYYY-MM-DD')=? and to_char(date_expired,'YYYY-MM-DD')=?";
        String insert="insert into stateid values(?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD'),?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(query);
            ps.setString(1,userId);
            ps.setString(2,sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(insert);
            ps.setInt(1,count+1);
            ps.setString(2, sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            ps.setString(4,userId);

            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public int insertRegistration(String userId, java.util.Date dateIssued, java.util.Date dateExpired){
        String queryCount="select max(registration_id) from registration";
        String query="select * from registration where user_id=? and to_char(date_issued,'YYYY-MM-DD')=? and to_char(date_expired,'YYYY-MM-DD')=?";
        String insert="insert into registration values(?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD'),?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(query);
            ps.setString(1,userId);
            ps.setString(2,sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(insert);
            ps.setInt(1,count+1);
            ps.setString(2, sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            ps.setString(4,userId);

            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public int insertPermit(String userId, java.util.Date dateIssued, java.util.Date dateExpired){
        String queryCount="select max(permit_id) from permit";
        String query="select * from permit where user_id=? and to_char(date_issued,'YYYY-MM-DD')=? and to_char(date_expired,'YYYY-MM-DD')=?";
        String insert="insert into permit values(?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD'),?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(query);
            ps.setString(1,userId);
            ps.setString(2,sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(insert);
            ps.setInt(1,count+1);
            ps.setString(2, sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            ps.setString(4,userId);

            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public int insertLicense(String userId, java.util.Date dateIssued, java.util.Date dateExpired){
        String queryCount="select max(license_id) from license";
        String query="select * from license where user_id=? and to_char(date_issued,'YYYY-MM-DD')=? and to_char(date_expired,'YYYY-MM-DD')=?";
        String insert="insert into license values(?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD'),?)";
        try {
            ps=connection.prepareStatement(queryCount);
            rs=ps.executeQuery();
            rs.next();
            int count=rs.getInt(1);

            ps=connection.prepareStatement(query);
            ps.setString(1,userId);
            ps.setString(2,sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            rs=ps.executeQuery();
            boolean isExists=rs.next();
            if(isExists){
                return 0;
            }

            ps=connection.prepareStatement(insert);
            ps.setInt(1,count+1);
            ps.setString(2, sdf.format(dateIssued));
            ps.setString(3,sdf.format(dateExpired));
            ps.setString(4,userId);

            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int updateAppointment(String appointId,java.util.Date endTime){
        String update="update appointment set end_time=to_date(?,'YYYY-MM-DD hh24:mi:ss') where appoint_id=?";
        try {

            ps=connection.prepareStatement(update);
            ps.setString(1,sdf1.format(endTime));
            ps.setString(2,appointId);

            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int updateServiceFee(String service,String fee){
        String update="update services set service_price=? where service_type=?";
        try {

            ps=connection.prepareStatement(update);
            ps.setString(2,service);
            ps.setString(1,fee);

            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }


    /////select
    public List<String> queryAllDepartment(){
        String query="select * from department order by dept_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer deptId=rs.getInt(1);
                String deptName=rs.getString(2);
                resultList.add(deptId+","+deptName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    ///--------------------
    public List<String> queryAllJob(){
        String query="select * from job order by job_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer jobId=rs.getInt(1);
                String jobType=rs.getString(2);
                String jobTitle=rs.getString(3);
                String salary=rs.getString(4);
                resultList.add(jobId+","+jobType+","+jobTitle+","+salary);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllEmployees(){
        String query="select * from employee order by employee_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer employeeId=rs.getInt(1);
                String firstName=rs.getString(2);
                String lastName=rs.getString(3);
                String deptId=rs.getString(4);
                String jobId=rs.getString(5);
                resultList.add(employeeId+","+firstName+","+lastName+","+deptId+","+jobId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllServices(){
        String query="select * from services order by service_type";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                String serviceType=rs.getString(1);
                String deptId=rs.getString(2);
                String fee=rs.getString(3);
                resultList.add(serviceType+","+deptId+","+fee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllUsers(){
        String query="select * from users order by user_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                Integer userId=rs.getInt(1);
                String fisrtName=rs.getString(2);
                String lastName=rs.getString(3);
                resultList.add(userId+","+fisrtName+","+lastName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllStatid(){
        String query="select * from stateid order by state_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer stateId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(stateId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }
    public List<String> queryAllPermit(){
        String query="select * from permit order by permit_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer permitId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(permitId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllRegistration(){
        String query="select * from registration order by registration_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){


                Integer registId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(registId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllLicenses(){
        String query="select * from license order by license_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){


                Integer licenseId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(licenseId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllAppointments(){
        String query="select * from appointment order by appoint_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){


                Integer appointId=rs.getInt(1);
                String serviceType=rs.getString(2);
                String userId=rs.getString(3);
                String appointDate=rs.getString(4);
                String beginTime=rs.getString(5);
                String endTime=rs.getString(6);
                resultList.add(appointId+","+serviceType+","+userId+","+appointDate+","+beginTime+","+endTime);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAllTransactions(){
        String query="select * from transactions order by transaction_id";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){


                Integer transId=rs.getInt(1);
                String appointId=rs.getString(2);
                String payPrice=rs.getString(3);

                resultList.add(transId+","+appointId+","+payPrice);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }


    public List<String> queryDepartment(String deptId){
        String query="select * from department where dept_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,deptId);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer deptId1=rs.getInt(1);
                String deptName=rs.getString(2);
                resultList.add(deptId1+","+deptName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryJob(String jobid){
        String query="select * from job where job_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,jobid);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer jobId=rs.getInt(1);
                String jobType=rs.getString(2);
                String jobTitle=rs.getString(3);
                String salary=rs.getString(4);
                resultList.add(jobId+","+jobType+","+jobTitle+","+salary);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryEmployee(String empId){
        String query="select * from employee where employee_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,empId);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer employeeId=rs.getInt(1);
                String firstName=rs.getString(2);
                String lastName=rs.getString(3);
                String deptId=rs.getString(4);
                String jobId=rs.getString(5);
                resultList.add(employeeId+","+firstName+","+lastName+","+deptId+","+jobId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryService(String servType){
        String query="select * from services where service_type=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,servType);
            rs=ps.executeQuery();
            while(rs.next()){

                String serviceType=rs.getString(1);
                String deptId=rs.getString(2);
                String fee=rs.getString(3);
                resultList.add(serviceType+","+deptId+","+fee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryUser(String useId){
        String query="select * from users where user_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,useId);
            rs=ps.executeQuery();
            while(rs.next()){
                Integer userId=rs.getInt(1);
                String fisrtName=rs.getString(2);
                String lastName=rs.getString(3);
                resultList.add(userId+","+fisrtName+","+lastName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryStatid(String state){
        String query="select * from stateid where state_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,state);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer stateId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(stateId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }
    public List<String> queryPermit(String permit){
        String query="select * from permit where permit_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,permit);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer permitId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(permitId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryRegistration(String regist){
        String query="select * from registration where registration_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,regist);
            rs=ps.executeQuery();
            while(rs.next()){


                Integer registId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(registId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryLicense(String license){
        String query="select * from license where license_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,license);
            rs=ps.executeQuery();
            while(rs.next()){


                Integer licenseId=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);
                resultList.add(licenseId+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryAppointment(String appoint){
        String query="select * from appointment where appoint_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,appoint);
            rs=ps.executeQuery();
            while(rs.next()){


                Integer appointId=rs.getInt(1);
                String serviceType=rs.getString(2);
                String userId=rs.getString(3);
                String appointDate=rs.getString(4);
                String beginTime=rs.getString(5);
                String endTime=rs.getString(6);
                resultList.add(appointId+","+serviceType+","+userId+","+appointDate+","+beginTime+","+endTime);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> queryTransaction(String trans){
        String query="select * from transactions where transaction_id=?";
        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,trans);
            rs=ps.executeQuery();
            while(rs.next()){

                Integer transId=rs.getInt(1);
                String appointId=rs.getString(2);
                String payPrice=rs.getString(3);

                resultList.add(transId+","+appointId+","+payPrice);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public int deleteDepartment(String deptId){
        String query="delete from department where dept_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,deptId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int deleteJob(String jobId){
        String query="delete from job where job_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,jobId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int deleteEmployee(String empId){
        String query="delete from employee where employee_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,empId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int deleteService(String serviceType){
        String query="delete from services where service_type=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,serviceType);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int deleteUser(String userId){
        String query="delete from users where user_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,userId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int deleteAppointment(String appointId){
        String query="delete from appointment where appoint_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,appointId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public int deleteTransaction(String transId){
        String query="delete from transactions where transaction_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,transId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public int deleteStateId(String stateId){
        String query="delete from stateid where state_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,stateId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public int deletePermit(String permitId){
        String query="delete from permit where permit_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,permitId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public int deleteRegistration(String regId){
        String query="delete from department where registration_id=?";
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,regId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
    public int deleteLicense(String licenseId){
        String query="delete from license where license_id=?";

        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,licenseId);
            return ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }



/*
select state_id as id, date_issued,date_expired, user_id
from stateid
where to_char(date_expired,'MM/DD/YYYY')='12/06/2021'
union
select permit_id as id, date_issued,date_expired, user_id
from permit
where to_char(date_expired,'MM/DD/YYYY')='12/06/2021'
union
select registration_id as id, date_issued,date_expired, user_id
from registration
where to_char(date_expired,'MM/DD/YYYY')='12/06/2021'
union
select license_id as id, date_issued,date_expired, user_id
from license
where to_char(date_expired,'MM/DD/YYYY')='12/06/2021';


select 'stateid', count(*) as idnum
from stateid
where to_char(date_issued,'YYYY-MM')='2021-12'
union
select 'registration', count(*) as idnum
from registration
where to_char(date_issued,'YYYY-MM')='2021-12'
union
select 'permit', count(*) as idnum
from permit
where to_char(date_issued,'YYYY-MM')='2021-12'
union
select 'license', count(*) as idnum
from license
where to_char(date_issued,'YYYY-MM')='2021-12';


select d.dept_name, sum(s.service_price) as total_fee
from department d join services s on s.dept_id=d.dept_id
join appointment a on a.service_type=s.service_type
join transactions t on t.appoint_id=a.appoint_id
group by d.dept_name;

select u.user_id, u.first_name ||' '||u.last_name
from users u join stateid s on u.user_id=s.user_id
group by u.user_id,u.first_name ||' '||u.last_name
having count(s.state_id)>=2;
 */





    public List<String> query1(String queryDate){
        String query="select state_id as id, date_issued,date_expired, user_id\n" +
                "from stateid \n" +
                "where to_char(date_expired,'MM/DD/YYYY')=? \n" +
                "union\n" +
                "select permit_id as id, date_issued,date_expired, user_id\n" +
                "from permit\n" +
                "where to_char(date_expired,'MM/DD/YYYY')=? \n" +
                "union\n" +
                "select registration_id as id, date_issued,date_expired, user_id\n" +
                "from registration \n" +
                "where to_char(date_expired,'MM/DD/YYYY')=? \n" +
                "union\n" +
                "select license_id as id, date_issued,date_expired, user_id\n" +
                "from license \n" +
                "where to_char(date_expired,'MM/DD/YYYY')=?";

        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,queryDate);
            ps.setString(2,queryDate);
            ps.setString(3,queryDate);
            ps.setString(4,queryDate);

            rs=ps.executeQuery();
            while(rs.next()){

                Integer Id=rs.getInt(1);
                String dateIssued=rs.getString(2);
                String dateExpired=rs.getString(3);
                String userId=rs.getString(4);

                resultList.add(Id+","+dateIssued+","+dateExpired+","+userId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }


    public List<String> query2(String queryDate){
        String query="select 'stateid' as typeName, count(*) as idnum \n" +
                "        from stateid\n" +
                "        where to_char(date_issued,'YYYY-MM')=?" +
                "        union\n" +
                "        select 'registration' as typeName, count(*) as idnum \n" +
                "        from registration\n" +
                "        where to_char(date_issued,'YYYY-MM')=?" +
                "        union\n" +
                "        select 'permit' as typeName, count(*) as idnum \n" +
                "        from permit\n" +
                "        where to_char(date_issued,'YYYY-MM')=?" +
                "        union\n" +
                "        select 'license' as typeName, count(*) as idnum \n" +
                "        from license\n" +
                "        where to_char(date_issued,'YYYY-MM')=?";

        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            ps.setString(1,queryDate);
            ps.setString(2,queryDate);
            ps.setString(3,queryDate);
            ps.setString(4,queryDate);

            rs=ps.executeQuery();
            while(rs.next()){

                String type=rs.getString(1);
                String idnum=rs.getString(2);
                resultList.add(type+","+idnum);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }

    public List<String> query3(){
        String query="select d.dept_name, sum(s.service_price) as total_fee\n" +
                "from department d join services s on s.dept_id=d.dept_id\n" +
                "join appointment a on a.service_type=s.service_type\n" +
                "join transactions t on t.appoint_id=a.appoint_id\n" +
                "group by d.dept_name";

        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                String deptName=rs.getString(1);
                String fee=rs.getString(2);
                resultList.add(deptName+","+fee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }
    public List<String> query4(){
        String query="select u.user_id, u.first_name ||' '||u.last_name as name \n" +
                "from users u join stateid s on u.user_id=s.user_id\n" +
                "group by u.user_id,u.first_name ||' '||u.last_name\n" +
                "having count(s.state_id)>=2";

        List<String> resultList=new ArrayList<>();
        try {
            ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){

                String userId=rs.getString(1);
                String userName=rs.getString(2);
                resultList.add(userId+","+userName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultList;
    }


    public static void main(String[] args) {
        DbHelper dbHelper=new DbHelper();
        dbHelper.connectDB("jdbc:oracle:thin:@192.168.7.212:1521:orcl","c##scott","tiger");
        dbHelper.insertDepartment("State ID Dept");
        dbHelper.insertJob("xxxx","jjjjfff","1200");
        dbHelper.insertEmployee("first","last","1","1");
        dbHelper.insertServices("State","1","12");
        dbHelper.insertUsers("first1","last1");

        List<String> departments= dbHelper.queryAllDepartment();
        System.out.println(departments);
        List<String> jobs=dbHelper.queryAllJob();
        System.out.println(jobs);

        List<String> employees=dbHelper.queryAllEmployees();
        System.out.println(employees);
        List<String> services=dbHelper.queryAllServices();
        System.out.println(services);
        List<String> users=dbHelper.queryAllUsers();
        System.out.println(users);

        dbHelper.insertAppointments("1","State",new java.util.Date(), new java.util.Date(), null);

        List<String> appoints=dbHelper.queryAllAppointments();
        System.out.println(appoints);

        List<String> liscenses=dbHelper.queryAllLicenses();
        System.out.println(liscenses);

        List<String> permits=dbHelper.queryAllPermit();
        System.out.println(permits);

        List<String> registrations=dbHelper.queryAllRegistration();
        System.out.println(registrations);

        List<String> statid=dbHelper.queryAllStatid();
        System.out.println(statid);

        List<String> trans=dbHelper.queryAllTransactions();
        System.out.println(trans);


        appoints=dbHelper.queryAppointment("1");
        System.out.println(appoints);

        liscenses=dbHelper.queryLicense("1");
        System.out.println(liscenses);

         permits=dbHelper.queryPermit("1");
        System.out.println(permits);

        registrations=dbHelper.queryRegistration("1");
        System.out.println(registrations);

        statid=dbHelper.queryStatid("1");
        System.out.println(statid);

        trans=dbHelper.queryTransaction("1");
        System.out.println(trans);

        dbHelper.updateServiceFee("State","20");

        List<String> list1=dbHelper.query1("12/06/2021");
        System.out.println(list1);
        List<String> list2=dbHelper.query2("2021-12");
        System.out.println(list2);
        List<String> list3=dbHelper.query3();
        System.out.println(list3);
        List<String> list4=dbHelper.query4();
        System.out.println(list4);
    }
}
