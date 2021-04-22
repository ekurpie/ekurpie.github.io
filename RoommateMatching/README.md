# RoommateMatching

This is the code to a roommate matching website for a study abroad program that was produced with a team of 11. 
I was one of the 3 developers on this website. A good bit of it was built from scratch, though, other parts used templates such as Bootstrap. 
As of 4/22/21 the website is still up and available at: https://mis565.amruss.ventures/public/. It uses JS,HTML,CSS for a front end with PHP
on a mySQL backend. Below is the readme we created for the project when it was submitted for review.



<pre>public_html
├── css            # All custom stylesheets
├── data           # Database and data backups
├── img            # Images, logos, icons    
├── includes       # Base and frequently used php files  
├── js             # Custom scripts and functions  
├── lib            # Bootstrap and other framework files  
 ── template.php   # Basic php/html page template used
 ── README.md
</pre>
## Downloads
[GitHub](https://desktop.github.com/)  
[XAMPP](https://www.apachefriends.org/download.html)  
[Visual Studio Code](https://code.visualstudio.com)

## Getting Started

### Setting Up Local Test Server
Start by downloading and installing [XAMPP](https://www.apachefriends.org/download.html). Here are detailed walkthroughs for installing XAMPP for both [Windows](https://www.ionos.com/digitalguide/server/tools/xampp-tutorial-create-your-own-local-test-server/) and [Mac](https://www.webucator.com/how-to/how-install-start-test-xampp-on-mac-osx.cfm).  
  
After XAMPP is installed, download and install [GitHub Desktop](https://desktop.github.com/). This will let you clone and manage your branch locally and allow you to push/pull updates easily. Once you have installed GitHub Desktop, launch the application and sign in using your GitHub account. Then, navigate to the main page of [RoommateMatching](https://github.com/graylecompte/RoommateMatching) repository using your web browser.  

Above the list of files/directories click the download <b>Code</b> button.  
<div><img src="https://docs.github.com/assets/images/help/repository/code-button.png" alt="Download Code" width="300px"></img></div>  

Click <b>Open with GitHub Desktop</b> to open the repository with GitHub Desktop.

In GitHub Desktop, next to <b>Local path</b>, click <b>Choose...</b> and navigate to your XAMPP installation using the window explorer. In the <b>xampp</b> directory navigate to <b>htdocs</b> and create a new directory/file named <b>public_html</b>. Open the directory and click <b>Select Folder</b>. Click <b>Clone</b>.  

To start your test server, launch the <b>XAMPP Control Panel</b> application and click the <b>Start</b> buttons next to <b>Apache</b> and <b>MySQL</b>.  

<div><img src="https://github.com/graylecompte/RoommateMatching/blob/main/img/screenshots/xampp_control_panel.PNG" alt="XAMPP Components" width="400px"></img></div>  

In your web browser, navigate to <a href="http://localhost/public_html/RoommateMatching/index.php">http://localhost/public_html/RoommateMatching/index.php</a>. If you see the landing page, your test server is up and running! Any edits you make to the files will be updated on this site.  
  
For more details on installation and configuration, here are some links to GitHub's [Documentation](https://docs.github.com/en/free-pro-team@latest/desktop/installing-and-configuring-github-desktop/creating-your-first-repository-using-github-desktop).  

### Create Local Database

Launch the <b>XAMPP Control Panel</b> application. If you haven't already, click the <b>Start</b> buttons next to <b>Apache</b> and <b>MySQL</b> to start your server. Now click <b>Admin</b> on the <b>MySQL</b> line. This will launch <b>phpMyAdmin</b> in your web browser.  

Once <b>phpMyAdmin</b> has loaded, click on <b>New</b> in the left side panel. In the <b>Create database</b> field, type <b>mis565_dev</b> and click <b>Create</b>.  
<div><img src="https://github.com/graylecompte/RoommateMatching/blob/main/img/screenshots/phpmyadmin_create.PNG" alt="Create DB" width="400px"></img></div>   

Once you are redirected to the new database's page. Click the <b>Import</b> tab.  

Under the <b>File to import</b> section click <b>Choose File</b>. Navigate to your local repository, which should be located in your <b>xampp/htdocs/public_html</b> directory, and open the <b>data</b> directory. Click on <b>amruspfw_backup.sql</b> and click <b>Open</b>. In <b>phpMyAdmin</b>, scroll down and click <b>Go</b>.  

<b>mis565_dev</b> should now be populated with all tables and existing data!   

Now open <a href="http://localhost/public_html/RoommateMatching/index.php">http://localhost/public_html/RoommateMatching/index.php</a> in your web browser and try logging in using <b>850123456</b> as the BannerId and <b>password</b> as the Password. 

#### Tips  
*For a lighter installation, just install MySQL and phpMyAdmin as additional components.*
<div><img src="https://github.com/graylecompte/RoommateMatching/blob/main/img/screenshots/xampp_components.PNG" alt="XAMPP Components" width="400px"></img></div>
