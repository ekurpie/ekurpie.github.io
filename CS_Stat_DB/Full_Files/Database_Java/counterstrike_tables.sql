set foreign_key_checks=0;

drop table if exists Userbase;
drop table if exists Player;
drop table if exists Watch; 
drop table if exists Game;
drop table if exists Replay;
drop table if exists League;
drop table if exists Team_Player;
drop table if exists Participate;
drop table if exists User_Player;
drop table if exists Team;
drop table if exists Player_Game;
drop table if exists Rounds;
drop table if exists League_Game;
 
create table Team
	(Team_Name		varchar(20) not null,
	 Team_Ranking		int,
	 Team_Average_Age	int,
	 Team_Location		varchar(20),
	 primary key (Team_Name)
	)ENGINE = INNODB;

create table Player
	(Player_ID		varchar(5) not null,
	 Player_Alias		varchar(20) not null, 
	 First_Name		varchar(20) not null,
	 Last_Name		varchar(30) not null, 
	 Player_Age		int not null,
	 Player_Nationality	varchar(30),
	 Kills			int,
	 Deaths			int,
	 Kill_Death_Average	numeric(10,2),
	 Kills_Per_Round	int,
	 Kill_Death_Difference	numeric(10,2),
	 Rifle_Kills		int,
	 Grenade_Kills		int,
	 SMG_Kills		int,
	 Pistol_Kills		int,
	 Other_Weapon		int,	
	 primary key (Player_ID)	
	)ENGINE = INNODB;

create table Userbase
	(Username		varchar(20) not null, 
	 Password		varchar(20) not null, 
	 primary key (Username)
	)ENGINE = INNODB;

create table Watch
	(Game_ID		char(10) not null, 
	 Replay_Name		VARCHAR(100) not null,
	 Map1_link		varchar(100), 
	 Username		varchar(20) not null,
	 primary key (Game_ID,Replay_Name,Map1_Link,Username),
	 foreign key (Game_ID,Replay_Name,Map1_Link) references Replay(Game_ID,Replay_Name,Map1_Link) 
		on delete cascade
		on update cascade,
	 foreign Key (Username) references Userbase(Username)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table Game
	(Game_ID		varchar(10) not null,
	 Match_Team_1		varchar(20) not null,
	 Match_Team_2		varchar(20) not null,
	 Winner			varchar(20) not null,
	 Elapsed_Time		time(0) not null,
	 primary key (Game_ID)
	)ENGINE = INNODB;

create table Replay
	(Game_ID		varchar(10) not null,
	 Replay_Name		varchar(100) not null,
	 Map1_Link		varchar(100),
	 primary key (Game_ID,Replay_Name,Map1_Link),
	 foreign key (Game_ID) references Game(Game_ID)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table League
	(League_ID		char(5) not null, 
	 Event_Name		varchar(50) not null,
	 Event_Prizepool	varchar(50),
	 Event_Date		date not null,
	 Event_Location		varchar(50),
	 Event_Team_Count	int,
	 Date_Ended		date,
	 Winning_Team		varchar(20) not null,
	 primary key (League_ID),
	 foreign key (Winning_Team) references Team(Team_Name)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table Team_Player
	(Team_Name		varchar(20) not null, 
	 Player_ID		varchar(5) not null,
	 primary key (Team_Name,Player_ID),
	 foreign key (Team_Name) references Team(Team_Name)
		on delete cascade
		on update cascade,
	 foreign key (Player_ID) references Player(Player_ID)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table Participate 
	(League_ID		varchar(5) not null, 
	 Team_Name		varchar(20) not null,
	 primary key (League_ID,Team_Name),
	 foreign key (League_ID) references League(League_ID)
		on delete cascade
		on update cascade,
	 foreign key (Team_Name) references Team(Team_Name)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table User_Player
	(Username		varchar(20) not null, 
	 Player_ID		varchar(5) not null,
	 primary key (Username,Player_ID),
	 foreign key (Username) references Userbase(Username)
		on delete cascade
		on update cascade,
	 foreign key (Player_ID) references Player(Player_ID)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table Player_Game
	(Player_ID		varchar(5) not null, 
	 Game_ID		varchar(10) not null,
	 primary key (Player_ID,Game_ID),
	 foreign key (Game_ID) references Game(Game_ID)
		on delete cascade
		on update cascade,
 	 foreign key (Player_ID) references Player(Player_ID)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table Rounds
	(Game_ID		varchar(10) not null, 
	 Round_Number		int not null,
	 Winning_team		varchar(20) not null,
	 primary key (Game_ID,Round_Number,Winning_Team),
	 foreign key (Game_ID) references Game(Game_ID)
		on delete cascade
		on update cascade,
	 foreign key (Winning_Team) references Team(Team_Name)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;

create table League_Game
	(Game_ID		varchar(10) not null, 
	 League_ID		varchar(5) not null,
	 primary key (Game_ID,League_ID),
	 foreign key (Game_ID) references Game(Game_ID)
		on delete cascade
		on update cascade,
	 foreign key (League_ID) references League(League_ID)
		on delete cascade
		on update cascade
	)ENGINE = INNODB;
