//package cs550;
//import java.util.*;
//
//public aspect MyAspects {
//
//	/**
//	 * 1. An aspect to log each call to the deposit method every time the deposit method is called regardless of the calling context.
//	 */
//	
//	pointcut CallDeposit (Account s, double amount):
//		call(public boolean deposit(double))
//			&& target(s)
//				&& args(amount);
//	
//	before (Account s, double amount):
//		CallDeposit(s, amount){
//		System.out.println("About to deposit");
//	}
//
//
//	/**
//	 *
//	 * 2.  an aspect to log each execution to the withdraw method
//	 * 
//	 */
//	pointcut CallWithdraw (Account s, double amount):
//		execution(public boolean withdraw(double))
//			&& target(s)
//				&& args(amount);
//	
//	before (Account s, double amount):
//		CallWithdraw (s, amount){
//		System.out.println("About to withdraw");
//	}
//	/**
//	 *3. an aspect to avoid execution of the deleteClient method and to deposit money into the client's account instead
//	 */
//	pointcut cancelDelete (Bank s,int id):
//		call(public void deleteClient(int))
//			&& target(s)
//				&& args(id);
//			
//			
//	void around(Bank s,int id):
//		cancelDelete(s,id)
//	{
//		System.out.println("cancelled deletion of account");	
//		System.out.println("depositing $500 dollars into account number " + id);
//		s.deposit(id,500);
//	}
//	/**
//	 * 4. an aspect to rather than do the normal withdrawal for each transfer, credit the withdrawal account with the withdrawal amount instead
//	 *
//	*/
//	pointcut creditWithdrawal (Account s, double amount):
//		withincode(public void transfer(int,int,double))
//		&& call(public boolean withdraw(double))
//			&& target(s)
//				&& args(amount);
//	
//	Boolean around (Account s, double amount):
//		creditWithdrawal(s,amount){
//		System.out.println("instead of doing the withdrawal we will deposit the withdrawal amount into the account");
//		System.out.println("about to credit withdrawal account:" + s.getId() + " balance " + s.getBalance() + " with " + amount);
//		s.deposit(amount);
//		return true;
//		
//	}
//	
//	/**
//	 * 
//	 * 5. As aspect that whenever the client makes their first transfer, rather than removing money from their account, their account is credited with 50% of the trasnfer amount instead. This is done with two advices: one around and one after.
//	 * 
//	 */
//	private int Account.transferCount = 0;
//	public int Account.getTransferCount(){
//		return transferCount;
//	}
//	pointcut bonusTransfer (Account s, double amount):
//		withincode(public void transfer(int,int,double))
//		&& call(public boolean withdraw(double))
//			&& target(s)
//				&& args(amount); 
//	
//	/**
//	 * 
//	 * 5a.
//	 */
//	Boolean around (Account s, double amount):
//		bonusTransfer (s,amount){
//		if(s.getTransferCount() == 0) {
//		System.out.println("Since this is your first transfer the bank will credit your account 50% of the amount you were to transfer instead ");
//		double amount2 = (amount / 2);
//		s.deposit(amount2);
//		s.transferCount ++;
//		}
//		else {
//			s.transferCount ++;
//			System.out.println("Sorry this is the " + s.getTransferCount() + " transfer you have done...No Bonus for you!");
//			proceed(s, amount);
//		}
//		return true;
//	}
//
//
//	/**
//	 * 
//	 * 5b.
//	 */
//	
//	after (Account s, double amount):
//		bonusTransfer(s,amount){
//		if (s.getTransferCount() == 0) {
//			System.out.println("You just made your first transfer....Congratulations! You will be deposited 50% of the amount that you transferred");
//		double amount2 = (amount * 1.5);
//		s.deposit(amount2);
//		s.transferCount ++;
//		}
//		else {
//			s.transferCount ++;
//			System.out.println("You have already gotten your bonus!");
//		}
//	} 
//	
//	/**
//	 *6.  An aspect to log each time an account balance is changed
//	 */
//	
//	pointcut balanceChange ():
//		within(Account)
//			&& set(private double balance);
//				
//	
//	after():
//		balanceChange(){
//			System.out.println("the account balance has been changed");
//		}
//
//	/**
//	 * 7. as aspect to log each time a specific client has been changed
//	 */
//	pointcut balanceChange (Account s):
//	within(Account)
//		&& set(private double balance)
//			&& target(s);
//			
//
//	after(Account s):
//		balanceChange(s){
//		if (s.getId() == 1235){
//			System.out.println("the account balance for account " + s.getId() + " has been changed");
//		}
//	}
//
//	/**
//	 * 8. An aspect to grant a transfer bonus as follows: 5% for transfer between $100 and $5000, 7.5% for transfer over $5000 but less than $10,000 and 10% for transfers over 10,000.
//	 */
//	
//	pointcut bonusTransfers(Account s, double amount):
//		withincode (public void transfer (int,int,double))
//			&& call(public boolean deposit(double))
//				&& target(s)
//					&& args(amount);
//	
//	
//	boolean around(Account s, double amount):
//		bonusTransfers(s,amount){
//		if ((amount >= 1000) && (amount < 5000)) {
//			System.out.println("Congratulations! your transfer qualifies for a bonus of 5% for being between $1000 and $5000!");
//			double amount2 = (amount * 1.05);
//			System.out.println(amount2 + " has been deposited into your account!");
//			return proceed(s,amount2);
//		}
//		else if ((amount >= 5000) && (amount < 10000)) {
//			System.out.println("Congratulations! your transfer qualifies for a bonus of 7.5% for being between $5000 and $10000!");
//			double amount2 = (amount * 1.075);
//			System.out.println(amount2 + " has been deposited into your account!");
//			return proceed(s,amount2);
//		}
//		else if (amount >= 10000) {
//			System.out.println("Congratulations! your transfer qualifies for a bonus of 10% for being greater than $10000!");
//			double amount2 = (amount * 1.1);
//			System.out.println(amount2 + " has been deposited into your account!");
//			return proceed(s,amount2);
//		}
//		else {
//			System.out.println("Sorry you do not qualify for a bonus.");
//			return proceed(s,amount);
//		}
//		
//	}
//
//	/**
//	 * 9. This is an aspect to do the following: rather than granting a bonus to first time transfer clients, grant a bonus of 20% for every third money transfer
//	 * 
//	 */
//	private int Account.transferCount = 0;
//	public int Account.getTransferCount(){
//		return transferCount;
//	}
//	
//	pointcut thirdTransferBonus (Account s, double amount):
//		withincode(public void Bank.transfer (int,int,double))
//			&& call(public boolean deposit(double))
//				&& target(s)
//					&& args(amount);
//	
//	boolean around(Account s, double amount):
//		thirdTransferBonus(s,amount){
//		s.transferCount ++ ;
//		if (s.getTransferCount() % 3 == 0) {
//			System.out.println("this is your third transfer so you get a 20% bonus!");
//			double amount2 = amount * 1.2;
//			System.out.println(s.getId() + " gets a deposit including bonus of ... " + amount2);
//			s.transferCount = 0;
//			return proceed(s,amount2);
//		}
//		else {
//			return proceed(s,amount);
//		}
// 	}
//}
