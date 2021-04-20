package MyDatabase.lib;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import java.sql.*;





public class New_Team {

	private JFrame frame;
	private JTextField Team_Name;
	private JTextField Team_Ranking;
	private JTextField Team_Average_Age;
	private JTextField Team_Location;
	


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					New_Team window = new New_Team();
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
	public New_Team() {
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
		
		JButton btnExit = new JButton("Exit");
		btnExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frame.setVisible(false);
				
				
			}
		});
		btnExit.setBounds(672, 11, 104, 32);
		frame.getContentPane().add(btnExit);
		
		JLabel lblNewLabel_2 = new JLabel("Team Name");
		lblNewLabel_2.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_2.setBounds(60, 89, 98, 21);
		frame.getContentPane().add(lblNewLabel_2);
		
		Team_Name = new JTextField();
		Team_Name.setBounds(35, 121, 123, 45);
		frame.getContentPane().add(Team_Name);
		Team_Name.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("Team Ranking");
		lblNewLabel_3.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_3.setBounds(60, 186, 110, 21);
		frame.getContentPane().add(lblNewLabel_3);
		
		Team_Ranking = new JTextField();
		Team_Ranking.setBounds(35, 231, 123, 55);
		frame.getContentPane().add(Team_Ranking);
		Team_Ranking.setColumns(10);
		
		JLabel lblNewLabel_7 = new JLabel("Team Average Age");
		lblNewLabel_7.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_7.setBounds(282, 88, 149, 21);
		frame.getContentPane().add(lblNewLabel_7);
		
		Team_Average_Age = new JTextField();
		Team_Average_Age.setBounds(282, 121, 122, 45);
		frame.getContentPane().add(Team_Average_Age);
		Team_Average_Age.setColumns(10);
		
		JLabel lblNewLabel_8 = new JLabel("Team Location");
		lblNewLabel_8.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_8.setBounds(300, 186, 104, 21);
		frame.getContentPane().add(lblNewLabel_8);
		
		Team_Location = new JTextField();
		Team_Location.setBounds(281, 233, 123, 50);
		frame.getContentPane().add(Team_Location);
		Team_Location.setColumns(10);
		
		JButton btnExecute = new JButton("Execute");
		btnExecute.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement New_Team = myConn.prepareCall("{call New_Team(?,?,?,?)}");
					New_Team.setString(1,Team_Name.getText());
					New_Team.setString(2,Team_Ranking.getText());
					New_Team.setString(3,Team_Average_Age.getText());
					New_Team.setString(4,Team_Location.getText());
					
					
					
					
					New_Team.executeQuery();
					JOptionPane.showMessageDialog(null, "New Team has been added to the database!");
					
					
					frame.setVisible(false);
					
					
					}
					catch(SQLException g) {
						
					}
				
			}
		});
		btnExecute.setBounds(672, 63, 104, 32);
		frame.getContentPane().add(btnExecute);
	}
}
