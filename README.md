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

Message Derek Phillips or Michael Aranda to recieve the environment.rb file.
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
	




    
  
