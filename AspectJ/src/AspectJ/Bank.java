package cs550;
import java.util.*;

/*
Write a program called Banking.py that stores the names of clients and their
bank balances in two separate lists in corresponding positions. For example
if client_balances contains customer balances and client_database contains
customer names, then if the name for a client is at client_database[k], then
the balance for the customer would be at client_balances[k]. The program
should allow for the following transactions menu{

     1{ Add a new client
     2{ delete a client
     3{ Deposit money
     4{ Withdraw money
     5{ Transfer funds
     6{ Find average customer balance
     7{ Print a report showing customer names and corresponding balances.
     0{ Exit the application
*/

//from Account import Account
//import os.path

public class Bank{
	String bank_name;
	int bankId;
    public ArrayList<Account> client_database;
    int client_count;
    int currentId;
    Scanner keyboard;

    public Bank(String name, int id){
    	//Global variables
        this.bank_name = name;
        this.bankId = id;
        this.client_database = new ArrayList();
        this.client_count = 0;
        this.currentId= 1234;
        keyboard = new Scanner(System.in);
    }

    public String getName(){
        return this.bank_name;
    }
    
    public int getBankId(){
        return this.bankId;
    }
    
    public void insert(Account clientAccount){
        this.client_database.add(clientAccount);
    }

    public int getNextId(){
        int id = this.currentId;
        boolean idExists = true;
        while (idExists == true){
            id += 1;
            int result = this.find(id);
            if(result == -1){
                idExists = false;
            }
        }
        this.currentId = id;
        //System.out.println("Your ID # is: " + id);
        return id;
    }

    public void addClient(String name, double balance){
        int id = this.getNextId();        
        Account newClient = new Account(name, id, balance);
        this.insert(newClient);
        //System.out.println("New account for " + name + " created.");
    }

    public void addClient(){
        int id = this.getNextId();
        System.out.print("Enter name of customer: ");
        String name = keyboard.next();
        
        System.out.print("Enter opening balance: ");
        double bal = keyboard.nextDouble();
        
        Account newClient = new Account(name, id, bal);
        this.insert(newClient);
    }

    public int find(int id){
    	for(int i=0; i<client_database.size(); i++){
    		if(id == ((Account)client_database.get(i)).getId())
    			return i;
    	}
        return -1;
    }
    
    public void deleteClient(int id){
        int position = this.find(id);
        if(position == -1)
        	System.out.println("A record for " + id + " was not found.");
        else{
        	System.out.println("\nThe account for " + id + " found.");
            this.client_database.remove(position);
            System.out.println("Account with ID:" + id + " has been deleted.");
        }
    }


    public boolean deposit(int id, double amount){
        int position = this.find(id);
        if(position == -1){
            System.out.println("An account with id = " + id + " was not found.");
            return false;
        }
        else{
            boolean result = ((Account)client_database.get(position)).deposit(amount);
            return result;
        }
    }
            
    public boolean withdraw(int id, double amount){
        int position = this.find(id);
        if(position == -1){
        	System.out.println("An account with id = " + id + " was not found.");
            return false;
        }
        else{
        	boolean result = ((Account)client_database.get(position)).withdraw(amount);
            return result;
        }
    }
            
    public void transfer(int source, int target, double amount){
    	System.out.println("Transferring ...");
        int sourcePos = this.find(source);
        int targetPos = this.find(target);
        if(sourcePos == -1 || targetPos == -1)
        	System.out.println("Invalid transaction ... aborting.");
        else{
        	System.out.println("Transferring $" + amount + " from account " + source + " to account " + target + ".");
        	/*((Account)client_database.get(sourcePos)).withdraw(amount);
        	((Account)client_database.get(targetPos)).deposit(amount);*/
        	Account s1 = (Account)client_database.get(sourcePos);
        	if (s1.withdraw(amount) == true) {
        		Account t1 = (Account)client_database.get(targetPos);
        		t1.deposit(amount);
        		
        	}
        	else
        		System.out.println("There was not enough to withdraw in order to finish the transfer");
        }
    }
    
/*    public averageBalance(this){
        clientMax = len(this.client_database)
        totalBal = 0
        clientAvg = 0
        for i in range(clientMax){
            totalBal += this.client_database[i].getBalance()

        if(clientMax > 0){
            clientAvg = totalBal / clientMax

        return format(clientAvg, '2.2f')
*/
    public void generateReport(){
    	System.out.println("\nDevon's Bank Customer Report.");
    	System.out.println("Name  ID  Balance.");
    	System.out.println("=============================");
    	for(int i=0; i<client_database.size(); i++ ){
    		System.out.print(((Account)client_database.get(i)).getName() + " ");
        	System.out.print(((Account)client_database.get(i)).getId() + " ");
        	System.out.println(((Account)client_database.get(i)).getBalance());
        	/*System.out.println(String.format("10s", ((Account)client_database.get(i)).getName() + " aaa"));
        	System.out.println(String.format("10s", ((Account)client_database.get(i)).getId() + "bbb"));
        	System.out.println(String.format("10s", ((Account)client_database.get(i)).getBalance()));*/
        	//System.out.println("Average client balance is{", this.averageBalance());
    	}
    }

/*    public inputDatabase(this, filename){
        count = 1
        currentFilename = filename
        prefix = filename.split(".")[0]
        while(True){
            if(os.path.isfile(filename)){
                currentFilename = filename
                filename = prefix + str(count) + ".txt"
                count += 1
            else{
                break
        infile = open(currentFilename, 'r')
        line = infile.readline()
        count = 0
        while(line != ""){
            try{
                data = line.strip().split()
                if(data[0] == "@deposit"){
                    this.deposit(data[1], float(data[2]))
                elif (data[0] == "@withdraw"){
                    this.withdraw(data[1], float(data[2]))
                elif (data[0] == "@transfer"){
                    this.transfer(data[1], data[2], float(data[3]))
                else{
                    fname = data[0].strip()
                    lname = data[1].strip()
                    clientId = data[2].strip()
                    bal = float(data[3].strip())
                    newClient = Account(fname, lname, clientId, bal)
                    this.insert(newClient)
            except{
                count += 1
                print(count, data)
            line = infile.readline()
        
        infile.close()
        return True
*/
        
/*    public saveData(this){
        count = 1
        filename = "ClientDatabase.txt"
        while(True){
            if(os.path.isfile(filename)){
                filename = "ClientDatabase" + str(count) + ".txt"
                count += 1
            else{
                break
        outfile = open(filename, 'w')
        for i in range(len(this.client_database)){
            if(i > 0){
                 outfile.write("\n")
            outfile.write(this.client_database[i].getName() + " " + \
                          str(this.client_database[i].getId()) + " " + \
                          str(this.client_database[i].getBalance()))
        outfile.close()
        print("Client database saved to", filename)
        return filename
*/
}//end of class