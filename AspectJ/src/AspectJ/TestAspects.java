package cs550;

public class TestAspects {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Bank myBank = new Bank("Devon's Bank", 1234567);
		myBank.addClient("Devon M.", 4000);
		myBank.addClient("Ann M.", 500);
		myBank.addClient("Mary B.", 644);
		myBank.addClient("Jack T.", 744);
		myBank.addClient("Harry O.", 844);
		myBank.addClient("Brian M.", 944);
		myBank.addClient("Hensley H.", 1444);
		myBank.addClient("Nora N.", 2444);
		myBank.deposit(1235, 111);
		myBank.deposit(1235, 33333);
		myBank.generateReport();
		//myBank.deleteClient(1235);
		myBank.transfer(1235, 1236, 100);
		myBank.withdraw(1242, 300);
		myBank.deleteClient(1242);
		myBank.transfer(1235, 1236, 100);
		myBank.transfer(1235, 1236, 10000);

		

	}// end main(...)

}//end of class
