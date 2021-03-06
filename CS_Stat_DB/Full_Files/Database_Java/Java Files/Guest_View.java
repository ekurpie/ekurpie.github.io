package MyDatabase.lib;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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

public class Guest_View {
	
	static String URL;
	static String Name;
	static String User;
	static String Pass;

	private JFrame frame;
	private static JTable table;
	private static JTextField textField;
	private static JTextField Player_Alias;
	private static JTextField Team_Name;
	
	public Guest_View(String URL, String Name,String User,String Pass) {
		
	}
	
	public static void SetValues(String URL, String Name, String User, String Pass) {
		Guest_View.URL = URL;
		Guest_View.Name = Name;
		Guest_View.User = User;
		Guest_View.Pass = Pass;
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
					Guest_View window = new Guest_View();
					window.frame.setVisible(true);
					Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
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
	public Guest_View() {
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
		table.setBounds(10, 88, 1166, 664);
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
		lblQueryResults.setBounds(707, 11, 245, 40);
		frame.getContentPane().add(lblQueryResults);
		
		 JLabel lblViewPlayerStatistics = new JLabel("Enter Player Alias");
         lblViewPlayerStatistics.setBounds(10, 1, 113, 28);
         frame.getContentPane().add(lblViewPlayerStatistics);
         
         JLabel lblNewLabel = new JLabel("Enter Team Name");
         lblNewLabel.setBounds(227, 0, 104, 31);
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
         btnViewTeam.setBounds(227, 54, 104, 23);
         frame.getContentPane().add(btnViewTeam);
         
         Player_Alias = new JTextField();
         Player_Alias.setBounds(10, 31, 113, 20);
         frame.getContentPane().add(Player_Alias);
         Player_Alias.setColumns(10);
         
         Team_Name = new JTextField();
         Team_Name.setBounds(227, 29, 104, 20);
         frame.getContentPane().add(Team_Name);
         Team_Name.setColumns(10);
         
         JButton btnShowTables = new JButton("Show Tables");
         btnShowTables.addActionListener(new ActionListener() {
         	public void actionPerformed(ActionEvent e) {
         		try {
         		Connection myConn = DriverManager.getConnection("jdbc:mysql://"+URL +":3306/" + Name,User,Pass);
				 // Do something with the Connection
				Statement rset = myConn.createStatement();
	         
	            String tablenames = "SELECT table_name FROM information_schema.tables WHERE TABLE_NAME = \"player\" OR TABLE_NAME = \"team\" OR TABLE_NAME = \"game\";";
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
         btnNewButton.setBounds(461, 33, 119, 23);
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
         btnShowTeams.setBounds(461, 64, 119, 23);
         frame.getContentPane().add(btnShowTeams);
         
         JButton btnShowGames = new JButton("Show Games");
         btnShowGames.addActionListener(new ActionListener() {
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
         btnShowGames.setBounds(593, 64, 113, 23);
         frame.getContentPane().add(btnShowGames);
         
      		
  	}

         
        
         
		
		
}

