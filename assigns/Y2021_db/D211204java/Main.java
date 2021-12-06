
import sun.awt.windows.WPrinterJob;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class Main {
    DbHelper dbHelper=new DbHelper();
    String url="jdbc:oracle:thin:@192.168.7.212:1521:orcl";
    String username="c##scott";
    String password="tiger";

    public static void main(String[] args) {

        Main main=new Main();
        Scanner scanner=new Scanner(System.in);
        display();
        System.out.println("Choose your selections:");
        String input=scanner.nextLine();
        while(!input.equals("-1")){
            switch (input){
                case "1.1":
                    System.out.println("Please input the name of the department which you would add:");
                    String department=scanner.nextLine();
                    main.addDepartment(department);
                    System.out.println("-------------------all departments info---------------------");
                    main.queryDepartment();
                    break;
                case "1.2":
                    System.out.println("Please input the type of job which you would add:");
                    String type=scanner.nextLine();
                    System.out.println("Please input the title of job which you would add:");
                    String title=scanner.nextLine();
                    System.out.println("Please input the salary of job which you would add:");
                    String salary=scanner.nextLine();
                    main.addJob(type,title,salary);
                    System.out.println("-------------------all jobs info---------------------");
                    main.queryJob();
                    break;
                case "1.3":
                    System.out.println("Please input the first name of employee that you would add:");
                    String firstName=scanner.nextLine();
                    System.out.println("Please input the last name of employee that you would add:");
                    String lastName=scanner.nextLine();
                    System.out.println("Please choose the deptID which you would add:");
                    main.queryDepartment();
                    String deptId=scanner.nextLine();
                    System.out.println("Please choose the jobId which you would add:");
                    main.queryJob();
                    String jobId=scanner.nextLine();
                    main.addEmployee(firstName,lastName,deptId,jobId);
                    System.out.println("-------------------all employees info---------------------");
                    main.queryEmployee();
                    break;
                case "1.4":

                    System.out.println("Please input which service you want to add:[1]-State ID,[2]-License,[3]-Vehicle Registration,[4]-Permit:");
                    String serviceType=scanner.nextLine();
                    System.out.println("Please choose the deptID which you would add:");
                    main.queryDepartment();
                    String deptId1=scanner.nextLine();
                    System.out.println("Please input the fee:");
                    String fee=scanner.nextLine();
                    main.addService(serviceType,deptId1,fee);
                    System.out.println("-------------------all services info---------------------");
                    main.queryServices();
                    break;
                case "1.5":
                    System.out.println("Please input the first name of user which you would add:");
                    String firstName1=scanner.nextLine();
                    System.out.println("Please input the last name of user which you would add:");
                    String lastName1=scanner.nextLine();
                    main.addUser(firstName1,lastName1);
                    System.out.println("-------------------all users info---------------------");
                    main.queryUser();
                    break;
                case "2.1":
                    System.out.println("Step1 Input your user id");
                    main.queryUser();
                    String userId=scanner.nextLine();
                    System.out.println("Step2 Choose service type for your appointments:");
                    main.queryServices();
                    serviceType=scanner.nextLine();
                    Date appointDate=new Date();
                    Date beginTime=new Date();
                    Date endTime=null;
                    main.addAppointment(userId,serviceType,appointDate,beginTime,endTime);
                    System.out.println("-------------------all appoints info---------------------");
                    main.queryAppointments();
                    break;
                case "2.2":
                    System.out.println("-----------------all appoints info----------------------");
                    main.queryAppointments();
                    System.out.println("Step1 Input appoint id");
                    String appointId=scanner.nextLine();
                    endTime=new Date();
                    main.updateAppointment(appointId,endTime);
                    System.out.println("-----------------all appoints info----------------------");
                    main.queryAppointments();
                    break;
                case "3.1":
                    main.queryDepartment();
                    break;
                case "3.2":
                    main.queryJob();
                    break;
                case "3.3":
                    main.queryEmployee();
                    break;
                case "3.4":
                    main.queryServices();
                    break;
                case "3.5":
                    main.queryUser();
                    break;
                case "3.6":
                    main.queryStateId();
                    break;
                case "3.7":
                    main.queryPermit();
                    break;
                case "3.8":
                    main.queryRegistration();
                    break;
                case "3.9":
                    main.queryLicense();
                    break;
                case "3.10":
                    main.queryAppointments();
                    break;
                case "3.11":
                    main.queryTransactions();
                    break;
                case "4.1":
                    System.out.println("Please input the id you want to delete");
                    String id=scanner.nextLine();
                    main.deleteDeparmtent(id);
                    break;
                case "4.2":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteJob(id);
                    break;
                case "4.3":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteEmployee(id);
                    break;
                case "4.4":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteService(id);
                    break;
                case "4.5":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteUser(id);
                    break;
                case "4.6":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteStateId(id);
                    break;
                case "4.7":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deletePermit(id);
                    break;
                case "4.8":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteRegistration(id);
                    break;
                case "4.9":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteLicense(id);
                    break;
                case "4.10":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteAppointment(id);
                    break;
                case "4.11":
                    System.out.println("Please input the id you want to delete");
                    id=scanner.nextLine();
                    main.deleteTransaction(id);
                    break;
                case "5.1":
                    System.out.println("Please input the date you want to query");
                    String queryDate=scanner.nextLine();
                    main.query1(queryDate);
                    break;
                case "5.2":
                    System.out.println("Please input the date you want to query");
                    queryDate=scanner.nextLine();
                    main.query2(queryDate);
                    break;
                case "5.3":
                    main.query3();
                    break;
                case "5.4":
                    main.query4();
                    break;

            }
            System.out.println("Choose your selections:");
            input=scanner.nextLine();

        }
        System.out.println("Bye!");
    }

    public static void display(){
//
        System.out.println("^^^^^^^^^^^^^^^^Welcome to DMV^^^^^^^^^^^^^^^^^^^^^^");

        System.out.println("Please choose the selections as the list:");
        System.out.println("***************1: Basic Data Operations*************");
        System.out.println("1.1 insert datas into department");
        System.out.println("1.2 insert datas into job");
        System.out.println("1.3 insert datas into employee");
        System.out.println("1.4 insert datas into services");
        System.out.println("1.5 insert datas into users");


        System.out.println("***************2: Make Appointments<Insert and Update>*****************");
        System.out.println("2.1 Please input 2.1 if you want to make an appointment");
        System.out.println("2.2 Update an appointment");


        System.out.println("***************3: Query Information of DMV**********");
        System.out.println("3.1 query all departments");
        System.out.println("3.2 query all jobs");
        System.out.println("3.3 query all employees");
        System.out.println("3.4 query all services");
        System.out.println("3.5 query all users");
        System.out.println("3.6 query all statid");
        System.out.println("3.7 query all permit");
        System.out.println("3.8 query all registration");
        System.out.println("3.9 query all licenses");
        System.out.println("3.10 query all appointments");
        System.out.println("3.11 query all transactions");

        System.out.println("***************4: Delete Information of DMV**********");
        System.out.println("4.1 delete departments");
        System.out.println("4.2 delete jobs");
        System.out.println("4.3 delete employees");
        System.out.println("4.4 delete services");
        System.out.println("4.5 delete users");
        System.out.println("4.6 delete statid");
        System.out.println("4.7 delete permit");
        System.out.println("4.8 delete registration");
        System.out.println("4.9 delete licenses");
        System.out.println("4.10 delete appointments");
        System.out.println("4.11 delete transactions");

        System.out.println("***************5: Queries of DMV**********");
        System.out.println("5.1 input query date, the format is MM/DD/YYYY");
        System.out.println("5.2 input query month, the format is YYYY-MM");
        System.out.println("5.3");
        System.out.println("5.4");
        System.out.println("^^^^^^^^^^^^^^^^^^^^Bye!^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    }

    public void addDepartment(String department){
        dbHelper.connectDB(url,username,password);
        int result= dbHelper.insertDepartment(department);
        if(result>0){
            System.out.println("Department: "+department +" has been added!");
        }else{
            System.out.println("Department: "+department+" hasn't added! Because it has exists!");
        }
        dbHelper.disconnectDB();
    }
    public void addJob(String jobType,String jobTitle, String salary){
        dbHelper.connectDB(url,username,password);
        int result= dbHelper.insertJob(jobType, jobTitle, salary);
        if(result>0){
            System.out.println("Job: ("+jobType+","+jobTitle+","+salary +") has been added!");
        }else{
            System.out.println("Job: ("+jobType+","+jobTitle+","+salary +") hasn't added! Because it has exists!");
        }
        dbHelper.disconnectDB();
    }
    public void addEmployee(String firstName, String lastName, String deptId, String jobId){
        dbHelper.connectDB(url,username,password);
        int result= dbHelper.insertEmployee(firstName,lastName,deptId, jobId);
        if(result>0){
            System.out.println("Job: ("+firstName+","+lastName+","+deptId+","+jobId +") has been added!");
        }else{
            System.out.println("Job: ("+firstName+","+lastName+","+deptId+","+jobId +")  hasn't added! Because it has exists!");
        }
        dbHelper.disconnectDB();
    }


    public void addService(String serviceType, String deptId,String fee){
        dbHelper.connectDB(url, username, password);
        int result=dbHelper.insertServices(serviceType,deptId,fee);
        if (result>0){
            System.out.println("Services: ("+serviceType+","+deptId+","+fee+") has been added!");
        }else {
            System.out.println("Services: ("+serviceType+","+deptId+","+fee+") hasn't been added! Because it has exists!");
        }
        dbHelper.disconnectDB();
    }
    public void addUser(String fisrtName, String lastName){
        dbHelper.connectDB(url,username,password);
        int result=dbHelper.insertUsers(fisrtName,lastName);
        if(result>0){
            System.out.println("User: ("+fisrtName+","+lastName+") has been added!");
        }else{
            System.out.println("User: ("+fisrtName+","+lastName+") hasn't added! Because it has exists!");
        }
        dbHelper.disconnectDB();
    }


    public void addAppointment(String userId,String serviceType,Date appointDate, Date beginTime, Date endTime){
        dbHelper.connectDB(url,username,password);
        int result=dbHelper.insertAppointments(userId,serviceType,appointDate,beginTime,endTime);
        if(result>0){
            System.out.println("Appointment: ("+userId+","+serviceType+") has been made!");
        }else{
            System.out.println("Appointment: ("+userId+","+serviceType+") hasn't made! Because not overlap!");
        }
        dbHelper.disconnectDB();
    }
    public void addPermit(String userId,Date dateIssued){
        dbHelper.connectDB(url,username,password);
        Calendar rightNow= Calendar.getInstance();
        rightNow.setTime(dateIssued);
        rightNow.add(Calendar.YEAR,1);
        Date dateExpired=rightNow.getTime();
        int result=dbHelper.insertPermit(userId,dateIssued,dateExpired);
        if(result>0){
            System.out.println("Permit: ("+userId+","+dateIssued+","+dateExpired+") has been made!");
        }else{
            System.out.println("Permit: ("+userId+","+dateIssued+","+dateExpired+")  hasn't made!");
        }
        dbHelper.disconnectDB();
    }

    public void addRegistration(String userId,Date dateIssued){
        dbHelper.connectDB(url,username,password);
        Calendar rightNow= Calendar.getInstance();
        rightNow.setTime(dateIssued);
        rightNow.add(Calendar.YEAR,1);
        Date dateExpired=rightNow.getTime();
        int result=dbHelper.insertRegistration(userId,dateIssued,dateExpired);
        if(result>0){
            System.out.println("Registration: ("+userId+","+dateIssued+","+dateExpired+") has been made!");
        }else{
            System.out.println("Registration: ("+userId+","+dateIssued+","+dateExpired+")  hasn't made!");
        }
        dbHelper.disconnectDB();
    }
    public void addLicense(String userId,Date dateIssued){
        dbHelper.connectDB(url,username,password);
        Calendar rightNow= Calendar.getInstance();
        rightNow.setTime(dateIssued);
        rightNow.add(Calendar.YEAR,12);
        Date dateExpired=rightNow.getTime();
        int result=dbHelper.insertLicense(userId,dateIssued,dateExpired);
        if(result>0){
            System.out.println("License: ("+userId+","+dateIssued+","+dateExpired+") has been made!");
        }else{
            System.out.println("License: ("+userId+","+dateIssued+","+dateExpired+")  hasn't made!");
        }
        dbHelper.disconnectDB();
    }
    public void addState(String userId,Date dateIssued){
        dbHelper.connectDB(url,username,password);
        Calendar rightNow= Calendar.getInstance();
        rightNow.setTime(dateIssued);
        rightNow.add(Calendar.YEAR,20);
        Date dateExpired=rightNow.getTime();
        int result=dbHelper.insertStateId(userId,dateIssued,dateExpired);
        if(result>0){
            System.out.println("StateId: ("+userId+","+dateIssued+","+dateExpired+") has been made!");
        }else{
            System.out.println("StateId: ("+userId+","+dateIssued+","+dateExpired+")  hasn't made!");
        }
        dbHelper.disconnectDB();
    }

    public void queryDepartment(){
        dbHelper.connectDB(url,username,password);
        List<String> depts=dbHelper.queryAllDepartment();
        for(String s: depts){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }

    public void queryJob(){
        dbHelper.connectDB(url,username,password);
        List<String> jobs=dbHelper.queryAllJob();
        for(String s: jobs){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }

    public void queryEmployee(){
        dbHelper.connectDB(url,username,password);
        List<String> employees=dbHelper.queryAllEmployees();
        for (String s: employees){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }
    public void queryServices(){
        dbHelper.connectDB(url,username,password);
        List<String> services=dbHelper.queryAllServices();
        for (String s: services){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }
    public void queryUser(){
        dbHelper.connectDB(url,username,password);
        List<String> users=dbHelper.queryAllUsers();
        for (String s: users){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }
    public void queryStateId(){
        dbHelper.connectDB(url,username,password);
        List<String> users=dbHelper.queryAllStatid();
        for (String s: users){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }
    public void queryPermit(){
        dbHelper.connectDB(url,username,password);
        List<String> users=dbHelper.queryAllPermit();
        for (String s: users){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }
    public void queryLicense(){
        dbHelper.connectDB(url,username,password);
        List<String> users=dbHelper.queryAllLicenses();
        for (String s: users){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }
    public void queryRegistration(){
        dbHelper.connectDB(url,username,password);
        List<String> users=dbHelper.queryAllRegistration();
        for (String s: users){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }


    public void queryAppointments(){
        dbHelper.connectDB(url,username,password);
        List<String> appoints=dbHelper.queryAllAppointments();
        for (String s: appoints){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }

    public void queryTransactions(){
        dbHelper.connectDB(url,username,password);
        List<String> appoints=dbHelper.queryAllTransactions();
        for (String s: appoints){
            System.out.println(s);
        }
        dbHelper.disconnectDB();
    }



    public void updateAppointment(String appointId,Date endTime){
        dbHelper.connectDB(url,username,password);
        int update=dbHelper.updateAppointment(appointId,endTime);
        if(update>0){
            System.out.println("the info of appointId:"+appointId +" has been updated!");
            String appoint=queryAppointmentById(appointId);
            String[] appointInfo=appoint.split(",");
            String serviceType=appointInfo[1];
            String userId=appointInfo[2];
            String appointDate=appointInfo[3];
            Date issuedDate=new Date();
            try {
                issuedDate=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").parse(appointDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if(serviceType.equalsIgnoreCase("State ID")){
                addState(userId,issuedDate);
            }else if(serviceType.equalsIgnoreCase("Permit")){
                addPermit(userId,issuedDate);

            }else if (serviceType.equalsIgnoreCase("Registration")){
                addRegistration(userId,issuedDate);
            }else if (serviceType.equalsIgnoreCase("License")){
                addLicense(userId,issuedDate);
            }
        }else {
            System.out.println("the info of appointId:"+appointId +" has not been updated!");
        }
        dbHelper.disconnectDB();
    }

    public String queryAppointmentById(String appointId){
        dbHelper.connectDB(url,username,password);
        List<String> appoints=dbHelper.queryAppointment(appointId);
        System.out.println(appoints.get(0));
        return appoints.get(0);

    }

    public void deleteDeparmtent(String deptId){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteDepartment(deptId);
    }

    public void deleteJob(String jobId){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteJob(jobId);
    }
    public void deleteService(String serviceType){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteService(serviceType
        );
    }
    public void deleteEmployee(String empId){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteEmployee(empId);
    }
    public void deleteUser(String userId){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteUser(userId);
    }
    public void deleteStateId(String stateID){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteStateId(stateID);
    }
    public void deletePermit(String iD){
        dbHelper.connectDB(url,username,password);
        dbHelper.deletePermit(iD);
    }
    public void deleteRegistration(String iD){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteRegistration(iD);
    }
    public void deleteLicense(String iD){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteLicense(iD);
    }
    public void deleteAppointment(String iD){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteAppointment(iD);
    }
    public void deleteTransaction(String iD){
        dbHelper.connectDB(url,username,password);
        dbHelper.deleteTransaction(iD);
    }

    public void query1(String queryDate){
        dbHelper.connectDB(url,username,password);
        List<String> ss=dbHelper.query1(queryDate);
        for (String s:
                ss) {
            System.out.println(s);
        }
    }
    public void query2(String queryDate){
        dbHelper.connectDB(url,username,password);
        List<String> ss=dbHelper.query2(queryDate);
        for (String s:
                ss) {
            System.out.println(s);
        }
    }
    public void query3(){
        dbHelper.connectDB(url,username,password);
        List<String> ss=dbHelper.query3();
        for (String s:
                ss) {
            System.out.println(s);
        }
    }
    public void query4(){
        dbHelper.connectDB(url,username,password);
        List<String> ss=dbHelper.query4();
        for (String s:
             ss) {
            System.out.println(s);
        }
    }
}
