## II_Auto
#Initial enviroment set up

Install Ruby on Rails - http://railsinstaller.org/en (can ignore the git setup when it pops up)
Install Firefox - version 41.0.1 - current latest version - subject to change to older version if bugs occure
Download ChromeDriver - http://chromedriver.storage.googleapis.com/index.html?path=2.19/ - current latest version
Download Internet Explorer Driver - http://selenium-release.storage.googleapis.com/index.html?path=2.39/ 
                                  - stable version (Windows OS Only)

With the ChromeDriver and IEDriver you need to save these in the same location.
After you make a clone of this project. Go to the root directory of the project
* II_Auto/
* create a folder called assets
* save the ChromeDriver and Internet Explorer Driver in this folder
* Now you will need to add the path to these Drivers to the Envirnement Variable called PATH.
  * open up folder explorer and right click My Pc ->  Properties
  * click Advance System Settings -> Environment Variables
  * in the System Variables locate Path and click edit
  * add the path to the Drivers to the end of this variable 
  * make sure you start with a ; 

For Internet Explorer Driver 

	- you need to add the websites urls to the Trusted sites list under Security in Interne Options. This includes the regular landing page on all stacks, webauth on all stacks, and the pgs fourm.
	
	- You will also need to add a few items to regedit. Go to https://code.google.com/p/selenium/wiki/InternetExplorerDriver#Required_Configuration and follow the directions under REquired configurations
	
	- you will need to add a DWORD iexplore.exe to FEATURE_HTTP_USERNAME_PASSWORD_DISABLE which is located in the same path as the one listed in the url above
	
	- wait theres more....
	 
	- For troubleshooting IE : https://github.com/seleniumQuery/seleniumQuery/wiki/seleniumQuery-and-IE-Driver
	- the protection mode and the browser size is very important. The tests work at 100% because the driver is assuming 100% and will crash otherwise. 
	


Message Michael Aranda to recieve the environment.rb file.
  * palce this file in the assets/ folder
  
# Installing The Project

* cmd into the root Directory II_Auto/
* Run the command bundle install (This will only work outside of firewall - unless you have your proxy setting correct)


# Running the Tests

cmd into the root Directory II_Auto/

rake integration:smoke['browser','stack'] - this will run the smoke test at the specified browser and stack

example: rake integration:smoke['ie','pie1']

given parameters:

browser = 'ie', 'chrome', 'firefox'
stack   = 'test1', 'pie1', 'stage1'(stage1 is not accessable with smoke test as of 10/7/2015 will update will aviable)

Current Tests:
:smoke['browser','stack']
:basic(does not test anything but used as a trial test to test new content before makeing an actual tests from it)
	
# Running the Tests through Task Scheduler (Windows OS) (Buggy!@#!@$!@#)

A logs folder was created to store the log files for the test automation, but all logs are not to be push to the repo thus they were added to the gitignore

With in the Logs folder create a log file for pie1 and test1 named:
pie1_test.log
test1_test.log

Note :The rake integration:smoke task was updated to apped the test results to the corresponding file

In order to make a new Task for the Task Scheduler you need to make a .bat file
in the root directory create a file named: pie1.bat

NOTE: all .bat files in the root directory were added to the gitignore

add this to the .bat file:

@echo off

cd """PATH TO ROOT DIRECTORY WITH QUOATATION MARKS IF PATH CONTAINS ANY SPACES"""
      example: cd "C:\Users\Instant Ink\Desktop\Ruby\II_Auto"
      
cls

call rake integration:smoke['ie','pie1']

exit


NOTES: you can make the two parameters into variables and they can be passed in with the Task Scheduler, but i have not done        the resaerch to figre it out at the  moment

In Task Scheduler click on the create Task on the right hand side and fill out the info to run the test and a schedule timed interval. 






    
  
