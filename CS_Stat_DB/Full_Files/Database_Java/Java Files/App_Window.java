package MyDatabase.lib;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

public class App_Window {
	
	static String URL;
	static String Name;
	static String User;
	static String Pass;

	private JFrame frame;
	private static JTable table;
	private static JTextField textField;
	private static JTextField Name2;
	private static JTextField Remove_Player;
	private static JTextField Remove_Team;
	private static JTextField Remove_User;
	
	public App_Window(String URL, String Name,String User,String Pass) {
		
	}
	
	public static void SetValues(String URL, String Name, String User, String Pass) {
		App_Window.URL = URL;
		App_Window.Name = Name;
		App_Window.User = User;
		App_Window.Pass = Pass;
	}

	public static void resultSetToTableModel(ResultSet rs, JTable table) throws SQLException{
        //Create new table model
        DefaultTableModel tableModel = new DefaultTableModel();

        //Retrieve meta data from ResultSet
        ResultSetMetaData metaData = rs.getMetaData();

        //Get number of columns from meta data
        int columnCount = metaData.getColumnCount();

        //Get all column names from meta data and add columns to table model
        for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++){
            tableModel.addColumn(metaData.getColumnLabel(columnIndex));
        }

        //Create array of Objects with size of column count from meta data
        Object[] row = new Object[columnCount];
        
        Object[] columnName = new Object[columnCount];
        
        for (int b = 0;  b < columnCount; b++){
            columnName[b] = metaData.getColumnName(b + 1); 
        }
        
        tableModel.addRow(columnName);
        
        //Scroll through result set
        while (rs.next()){
            //Get object from column with specific index of result set to array of objects
            for (int i = 0; i < columnCount; i++){
                row[i] = rs.getObject(i+1);
            }
            //Now add row to table model with that array of objects as an argument
            tableModel.addRow(row);
        }

        //Now add that table model to your table and you are done :D
        table.setModel(tableModel);
    }
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					App_Window window = new App_Window();
					window.frame.setVisible(true);
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
					 // Do something with the Connection
					Statement rset = myConn.createStatement();
		         
		            String tablenames = "Show tables";
		            ResultSet tables = rset.executeQuery(tablenames);
		           
		            App_Window.resultSetToTableModel(tables,table);
		            
		            
		            
		            
		            
		            
		            	
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public App_Window() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		
		
	
        
		frame = new JFrame();
		frame.setBounds(200, 200, 1200, 800);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		table = new JTable();
		table.setBounds(10, 108, 1166, 644);
		frame.getContentPane().add(table);
		
		JLabel Table_Name = new JLabel("Enter Table Name");
        Table_Name.setFont(new Font("Times New Roman", Font.PLAIN, 14));
        Table_Name.setBounds(29, 0, 117, 23);
        frame.getContentPane().add(Table_Name);
        
        Name2 = new JTextField();
        Name2.setBounds(29, 27, 117, 20);
        frame.getContentPane().add(Name2);
        Name2.setColumns(10);
		
		JButton btnExit = new JButton("Exit");
		btnExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frame.setVisible(false);
				Login_Window.main(null);
			}
		});
        btnExit.setBounds(1015, 26, 89, 23);
        frame.getContentPane().add(btnExit);
		
	
		
		
		JLabel lblQueryResults = new JLabel("Query Results");
		lblQueryResults.setFont(new Font("Times New Roman", Font.PLAIN, 30));
		lblQueryResults.setBounds(749, 11, 245, 40);
		frame.getContentPane().add(lblQueryResults);
		
		JButton btnSearch = new JButton("Select All");
		btnSearch.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					String name = Name2.getText();
					if(name.isBlank()) {
						Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
						 // Do something with the Connection
						Statement rset = myConn.createStatement();
			         
			            String tablenames = "Show tables";
			            ResultSet tables = rset.executeQuery(tablenames);
			           
			            App_Window.resultSetToTableModel(tables,table);
					}
					else {
				Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
				PreparedStatement pStmt = myConn.prepareStatement(
			            "select * from " + Name2.getText());
				ResultSet rset = pStmt.executeQuery();
				App_Window.resultSetToTableModel(rset,table);
					}
				
				}
				catch (Exception t) {
					
				}
				
			}
		});
		btnSearch.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		btnSearch.setBounds(29, 58, 117, 23);
		frame.getContentPane().add(btnSearch);
		
		JButton btnNewplayer = new JButton("New_Player");
		btnNewplayer.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				New_Player.main(null);
			}
		});
        btnNewplayer.setBounds(202, 11, 110, 23);
        frame.getContentPane().add(btnNewplayer);
        
        JButton btnNewteam = new JButton("New_team");
        btnNewteam.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
        		New_Team.main(null);
        	}
        });
        btnNewteam.setBounds(202, 45, 110, 23);
        frame.getContentPane().add(btnNewteam);
        
        JButton btnNewgame = new JButton("New_Game");
        btnNewgame.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
        		New_Game.main(null);
        	}
        });
        btnNewgame.setBounds(202, 79, 110, 23);
        frame.getContentPane().add(btnNewgame);
        
        JButton btnRemovePlayer = new JButton("Remove Player");
        btnRemovePlayer.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
        		try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement RemovePlayer = myConn.prepareCall("{call Remove_Player(?)}");
					RemovePlayer.setString(1,Remove_Player.getText());
				
					
					RemovePlayer.executeQuery();
					JOptionPane.showMessageDialog(null, "Player has been removed!");
					
					
					}
					catch(SQLException g) {
						
					}
        	}
        });
        btnRemovePlayer.setBounds(322, 45, 124, 23);
        frame.getContentPane().add(btnRemovePlayer);
        
        JButton btnRemoveTeam = new JButton("Remove Team");
        btnRemoveTeam.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
        		try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement RemoveTeam = myConn.prepareCall("{call Remove_Team(?)}");
					RemoveTeam.setString(1,Remove_Team.getText());
				
					
					RemoveTeam.executeQuery();
					JOptionPane.showMessageDialog(null, "Team has been removed!");
					
					
					}
					catch(SQLException g) {
						
					}
        		
        	}
        });
        btnRemoveTeam.setBounds(467, 45, 124, 23);
        frame.getContentPane().add(btnRemoveTeam);
        
        JButton btnRemoveUser = new JButton("Remove User");
        btnRemoveUser.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
        		try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement RemoveUser = myConn.prepareCall("{call Remove_User(?)}");
					RemoveUser.setString(1,Remove_User.getText());
				
					
					RemoveUser.executeQuery();
					JOptionPane.showMessageDialog(null, "User has been removed!");
					
					
					}
					catch(SQLException g) {
						
					}
        		
        	}
        });
        btnRemoveUser.setBounds(611, 45, 128, 23);
        frame.getContentPane().add(btnRemoveUser);
        
        Remove_Player = new JTextField();
        Remove_Player.setBounds(322, 11, 96, 20);
        frame.getContentPane().add(Remove_Player);
        Remove_Player.setColumns(10);
        
        Remove_Team = new JTextField();
        Remove_Team.setBounds(479, 11, 96, 20);
        frame.getContentPane().add(Remove_Team);
        Remove_Team.setColumns(10);
        
        Remove_User = new JTextField();
        Remove_User.setBounds(629, 12, 96, 20);
        frame.getContentPane().add(Remove_User);
        Remove_User.setColumns(10);
        
        JButton btnNewUser = new JButton("New User");
        btnNewUser.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent e) {
        		New_User2.main(null);
        	}
        });
        btnNewUser.setBounds(322, 79, 89, 23);
        frame.getContentPane().add(btnNewUser);
		
		
	}
}
