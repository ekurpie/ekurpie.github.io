package MyDatabase.lib;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Login_Window {

	private JFrame frame;
	private JTextField User;
	private JPasswordField Pass;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Login_Window window = new Login_Window();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Login_Window() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(200, 200, 500, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblUsername = new JLabel("Username");
		lblUsername.setBounds(53, 78, 96, 14);
		frame.getContentPane().add(lblUsername);
		
		User = new JTextField();
		User.setBounds(53, 103, 96, 20);
		frame.getContentPane().add(User);
		User.setColumns(10);
		
		JLabel lblPassword = new JLabel("Password");
		lblPassword.setBounds(53, 134, 89, 14);
		frame.getContentPane().add(lblPassword);
		
		Pass = new JPasswordField();
		Pass.setBounds(53, 159, 96, 20);
		frame.getContentPane().add(Pass);
		
		JButton btnLogin = new JButton("Login");
		btnLogin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					String Password = String.copyValueOf(Pass.getPassword());
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					 // Do something with the Connection
					
					String Username = User.getText();
					
	         		PreparedStatement pStmt = myConn.prepareStatement(
	         	            "select * from userbase where Username = ? and Password = ?");
	         		pStmt.setString(1,Username);
	         		pStmt.setString(2,Password);
	         		
	         		ResultSet rset = pStmt.executeQuery();
	         		
	         		rset.next();
	         		String Username2 = rset.getString(1);
	         		String Password2 = rset.getString(2);
	         		
	         	
	         		
	         		
	         		
					if((Username.equals("root")) & (Password.equals("Zingbob23"))) {
						frame.setVisible(false);
						JOptionPane.showMessageDialog(null, "Successful Connection!");
						App_Window.SetValues("127.0.0.1", "counterstrike", "root", "Zingbob23");
						App_Window.main(null);
					}
						
					else if((Username2.equals(Username)) & (Password2.equals(Password)))
					{
		           
						frame.setVisible(false);
						JOptionPane.showMessageDialog(null, "Successful Connection!");
						User_View.SetValues("127.0.0.1", "counterstrike", "root", "Zingbob23");
						User_View.main(null);
					}
		            
		            else {
		            	JOptionPane.showMessageDialog(null, "Incorrect information!");
		            	myConn.close();
		            }
		            		
		            
		            
		            
					
				}
				catch(Exception A){ 
					JOptionPane.showMessageDialog(null, "Incorrect information!");
					System.out.println("Failed connection");
					System.out.println(e);
						
					}
				}
			
	
		});
		
		btnLogin.setBounds(200, 149, 89, 23);
		frame.getContentPane().add(btnLogin);
		
		JLabel lblLoginPage = new JLabel("Login Page");
		lblLoginPage.setFont(new Font("Times New Roman", Font.PLAIN, 30));
		lblLoginPage.setBounds(190, 0, 166, 135);
		frame.getContentPane().add(lblLoginPage);
		
		JButton btnGuest = new JButton("Guest");
		btnGuest.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
				Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
				 // Do something with the Connection
				JOptionPane.showMessageDialog(null, "Successful Connection!");
	           
				frame.setVisible(false);
	            Guest_View.SetValues("127.0.0.1","counterstrike","root","Zingbob23");
	            Guest_View.main(null);
				}
				
				catch(Exception c) {
					JOptionPane.showMessageDialog(null, "Incorrect information!");
					System.out.println("Failed connection");
					System.out.println(e);
				}
				
			}
		});
		btnGuest.setBounds(200, 213, 89, 23);
		frame.getContentPane().add(btnGuest);
		
		JButton btnNewUser = new JButton("New User");
		btnNewUser.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frame.setVisible(false);
				New_User.main(null);
			}
		});
		btnNewUser.setBounds(347, 213, 89, 23);
		frame.getContentPane().add(btnNewUser);
	}
}
