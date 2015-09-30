require './support/uiMap.rb'
include Map

module Support


	def click_Button( page, id_name)
		find(:xpath, getXpath(page, id_name)).click()
	end

	def fill_In(page, id_name, text)
		find(:xpath, getXpath(page, id_name)).set(text)
	end

	def verify_Checkbox_RaidoButton_selected(page, id_name)
		find(:xpath, getXpath(page, id_name)).checked?
	end


 	###############################
	### RANDOM HELPFUL MENTHODS ###
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
			sleep 2
		end
		page.find('#login')
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

	def is_Printer_Added(page, id_name)
		find(:xpath, getXpath(page, id_name)).visible?
	end

	def is_Correct_Plan_Selected(page, id_name)
		sleep 1
		return find(:xpath, getXpath(page, id_name)).value == '1' ? true : false
	end

end