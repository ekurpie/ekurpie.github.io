package MyDatabase.lib;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import java.sql.*;





public class New_User2 {

	private JFrame frame;
	private JTextField User;
	private JTextField Pass;
	


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					New_User2 window = new New_User2();
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
	public New_User2() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 800, 500);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblYourUsername = new JLabel("Your Username");
		lblYourUsername.setFont(new Font("Times New Roman", Font.PLAIN, 30));
		lblYourUsername.setBounds(275, 23, 256, 91);
		frame.getContentPane().add(lblYourUsername);
		
		User = new JTextField();
		User.setBounds(300, 105, 153, 32);
		frame.getContentPane().add(User);
		User.setColumns(10);
		
		JLabel lblYourPassword = new JLabel("Your Password");
		lblYourPassword.setFont(new Font("Times New Roman", Font.PLAIN, 30));
		lblYourPassword.setBounds(275, 174, 212, 82);
		frame.getContentPane().add(lblYourPassword);
		
		Pass = new JTextField();
		Pass.setBounds(300, 254, 153, 32);
		frame.getContentPane().add(Pass);
		Pass.setColumns(10);
		
		JButton btnRegister = new JButton("Register");
		btnRegister.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
				Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
				CallableStatement New_User = myConn.prepareCall("{call New_User(?,?)}");
				New_User.setString(1,User.getText());
				New_User.setString(2,Pass.getText());
				
				New_User.executeQuery();
				JOptionPane.showMessageDialog(null, "You have been added to the database!");
				
				
				frame.setVisible(false);
	            
				
				
				}
				catch(SQLException g) {
					
				}
				
			}
		});
		btnRegister.setBounds(312, 343, 122, 38);
		frame.getContentPane().add(btnRegister);
		
		JButton btnExit = new JButton("Exit");
		btnExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frame.setVisible(false);
				;
			}
		});
		btnExit.setBounds(573, 346, 104, 32);
		frame.getContentPane().add(btnExit);
	}
}
