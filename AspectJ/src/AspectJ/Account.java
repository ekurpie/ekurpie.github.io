package cs550;
//	Client's bank account

public class Account {
	String fname, lname;
	int id;
	private double balance;
	
	public Account (String fname, String lname, int id, double balance){
		this.fname = fname;
	    this.lname = lname;
	    this.id = id;
	    this.balance = balance;
	    
	    
	}

	public Account (String name, int id, double balance){
		String[] aName = name.split(" ");
		this.fname = aName[0];
		String myLname = "";
		for (int i=1; i<aName.length; i++) {
	         myLname += aName[i] + " ";
	    }
	    this.lname = myLname;
	    this.id = id;
	    this.balance = balance;
	}

    public boolean deposit(double amount){
    	this.balance += amount;
    	System.out.println("$" + amount + " added to account " + this.id + ".");
	    return true;
	}

	public boolean withdraw(double amount){
		if(amount < this.balance){
			this.balance -= amount;
			System.out.println("$" + amount + " withdrawn from account " + this.id + ".");
	        return true;
		}
	    else
	    	System.out.println("\nNot enough money to withdraw " + amount + " dollars.");
	        return false;
	}
	
	public double getBalance(){
		return this.balance;
	}
	
	public String getName(){
		return this.fname + " " + this.lname;
	}
	
	public int getId(){
		return this.id;
	}
	

}//end of class