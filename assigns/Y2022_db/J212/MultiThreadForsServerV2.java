import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashSet;

public class MultiThreadForsServerV2 {


    static ServerSocket serverSocket;
    static int port = 9090;
    static PrintWriter out;
    static BufferedReader in;
    static Socket clientSocket;

    static HashSet<String> allOpr = new HashSet<String>() {{
        add("original");
        add("square");
        add("sqrt");
        add("pow");
        add("log");
    }};

    public static <serverSocket> void main(String[] args) {
        int portNumber;
        int nThreads = 3;

        if (args.length < 1) {
            System.out.println("Warning: You have provided no arguments\nTrying to connect to the default port 8000...");
            System.out.println("The default number of threads is "+nThreads);
            portNumber = 8000;
        } else if (args.length == 1) {
            portNumber = Integer.parseInt(args[0]);
            System.out.println("The default number of threads is "+nThreads);
        } else {
            System.out.println("Warning: You have provided > 1 arguments\nTrying with the first argument to connect to a port, the second argument is number of threads...");
            portNumber = Integer.parseInt(args[0]);
            nThreads=Integer.parseInt(args[1]);
        }


        Thread[] threads = new Thread[nThreads];


        while (true) {
            try (
                    ServerSocket serverSocket = new ServerSocket(portNumber);
                    Socket clientSocket = serverSocket.accept();
                    PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
                    BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            ) {
                System.out.println("Connection established with a new client with IP address: " + clientSocket.getInetAddress() + "\n");
                out.println("Server says: Hello Client " + clientSocket.getInetAddress() + ". This is server " + serverSocket.getInetAddress() +
                        " speaking. Our connection has been successfully established!");
                out.println("Server support all these operations:" + allOpr + ", please choose you want to do!");


                String inputLine = null;
                String opr = "";
                while (true) {
                    inputLine = in.readLine();
                    System.out.println("Server received a new message from client " + clientSocket.getInetAddress());
                    System.out.println("Client says: " + inputLine);

                    if (!allOpr.contains(inputLine)) {
                        out.println("Server does not support:" + inputLine + " operation, please re-choose you want to do!");
                    } else {
                        opr = inputLine;
                        System.out.println("Server support the operation:" + inputLine + ".. server wait for client's number");
                        break;
                    }
                }


                out.println("Server wait for your input of a sequence S of natural numbers...");

                inputLine = in.readLine();
                System.out.println("Server received a new message from client " + clientSocket.getInetAddress());
                System.out.println("Client says: " + inputLine);

                String[] numStr = inputLine.split(" ");
                int[] num = new int[numStr.length];
                for (int i = 0; i < numStr.length; i++) {
                    num[i] = Integer.parseInt(numStr[i]);
                }


                int[] result = new int[num.length];
                double[] resultd = new double[num.length];


                int actThreadNum=num.length<=nThreads? num.length:nThreads;
                int kCalNum =  nThreads-1;
                int lastThreadCal = num.length -  (nThreads - 1);

                CalculateS[] cals = new CalculateS[nThreads];
                for (int i = 0; i < actThreadNum; i++) {
                    cals[i]=new CalculateS();
                    cals[i].opr = opr;

                    if (i != nThreads - 1) {
                        cals[i].numbers = new int[1];
                        for (int k = 0; k < 1; k++) {
                            cals[i].numbers[k] = num[i + k];
                        }
                        cals[i].result = new int[1];
                        cals[i].resultd = new double[1];

                    } else {
                        cals[i].numbers = new int[lastThreadCal];
                        for (int k = 0; k < lastThreadCal; k++) {
                            cals[i].numbers[k] = num[i+ k];
                        }
                        cals[i].result = new int[lastThreadCal];
                        cals[i].resultd = new double[lastThreadCal];
                    }
                    threads[i] = new Thread(cals[i]);
                    threads[i].start();


                }

                for (int i = 0; i < actThreadNum; i++) {
                    threads[i].join();
                    CalculateS cal = cals[i];
                    int j = 0;
                    if (i != nThreads - 1) {
                        while (j < 1) {
                            result[i + j] = cal.result[j];
                            resultd[i  + j] = cal.resultd[j];
                            j++;
                        }
                        j = 0;
                    } else {
                        while (j < lastThreadCal) {
                            result[i  + j] = cal.result[j];
                            resultd[i + j] = cal.resultd[j];
                            j++;
                        }
                        j = 0;
                    }
                }


                String calcuResult = "Server has calculated the result: ";
                if (resultd[0] != 0) {
                    calcuResult += fromDoubletoString(resultd);
                } else {
                    calcuResult += fromIntToString(result);
                }
                System.out.println(calcuResult);
                out.println("Server says:" + calcuResult);

                inputLine = in.readLine();
                System.out.println("Server received a new message from client " + clientSocket.getInetAddress());
                System.out.println("Client says: " + inputLine);
                out.println("Server says: Your message has been successfully received! Bye...");

                System.out.println("Connection with client " + clientSocket.getInetAddress() + " is now closing...\n");

            } catch (IOException e) {
                System.out.println("Exception caught when trying to listen on port "
                        + portNumber + " or listening for a connection");
                System.out.println(e.getMessage());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }


    static class CalculateS implements Runnable {
        int[] numbers;
        String opr;
        int[] result;
        double[] resultd;

        @Override
        public void run() {
            switch (opr) {
                case "orign":
                    result = getX(numbers);
                    break;
                case "square":
                    result = getXSquare(numbers);
                    break;
                case "pow":
                    result = getXPower(numbers);
                    break;
                case "log":
                    resultd = getXLog(numbers);
                    break;
                case "sqrt":
                    resultd = getXSqrt(numbers);
                    break;
                default:
                    result = getX(numbers);
                    break;

            }
        }
    }

    public static int[] getX(int[] S) {
        return S;
    }

    public static int[] getXSquare(int[] S) {
        int[] result = new int[S.length];
        for (int i = 0; i < S.length; i++) {
            result[i] = (int) Math.pow(S[i], 2);
        }
        return result;
    }

    public static int[] getXPower(int[] S) {
        int[] result = new int[S.length];
        for (int i = 0; i < S.length; i++) {
            result[i] = (int) Math.pow(2, S[i]);
        }
        return result;
    }

    public static double[] getXSqrt(int[] S) {
        double[] result = new double[S.length];
        for (int i = 0; i < S.length; i++) {
            result[i] = Math.sqrt(S[i]);
        }
        return result;
    }

    public static double[] getXLog(int[] S) {
        double[] result = new double[S.length];
        for (int i = 0; i < S.length; i++) {
            result[i] = Math.log(S[i]);
        }
        return result;
    }

    public static String fromDoubletoString(double[] S) {
        String s = "";
        for (int i = 0; i < S.length; i++) {
            s += S[i] + " ";
        }
        return s;
    }

    public static String fromIntToString(int[] S) {
        String s = "";
        for (int i = 0; i < S.length; i++) {

            s += S[i] + " ";

        }
        return s;
    }
}
