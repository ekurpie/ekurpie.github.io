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





public class New_Player {

	private JFrame frame;
	private JTextField PlayerID;
	private JTextField Player_Alias;
	private JTextField First_Name;
	private JTextField Last_Name;
	private JTextField Player_Age;
	private JTextField Player_Nation;
	private JTextField Kills;
	private JTextField Deaths;
	private JTextField KDA;
	private JTextField KPR;
	private JTextField KDD;
	private JTextField RK;
	private JTextField GK;
	private JTextField SK;
	private JTextField PK;
	private JTextField OK;
	


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					New_Player window = new New_Player();
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
	public New_Player() {
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
		
		JLabel lblPlayerid = new JLabel("PlayerID");
		lblPlayerid.setBounds(10, 20, 49, 14);
		frame.getContentPane().add(lblPlayerid);
		
		PlayerID = new JTextField();
		PlayerID.setBounds(0, 45, 96, 20);
		frame.getContentPane().add(PlayerID);
		PlayerID.setColumns(10);
		
		JLabel lblNewLabel = new JLabel("Player Alias");
		lblNewLabel.setBounds(10, 76, 71, 14);
		frame.getContentPane().add(lblNewLabel);
		
		Player_Alias = new JTextField();
		Player_Alias.setBounds(0, 101, 96, 20);
		frame.getContentPane().add(Player_Alias);
		Player_Alias.setColumns(10);
		
		JLabel lblNewLabel_1 = new JLabel("First Name");
		lblNewLabel_1.setBounds(10, 146, 49, 14);
		frame.getContentPane().add(lblNewLabel_1);
		
		First_Name = new JTextField();
		First_Name.setBounds(0, 180, 96, 20);
		frame.getContentPane().add(First_Name);
		First_Name.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("Last Name");
		lblNewLabel_2.setBounds(10, 228, 49, 14);
		frame.getContentPane().add(lblNewLabel_2);
		
		Last_Name = new JTextField();
		Last_Name.setBounds(0, 266, 96, 20);
		frame.getContentPane().add(Last_Name);
		Last_Name.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("Player Age");
		lblNewLabel_3.setBounds(10, 308, 71, 14);
		frame.getContentPane().add(lblNewLabel_3);
		
		Player_Age = new JTextField();
		Player_Age.setBounds(0, 344, 96, 20);
		frame.getContentPane().add(Player_Age);
		Player_Age.setColumns(10);
		
		JLabel lblNewLabel_4 = new JLabel("Player Nation");
		lblNewLabel_4.setBounds(203, 20, 104, 14);
		frame.getContentPane().add(lblNewLabel_4);
		
		Player_Nation = new JTextField();
		Player_Nation.setBounds(175, 45, 96, 20);
		frame.getContentPane().add(Player_Nation);
		Player_Nation.setColumns(10);
		
		JLabel lblNewLabel_5 = new JLabel("Kills");
		lblNewLabel_5.setBounds(203, 76, 49, 14);
		frame.getContentPane().add(lblNewLabel_5);
		
		Kills = new JTextField();
		Kills.setBounds(175, 101, 96, 20);
		frame.getContentPane().add(Kills);
		Kills.setColumns(10);
		
		JLabel lblNewLabel_6 = new JLabel("Deaths");
		lblNewLabel_6.setBounds(203, 146, 49, 14);
		frame.getContentPane().add(lblNewLabel_6);
		
		Deaths = new JTextField();
		Deaths.setBounds(175, 180, 96, 20);
		frame.getContentPane().add(Deaths);
		Deaths.setColumns(10);
		
		JLabel lblNewLabel_7 = new JLabel("KDA");
		lblNewLabel_7.setBounds(203, 228, 49, 14);
		frame.getContentPane().add(lblNewLabel_7);
		
		KDA = new JTextField();
		KDA.setBounds(175, 266, 96, 20);
		frame.getContentPane().add(KDA);
		KDA.setColumns(10);
		
		JLabel lblNewLabel_8 = new JLabel("Kills Per Round");
		lblNewLabel_8.setBounds(203, 308, 104, 14);
		frame.getContentPane().add(lblNewLabel_8);
		
		KPR = new JTextField();
		KPR.setBounds(175, 344, 96, 20);
		frame.getContentPane().add(KPR);
		KPR.setColumns(10);
		
		JLabel lblNewLabel_9 = new JLabel("Kill Death Difference");
		lblNewLabel_9.setBounds(377, 20, 116, 14);
		frame.getContentPane().add(lblNewLabel_9);
		
		KDD = new JTextField();
		KDD.setBounds(362, 45, 96, 20);
		frame.getContentPane().add(KDD);
		KDD.setColumns(10);
		
		JLabel lblNewLabel_10 = new JLabel("Rifle Kills");
		lblNewLabel_10.setBounds(393, 76, 49, 14);
		frame.getContentPane().add(lblNewLabel_10);
		
		RK = new JTextField();
		RK.setBounds(362, 101, 96, 20);
		frame.getContentPane().add(RK);
		RK.setColumns(10);
		
		JLabel lblNewLabel_11 = new JLabel("Grenade Kills");
		lblNewLabel_11.setBounds(393, 146, 116, 14);
		frame.getContentPane().add(lblNewLabel_11);
		
		GK = new JTextField();
		GK.setBounds(362, 180, 96, 20);
		frame.getContentPane().add(GK);
		GK.setColumns(10);
		
		JLabel lblNewLabel_12 = new JLabel("SMG Kills");
		lblNewLabel_12.setBounds(393, 228, 49, 14);
		frame.getContentPane().add(lblNewLabel_12);
		
		SK = new JTextField();
		SK.setBounds(362, 266, 96, 20);
		frame.getContentPane().add(SK);
		SK.setColumns(10);
		
		JLabel lblNewLabel_13 = new JLabel("Pistol Kills");
		lblNewLabel_13.setBounds(393, 308, 100, 14);
		frame.getContentPane().add(lblNewLabel_13);
		
		PK = new JTextField();
		PK.setBounds(362, 344, 96, 20);
		frame.getContentPane().add(PK);
		PK.setColumns(10);
		
		JLabel lblNewLabel_14 = new JLabel("Other Kills");
		lblNewLabel_14.setBounds(604, 161, 81, 14);
		frame.getContentPane().add(lblNewLabel_14);
		
		OK = new JTextField();
		OK.setBounds(571, 180, 96, 20);
		frame.getContentPane().add(OK);
		OK.setColumns(10);
		
		JButton btnExecute = new JButton("Execute");
		btnExecute.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement New_Player = myConn.prepareCall("{call New_Player(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
					New_Player.setString(1,PlayerID.getText());
					New_Player.setString(2,Player_Alias.getText());
					New_Player.setString(3,First_Name.getText());
					New_Player.setString(4,Last_Name.getText());
					New_Player.setString(5,Player_Age.getText());
					New_Player.setString(6,Player_Nation.getText());
					New_Player.setString(7,Kills.getText());
					New_Player.setString(8,Deaths.getText());
					New_Player.setString(9,KDA.getText());
					New_Player.setString(10,KPR.getText());
					New_Player.setString(11,KDD.getText());
					New_Player.setString(12,RK.getText());
					New_Player.setString(13,GK.getText());
					New_Player.setString(14,SK.getText());
					New_Player.setString(15,PK.getText());
					New_Player.setString(16,OK.getText());
					
					
					
					New_Player.executeQuery();
					JOptionPane.showMessageDialog(null, "New Player has been added to the database!");
					
					
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
