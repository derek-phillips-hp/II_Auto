require './support/II_Map.rb'
require './support/railsAdmin_Map.rb'

include II_Map
include RailsAdmin_Map

module Support


	### Helper Methods to make top level tests more readable ###

	def click_Button( page, id_name)
		find(:xpath, getXpath(page, id_name)).click()
	end

	def fill_In(page, id_name, text)
		find(:xpath, getXpath(page, id_name)).set(text)
	end

	def verify_Checkbox_RaidoButton_selected(page, id_name)
		find(:xpath, getXpath(page, id_name)).checked?
	end

	def is_Printer_Added(page, id_name)
		find(:xpath, getXpath(page, id_name)).visible?
	end

	def is_Correct_Plan_Selected(page, id_name)
		sleep 1
		return find(:xpath, getXpath(page, id_name)).value == '1' ? true : false
	end

 	###############################
	###  RANDOM HELPFUL METHODS ###
	###############################


	# Determins if an  browser based alert was triggered
	def alert_present?
  		begin
    		page.driver.browser.switch_to.alert
    		return true
  		rescue
    		return false
  		end
	end
	
	# Launches the landing page depending on arguments given
	def launch_Landing_Page
		visit(ENV['LANDING_PAGE'])
		if ENV['BROWSER_TYPE'] == 'ie' and (ENV['STACK'] == 'pie1' or ENV['STACK'] == 'test1')
			page.driver.execute_script("document.getElementById('overridelink').click()")
			sleep 3
		end
		#page.find('#login')
	end


	# Creates a random Email addres corresponding to the stack 
	def new_User_Name
		return 'ot1to.smoketest'+rand(5000).to_s+'.'+ENV['stack']+'.'+rand(5000).to_s+'@gmail.com'
	end

	# Overrides the javascript created checkbox that Selenium can not trigger 
	# only effects Chrome and Firefox, IE works fine
	def create_User_Terms_Checkbox
		if (ENV['BROWSER_TYPE'] == 'chrome' or ENV['BROWSER_TYPE'] == 'firefox')
			page.driver.execute_script("document.getElementById('termsOptin').checked = true")
		else
			check 'termsOptin'
		end
	end

	# Adds a virtual local printer on test1 and pie1 
	def add_Local_Printer
		find(:xpath, getXpath(:printerPage, :cancel)).click()
		sleep 1
		find(:xpath, getXpath(:printerPage, :localPrinter)).click()
		
		find(:xpath, getRailsXpath(:printerCreation, :serialNumber)).set(rand(10000).to_s+'OTTOTEST'+rand(10000).to_s)
		find(:xpath, getRailsXpath(:printerCreation, :deviceImmutableId)).set(rand(10000).to_s+'OTTOTEST'+rand(10000).to_s)
		find(:xpath, getRailsXpath(:printerCreation, :cloudPrinterIdentifier)).set(rand(10000).to_s+'OTTOTEST'+rand(10000).to_s)

		find(:xpath, getRailsXpath(:printerCreation, :addPrinter)).click()
	end

	def select_State(page, state)
		find(:xpath, getXpath(page, :stateDropDpwn)).click()
		find(:xpath, getXpath(page, state)).click()
	end
	
end