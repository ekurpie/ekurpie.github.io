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





public class New_Game {

	private JFrame frame;
	private JTextField GameID;
	private JTextField Time;
	private JTextField Team_One;
	private JTextField Team_Two;
	private JTextField Winner;
	


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					New_Game window = new New_Game();
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
	public New_Game() {
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
		
		JLabel lblNewLabel_2 = new JLabel("GameID");
		lblNewLabel_2.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_2.setBounds(60, 89, 98, 21);
		frame.getContentPane().add(lblNewLabel_2);
		
		GameID = new JTextField();
		GameID.setBounds(35, 121, 123, 45);
		frame.getContentPane().add(GameID);
		GameID.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("Time");
		lblNewLabel_3.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_3.setBounds(60, 186, 110, 21);
		frame.getContentPane().add(lblNewLabel_3);
		
		Time = new JTextField();
		Time.setBounds(35, 231, 123, 55);
		frame.getContentPane().add(Time);
		Time.setColumns(10);
		
		JLabel lblNewLabel_7 = new JLabel("Team One");
		lblNewLabel_7.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_7.setBounds(297, 89, 149, 21);
		frame.getContentPane().add(lblNewLabel_7);
		
		Team_One = new JTextField();
		Team_One.setBounds(282, 121, 122, 45);
		frame.getContentPane().add(Team_One);
		Team_One.setColumns(10);
		
		JLabel lblNewLabel_8 = new JLabel("Team Two");
		lblNewLabel_8.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblNewLabel_8.setBounds(300, 186, 104, 21);
		frame.getContentPane().add(lblNewLabel_8);
		
		Team_Two = new JTextField();
		Team_Two.setBounds(281, 233, 123, 50);
		frame.getContentPane().add(Team_Two);
		Team_Two.setColumns(10);
		
		JButton btnExecute = new JButton("Execute");
		btnExecute.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement New_Game = myConn.prepareCall("{call New_Game(?,?,?,?,?)}");
					New_Game.setString(1,GameID.getText());
					New_Game.setString(2,Team_One.getText());
					New_Game.setString(3,Team_Two.getText());
					New_Game.setString(4,Winner.getText());
					New_Game.setString(5,Time.getText());
					
					String Team1 = Team_One.getText();
					String Team2 = Team_Two.getText();
					String Team3 = Winner.getText();
					
					if(Team1.equals(Team3) || Team2.equals(Team3)) {

						New_Game.executeQuery();
						JOptionPane.showMessageDialog(null, "New Game has been added to the database!");
						frame.setVisible(false);
					}
					
					else {
						JOptionPane.showMessageDialog(null, "Error! Winning Team is neither team one or team two!");
					}
					
					
					}
					catch(SQLException g) {
						
					}
				
			}
		});
		btnExecute.setBounds(672, 63, 104, 32);
		frame.getContentPane().add(btnExecute);
		
		Winner = new JTextField();
		Winner.setBounds(162, 370, 110, 45);
		frame.getContentPane().add(Winner);
		Winner.setColumns(10);
		
		JLabel lblTime = new JLabel("Winner");
		lblTime.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		lblTime.setBounds(189, 338, 56, 21);
		frame.getContentPane().add(lblTime);
	}
}
