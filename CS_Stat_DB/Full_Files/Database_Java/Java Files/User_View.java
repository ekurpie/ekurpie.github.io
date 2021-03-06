package MyDatabase.lib;

import java.awt.Desktop;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URI;
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
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;



public class User_View {
	
	static String URL;
	static String Name;
	static String User;
	static String Pass;

	private JFrame frame;
	private static JTable table;
	private static JTextField textField;
	private static JTextField Player_Alias;
	private static JTextField Team_Name;
	private static JTextField Player_1;
	private static JTextField Player_2;
	private static JTextField FullName;
	private static JTextField textField_1;
	private static JTextField Played_In;
	private static JTextField Transfer_one;
	private static JTextField Transfer_two;
	
	public User_View(String URL, String Name,String User,String Pass) {
		
	}
	
	public static void SetValues(String URL, String Name, String User, String Pass) {
		User_View.URL = URL;
		User_View.Name = Name;
		User_View.User = User;
		User_View.Pass = Pass;
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
					User_View window = new User_View();
					window.frame.setVisible(true);
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					 // Do something with the Connection
					Statement rset = myConn.createStatement();
		         
		            String tablenames = "SELECT table_name FROM information_schema.tables WHERE TABLE_NAME = \"player\" OR TABLE_NAME = \"team\" OR TABLE_NAME = \"league\" OR TABLE_NAME = \"game\";";
		            ResultSet tables = rset.executeQuery(tablenames);
		           
		            Guest_View.resultSetToTableModel(tables,table);
		            
		            
		            
		            
		            
		            
		            
		         
		           
		       	
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
	public User_View() {
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
		table.setBounds(10, 183, 1166, 569);
		frame.getContentPane().add(table);
		
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
		lblQueryResults.setBounds(931, 127, 245, 40);
		frame.getContentPane().add(lblQueryResults);
		
		 JLabel lblViewPlayerStatistics = new JLabel("Enter Player Alias");
         lblViewPlayerStatistics.setBounds(10, 1, 113, 28);
         frame.getContentPane().add(lblViewPlayerStatistics);
         
         JLabel lblNewLabel = new JLabel("Enter Team Name");
         lblNewLabel.setBounds(153, 0, 104, 31);
         frame.getContentPane().add(lblNewLabel);
         
         JButton btnViewPlayer = new JButton("View Player");
         btnViewPlayer.addActionListener(new ActionListener() {
        	 
         	public void actionPerformed(ActionEvent e) {
         		try {
         		
         		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
				 // Do something with the Connection
         		
         		PreparedStatement pStmt = myConn.prepareStatement(
         	            "select * from guest_player where Player_Alias = ?");
         		pStmt.setString(1, Player_Alias.getText());
         		
         		ResultSet rset = pStmt.executeQuery();
         		
         		Guest_View.resultSetToTableModel(rset,table);
         		
         		}
         		catch(Exception f) {
         		}
         		
         	}
         });
         btnViewPlayer.setBounds(10, 54, 113, 23);
         frame.getContentPane().add(btnViewPlayer);
         
         JButton btnViewTeam = new JButton("View Team");
         btnViewTeam.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
             		
             		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
    				 // Do something with the Connection
             		
             		PreparedStatement pStmt = myConn.prepareStatement(
             	            "select * from team where Team_Name = ?");
             		pStmt.setString(1, Team_Name.getText());
             		
             		ResultSet rset = pStmt.executeQuery();
             		
             		Guest_View.resultSetToTableModel(rset,table);
             		
             		}
             		catch(Exception f) {
             		}
             		
             	}
         	
         });
         btnViewTeam.setBounds(153, 54, 104, 23);
         frame.getContentPane().add(btnViewTeam);
         
         Player_Alias = new JTextField();
         Player_Alias.setBounds(10, 31, 113, 20);
         frame.getContentPane().add(Player_Alias);
         Player_Alias.setColumns(10);
         
         Team_Name = new JTextField();
         Team_Name.setBounds(153, 27, 104, 20);
         frame.getContentPane().add(Team_Name);
         Team_Name.setColumns(10);
         
         JButton btnShowTables = new JButton("Show Tables");
         btnShowTables.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
         		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
				 // Do something with the Connection
				Statement rset = myConn.createStatement();
	         
	            String tablenames = "SELECT table_name FROM information_schema.tables WHERE TABLE_NAME = \"player\" OR TABLE_NAME = \"team\" OR TABLE_NAME = \"league\" OR TABLE_NAME = \"game\";";
	            ResultSet tables = rset.executeQuery(tablenames);
	           
	            Guest_View.resultSetToTableModel(tables,table);
         		}
         		catch(Exception s) {
         		}
         		}
         	
         });
         btnShowTables.setBounds(461, 4, 119, 23);
         frame.getContentPane().add(btnShowTables);
         
         JButton btnNewButton = new JButton("Show Players");
         btnNewButton.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
             		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
    				 // Do something with the Connection
    				Statement rset = myConn.createStatement();
    	         
    	            String tablenames = ("SELECT Player_Alias from player;") ;
    	            ResultSet tables = rset.executeQuery(tablenames);
    	           
    	            Guest_View.resultSetToTableModel(tables,table);
             		}
             		catch(Exception s) {
             		}
         		
         	}
         });
         btnNewButton.setBounds(590, 4, 119, 23);
         frame.getContentPane().add(btnNewButton);
         
         JButton btnShowTeams = new JButton("Show Teams");
         btnShowTeams.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
             		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
    				 // Do something with the Connection
    				Statement rset = myConn.createStatement();
    	         
    	            String tablenames = ("SELECT Team_Name from team;") ;
    	            ResultSet tables = rset.executeQuery(tablenames);
    	           
    	            Guest_View.resultSetToTableModel(tables,table);
             		}
             		catch(Exception s) {
             		}
             		
         	}
         });
         btnShowTeams.setBounds(719, 4, 119, 23);
         frame.getContentPane().add(btnShowTeams);
         
         JButton btnPlayernationalities = new JButton("Player_Nationalities");
         btnPlayernationalities.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement Player_nationalities = myConn.prepareCall("{call Player_nationalities}");
					
					ResultSet rset = Player_nationalities.executeQuery();
					
					Guest_View.resultSetToTableModel(rset,table);
					
					
					}
					catch(SQLException g) {
						
					}
         		
         	}
         });
         btnPlayernationalities.setBounds(306, 4, 143, 23);
         frame.getContentPane().add(btnPlayernationalities);
         
         JButton btnWatchReplay = new JButton("Watch Replay");
         btnWatchReplay.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try{
         			Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
   				 // Do something with the Connection
   				Statement rset = myConn.createStatement();
   	         
   	            String tablenames = ("SELECT * from replay;") ;
   	            ResultSet tables = rset.executeQuery(tablenames);
   	           
   	            tables.next();
	            String Website = tables.getString(3);
	            System.out.println(Website);
   	 
         			Desktop.getDesktop().browse(new URI(Website));
         		}
         		catch(Exception y)
         		{
         			
         		}
         		
         	}
         });
         btnWatchReplay.setBounds(320, 54, 129, 23);
         frame.getContentPane().add(btnWatchReplay);
         
         JButton btnNewButton_1 = new JButton("Show Games");
         btnNewButton_1.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
              		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
        				 // Do something with the Connection
        				Statement rset = myConn.createStatement();
        	         
        	            String tablenames = ("SELECT match_team_1,Match_Team_2, Winner FROM game;");
        	            ResultSet tables = rset.executeQuery(tablenames);
        	           
        	            Guest_View.resultSetToTableModel(tables,table);
              		}
              		catch(Exception s) {
              		}
         	}
         });
         btnNewButton_1.setBounds(845, 4, 113, 23);
         frame.getContentPane().add(btnNewButton_1);
         
         JButton btnNewplayer = new JButton("New Player");
         btnNewplayer.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		New_Player.main(null);
         	}
         });
         btnNewplayer.setBounds(461, 54, 113, 23);
         frame.getContentPane().add(btnNewplayer);
         
         JButton btnShowLeagues = new JButton("Show Leagues");
         btnShowLeagues.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
              		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
        				 // Do something with the Connection
        				Statement rset = myConn.createStatement();
        	         
        	            String tablenames = ("SELECT * FROM league;");
        	            ResultSet tables = rset.executeQuery(tablenames);
        	           
        	            Guest_View.resultSetToTableModel(tables,table);
              		}
              		catch(Exception s) {
              		}
         	}
         });
         btnShowLeagues.setBounds(845, 54, 113, 23);
         frame.getContentPane().add(btnShowLeagues);
         
         Player_1 = new JTextField();
         Player_1.setBounds(321, 127, 96, 20);
         frame.getContentPane().add(Player_1);
         Player_1.setColumns(10);
         
         Player_2 = new JTextField();
         Player_2.setBounds(461, 127, 96, 20);
         frame.getContentPane().add(Player_2);
         Player_2.setColumns(10);
         
         JButton Compare = new JButton("Compare");
         Compare.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+"127.0.0.1" +":3306/" + "counterstrike" , "root","Zingbob23");
					CallableStatement Player_Comparison = myConn.prepareCall("{call Player_Comparison(?,?)}");
					Player_Comparison.setString(1,Player_1.getText());
					Player_Comparison.setString(2,Player_2.getText());
					ResultSet rset = Player_Comparison.executeQuery();
					
					Guest_View.resultSetToTableModel(rset,table);
				
					
					
					}
					catch(SQLException g) {
						
					}
         	}
         	
         });
         Compare.setBounds(394, 160, 89, 23);
         frame.getContentPane().add(Compare);
         
         JLabel lblPlayer = new JLabel("Player 1");
         lblPlayer.setBounds(344, 113, 49, 14);
         frame.getContentPane().add(lblPlayer);
         
         JLabel lblPlayer_1 = new JLabel("Player 2");
         lblPlayer_1.setBounds(483, 113, 49, 14);
         frame.getContentPane().add(lblPlayer_1);
         
         textField_1 = new JTextField();
         textField_1.setBounds(649, 127, 96, 20);
         frame.getContentPane().add(textField_1);
         textField_1.setColumns(10);
         
         JLabel lblPlayerName = new JLabel("Player Alias");
         lblPlayerName.setBounds(656, 113, 89, 14);
         frame.getContentPane().add(lblPlayerName);
         
         JButton btnFullname_1 = new JButton("Fullname");
         btnFullname_1.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {

         		try {
              		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
        				 // Do something with the Connection
              		
              		PreparedStatement stmt = myConn.prepareStatement("Select Player_Alias, Full_Name(First_name,Last_Name) as Fullname from Player where Player_Alias = ?");

        			stmt.setString(1, textField_1.getText());
 
   	            ResultSet tables = stmt.executeQuery();
   	           
   	            Guest_View.resultSetToTableModel(tables,table);
   	            
        	        
              		}
              		catch(Exception s) {
              		}
         	}
         });
         btnFullname_1.setBounds(649, 160, 89, 23);
         frame.getContentPane().add(btnFullname_1);
         
         JButton btnPlayersAndTeams = new JButton("Players and Teams");
         btnPlayersAndTeams.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
              		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
        				 // Do something with the Connection
        				Statement rset = myConn.createStatement();
        	         
        	            String tablenames = ("SELECT Player_Alias, player_nationality, Team_Name FROM player NATURAL JOIN team_player;");
        	            ResultSet tables = rset.executeQuery(tablenames);
        	           
        	            Guest_View.resultSetToTableModel(tables,table);
              		}
              		catch(Exception s) {
              		}
         	
         	}
         	
         });
         btnPlayersAndTeams.setBounds(10, 109, 151, 23);
         frame.getContentPane().add(btnPlayersAndTeams);
         
         JButton btnPlayerAverageAge = new JButton("Player Average Age");
         btnPlayerAverageAge.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
              		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
        				 // Do something with the Connection
        				Statement rset = myConn.createStatement();
        	         
        	            String tablenames = ("SELECT Player_nationality, AVG(Player_age) AS Average_Age FROM player GROUP BY Player_Nationality;");
        	            ResultSet tables = rset.executeQuery(tablenames);
        	           
        	            Guest_View.resultSetToTableModel(tables,table);
              		}
              		catch(Exception s) {
              		}
         	}
         });
         btnPlayerAverageAge.setBounds(10, 142, 151, 23);
         frame.getContentPane().add(btnPlayerAverageAge);
         
         JButton btnPlayedIn = new JButton("Played In");
         btnPlayedIn.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		
         			try {
             		
             		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
    				 // Do something with the Connection
             		
             		PreparedStatement pStmt = myConn.prepareStatement(
             	            "SELECT t.Player_Alias,Full_Name(t.First_Name,t.Last_Name) AS Fullname,Team_name AS Plays_For, Match_Team_1, Match_Team_2, Winner,Elapsed_Time FROM (SELECT Player_Alias,first_Name,Last_Name,Team_name FROM player natural join team_player) AS t, (SELECT * from player natural join player_game NATURAL JOIN game) AS p WHERE t.Player_Alias = p.Player_Alias AND t.Player_Alias = ?");
             		pStmt.setString(1,Played_In.getText());
             		
             		ResultSet rset = pStmt.executeQuery();
             		
             		Guest_View.resultSetToTableModel(rset,table);
             		
             		}
             		catch(Exception f) {
             		}
             		
         		
         	}
         });
         btnPlayedIn.setBounds(802, 160, 89, 23);
         frame.getContentPane().add(btnPlayedIn);
         
         Played_In = new JTextField();
         Played_In.setBounds(802, 127, 96, 20);
         frame.getContentPane().add(Played_In);
         Played_In.setColumns(10);
         
         JLabel lblPlayerName_1 = new JLabel("Player Name");
         lblPlayerName_1.setBounds(813, 113, 72, 14);
         frame.getContentPane().add(lblPlayerName_1);
         
         Transfer_one = new JTextField();
         Transfer_one.setBounds(605, 55, 96, 20);
         frame.getContentPane().add(Transfer_one);
         Transfer_one.setColumns(10);
         
         Transfer_two = new JTextField();
         Transfer_two.setBounds(719, 55, 96, 20);
         frame.getContentPane().add(Transfer_two);
         Transfer_two.setColumns(10);
         
         JLabel lblPlayerName_2 = new JLabel("Player Name");
         lblPlayerName_2.setBounds(605, 34, 79, 14);
         frame.getContentPane().add(lblPlayerName_2);
         
         JLabel lblPlayerName_3 = new JLabel("Player Name");
         lblPlayerName_3.setBounds(729, 35, 72, 14);
         frame.getContentPane().add(lblPlayerName_3);
         
         JButton btnTransfer = new JButton("Transfer");
         btnTransfer.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		

         		try {
         			
             		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
    				 // Do something with the Connection
             		
             		
             		myConn.setAutoCommit(false);
    	            String string1 = Transfer_one.getText();
    	            String string2 = Transfer_two.getText();
             		Statement rset = myConn.createStatement();
             		String Tablenames2 = ("UPDATE player SET Kills = Kills - 1000 where Player_Alias = '" + string1 + "'");
             		String Tablenames = ("UPDATE player SET Kills = Kills + 1000 where Player_Alias = '" + string2 + "'");
    	          
    	            int count = rset.executeUpdate(Tablenames2);
    	            int count2 = rset.executeUpdate(Tablenames);
    	            
    	  
    	            
    	           int res = JOptionPane.showConfirmDialog(null, "Save this information?");
    	            
    	            if (res == 0)
    	            {
    	            	myConn.commit();
    	            	myConn.setAutoCommit(true);
    	            }
    	            else {
    	            	myConn.rollback();
    	            	myConn.setAutoCommit(true);
    	            	
    	            }
    	            
             		
             		}
             		catch(Exception f) {
             			
             		}
         		
         	}
         });
         
         btnTransfer.setBounds(719, 86, 89, 23);
         frame.getContentPane().add(btnTransfer);
         
         JButton btnCheck = new JButton("Check");
         btnCheck.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
         			
             		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name , User,Pass);
    				 // Do something with the Connection
             		
             		PreparedStatement pStmt = myConn.prepareStatement("SELECT t.Player_alias,t.kills,p.Player_alias,p.kills FROM player AS t,player AS p WHERE t.Player_Alias = ? AND p.Player_Alias = ?");
             	           
             		pStmt.setString(1,Transfer_one.getText());
             		pStmt.setString(2,Transfer_two.getText());
             		
             		ResultSet rset = pStmt.executeQuery();
             		
             		Guest_View.resultSetToTableModel(rset,table);
             		
             		}
             		catch(Exception f) {
             		}
         		
         	}
         });
         btnCheck.setBounds(605, 86, 89, 23);
         frame.getContentPane().add(btnCheck);
         
        
         
         		
         
         
         
         
        
         
         
        
         
		
		
	}
}
