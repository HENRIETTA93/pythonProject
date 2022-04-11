import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.Date;


public class AClient {
    public static void main(String[] args) throws IOException {

        if (args.length != 2) {
            System.err.println(
                    "Usage: java HelloClient <host name> <port number>");
            System.exit(1);
        }

        String hostName = args[0];
        int portNumber = Integer.parseInt(args[1]);

        System.out.println(new Date());
        try (
                        Socket myClientSocket = new Socket(hostName, portNumber);
                        PrintWriter output = new PrintWriter(myClientSocket.getOutputStream(), true);
                        BufferedReader input = new BufferedReader(new InputStreamReader(myClientSocket.getInputStream()));
                        BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));) {



            myClientSocket.setSoTimeout(10000);

            String userInput;

            System.out.println(input.readLine()); // reads the first message from the server and prints it

            System.out.println(input.readLine());



            System.out.println("Say something to the server (and then press enter): ");
            while (true) {
                userInput = stdIn.readLine(); // reads user's input
                output.println(userInput); // user's input transmitted to server

                String serverInput=input.readLine();// reads server's ack and prints it
                System.out.println(serverInput);
                if(!serverInput.contains("re-choose")){
                    break;
                }
            }
            System.out.println("Say a sequence S of natural numbers (and then press enter):");
            userInput=stdIn.readLine();
            output.println(userInput);

            System.out.println("Time:["+System.currentTimeMillis()+"] Send to server a sequence of S: "+ userInput);
            String serverInput=input.readLine();
            System.out.println(serverInput);

            System.out.println("Time:["+System.currentTimeMillis()+"] Server return a sequence of S result: "+ serverInput);

            output.println("Client: ["+myClientSocket.getInetAddress()+"] has received server's result!");

            System.out.println(input.readLine());
            System.out.println("-----------End of communication-----------");
            System.out.println("\nCommunication with server " + hostName + " was successful! Now closing...");

        } catch (UnknownHostException e) {
            System.err.println("Don't know about host " + hostName);
            System.exit(1);
        } catch (IOException e) {
            System.out.println(new Date());
            System.err.println("Couldn't get I/O for the connection to " +
                    hostName);

            if( e instanceof SocketTimeoutException){
                System.out.println("Couldn't connect to the server "+ hostName+", reason is time out!");
            }
            e.printStackTrace();
            System.exit(1);
        }

    }
}