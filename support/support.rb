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

	def find_Text(page, id_name)
		return find(:xpath, getXpath(page, id_name)).text
	end

	def verify_Checkbox_RaidoButton_selected(page, id_name)
		find(:xpath, getXpath(page, id_name)).checked?
	end

	def is_css_visible?(page, id_name)
		return find(:xpath, getXpath(page, id_name)).visible?
	end

	def is_Correct_Plan_Selected(page, id_name)
		sleep 1
		return find(:xpath, getXpath(page, id_name)).value == '1' ? true : false
	end

	def is_text_correct?(page, id_name, expected_text)
		expect(find(:xpath, getXpath(page, id_name)).text).to eq expected_text
	end

	def check_checkbox(page, id_name)
		find(:xpath, getXpath(page, id_name)).set(true)
	end

	def is_PGS_active?
		begin 
			find(:xpath, getXpath(:billingPage, :pgsEnterCreditCard))
			return true
		rescue
			return false 
		end
	end

	def is_User_Logged_In_With_A_Subscription?
		begin
			find(:xpath, getXpath(:dashboard, :shippingBilling))
			return true
		rescue
			return false
		end
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
		#accept_auth_override
		#page.find('#login')
	end

	def accept_auth_override
		begin 
			page.find('#login')
			return true
		rescue
			if ENV['BROWSER_TYPE'] == 'ie' and (ENV['STACK'] == 'pie1' or ENV['STACK'] == 'test1')
				page.driver.execute_script("document.getElementById('overridelink').click()")
				sleep 3
			end
		end
	end

	# Creates a random Email addres corresponding to the stack 
	def new_User_Name
		return 'ot1to.smoketest+'+rand(5000).to_s+'.'+ENV['stack']+'.'+rand(5000).to_s+'@gmail.com'
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

	def select_item_from_dropdown(page, dropdown, name_id)
		find(:xpath, getXpath(page, dropdown)).click()
		find(:xpath, getXpath(page, name_id)).click()
	end
	
	def has_page_finished_loading?(page, name_id)
		@i = 0
		while @i < 60 do
			begin
				sleep 10
				is_css_visible?(page,name_id )
				puts 'Can CSS be located? - True'
				return true
			rescue
				puts 'Can CSS be located? - False'
			end
			@i += 3
		end
		# assert error 
	end

	def has_ThankYou_Page_Progress_Bar_Finished?
		@i = 0
		while @i < 60 do
			begin
				sleep 10
				is_css_visible?(:thankyouPage,:progressBar )
				puts "Progress Bar is Visible"
			rescue
				puts "progress Bar Finished"
				break
			end
			@i += 3
		end
	end

	###############################
	###   RAILS ADMIN METHODS   ###
	###############################

	def admin_sign_in(url, page)
		visit(url)
		find(:xpath, getRailsXpath(page, :userName)).set(ENV['ADMIN_USER'] )
		find(:xpath, getRailsXpath(page, :password)).set(ENV['ADMIN_PASSWORD'])
		find(:xpath, getRailsXpath(page, :logIn)).click()
	end

	def agena_Sign_In
		admin_sign_in(ENV['AGENA_ADMIN'], :agenaAdmin)
	end

	def gemini_Sign_In
		admin_sign_in(ENV['GEMINI_ADMIN'], :geminiAdmin)
	end

	def unRedeem_Enrollment_Key
		visit(ENV['ENROLLMENT_KEY_URL'])
		find(:xpath, getRailsXpath(:redeemEK, :unRedeem)).click()
		puts find(:xpath, getRailsXpath(:redeemEK, :unRedeemResult)).text
	end

	def obsolete_Subscription(sub_number)
		visit(ENV['OBSOLETE_SUB']+sub_number)
		find(:xpath, getRailsXpath(:obsoleteSub, :obsolete)).click()
		puts find(:xpath, getRailsXpath(:obsoleteSub, :status)).text
	end


end