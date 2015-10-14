require './support/II_Map.rb'
require './support/railsAdmin_Map.rb'

include II_Map
include RailsAdmin_Map

module Support

	$sub_id = ''

	URL_GEMINI_ROUTES = {
		sign_in:         'admins/sign_in',
		obsoleteSub:     'admin/subscriptions/setup_obsolete/',
		sub_via_Acc_num: 'rails_admin/subscription?model_name=subscription&utf8=✓&query=',
		sub_via_id:      'rails_admin/Subscription/#{$sub_id}',
		edit_sub:        'super_rails_admin/subscription/#{$sub_id}/edit'
	}

	URL_AGENA_ROUTES = {
		sign_in:       'admin_users/sign_in',
		enrollmentKey: 'rails_admin/signup_code/'
	}

	### Helper Methods to make top level tests more readable ###

	## => click_Button
	# => page    - system variable representing the keyname in the II_Map
	#              The nameing convention represents the current page you are 
	#              trying to test
	# => id_name - system variable representing the itemname in the II_Map
	#              The nameing convention represents the item on the current page
	#              you are trying to test
	# 
	# => This method takes in two system variables that helps getXpath locate
	#    the saved String that represnts the xpath of the item in question. 
	#    Then it calls the find Capybara find methind which uses the xpath 
	#    to locate the button in question and then clicks it.
	#
	# => example - click_Button(:landingPage, :signUpBlueButton) 
	#
	def click_Button( page, id_name)
		find(:xpath, getXpath(page, id_name)).click()
	end

	## => fill_In
	# => page    - system variable representing the keyname in the II_Map
	#              The nameing convention represents the current page you are 
	#              trying to test
	# => id_name - system variable representing the itemname in the II_Map
	#              The nameing convention represents the item on the current page
	#              you are trying to test
	# => text    - The String will be entered into the field located by its xpath 
	#
	# => This method takes in three parameteres( 2 system variables and 1 string)
	#    the system variables helps the getXpath method return the string representing
	#    xpath of the item in question. Then it calls the Capybara find method which uses the 
	#    xpath to located the field that will be filled in by the text given
	#
	# => example - fill_In(:signInPage, :firstName, 'Otto')
	#
	def fill_In(page, id_name, text)
		find(:xpath, getXpath(page, id_name)).set(text)
	end

	## => find_Text
	# => page    - system variable representing the keyname in the II_Map
	#              The nameing convention represents the current page you are 
	#              trying to test
	# => id_name - system variable representing the itemname in the II_Map
	#              The nameing convention represents the item on the current page
	#              you are trying to test
	# 
	# => This method takes in two system variables that helps getXpath locate
	#    the saved String that represnts the xpath of the item in question. 
	#    Then it calls the find Capybara find methind which uses the xpath 
	#    to locate the field and returns the string. 
	#
	# => example - find_Text(:dashboard, :accountNumber)
	#
	def find_Text(page, id_name)
		return find(:xpath, getXpath(page, id_name)).text
	end

	## => verify_Checkbox_RaidoButton_selected
	# => page    - system variable representing the keyname in the II_Map
	#              The nameing convention represents the current page you are 
	#              trying to test
	# => id_name - system variable representing the itemname in the II_Map
	#              The nameing convention represents the item on the current page
	#              you are trying to test
	# 
	# => This method takes in two system variables that helps getXpath locate
	#    the saved String that represnts the xpath of the item in question. 
	#    Then it calls the find Capybara find method which uses the xpath 
	#    to locate the field and returns a boolean if the item was selected or not
	#    The result is then tested with the rspec method to verify if the returned
	#    value is true.  
	#
	# => example - verify_Checkbox_RaidoButton_selected(:planPage, :planOneRaidoButton)
	#
	def verify_Checkbox_RaidoButton_selected?(page, id_name)
		expect(find(:xpath, getXpath(page, id_name)).checked?).to eq true
	end

	## => is_css_visible?
	# => page    - system variable representing the keyname in the II_Map
	#              The nameing convention represents the current page you are 
	#              trying to test
	# => id_name - system variable representing the itemname in the II_Map
	#              The nameing convention represents the item on the current page
	#              you are trying to test
	# 
	# => This method takes in two system variables that helps getXpath locate
	#    the saved String that represnts the xpath of the item in question. 
	#    Then it calls the Capybara find meethod which uses the xpath 
	#    to locate the field and returns a boolean if the item was visible on the page 
	#    or not The result is then tested with the rspec method to verify if the returned
	#    value is true.  
	#
	# => example - is_css_visible?(:planPage, :planOneRaidoButton)
	#
	def is_css_visible?(page, id_name)
		expect(find(:xpath, getXpath(page, id_name)).visible?).to eq true
	end


	## => is_Correct_Plan_Selected?
	# => page    - system variable representing the keyname in the II_Map
	#              The nameing convention represents the current page you are 
	#              trying to test
	# => id_name - system variable representing the itemname in the II_Map
	#              The nameing convention represents the item on the current page
	#              you are trying to test
	# 
	# => This method takes in two system variables that helps getXpath locate
	#    the saved String that represnts the xpath of the item in question. 
	#    Then it calls the Capybara find meethod which uses the xpath 
	#    to locate the raidoButton and returns '1' if plan was selected
	#    The result is then tested with the rspec method to verify if the returned
	#    value is true.  
	#
	# => example - is_Correct_Plan_Selected?(:planPage, :planOneRaidoButton)
	#
	def is_Correct_Plan_Selected?(page, id_name)
		sleep 1
		expect(find(:xpath, getXpath(page, id_name)).value).to eq '1'
	end

	## => is_text_correct?
	# => page             - system variable representing the keyname in the II_Map
	#                       The nameing convention represents the current page you are 
	#                        trying to test
	# => id_name          - system variable representing the itemname in the II_Map
	#                       The nameing convention represents the item on the current page
	#                       you are trying to test
	# => expected_text    - The String will be tested against the string located at the 
	#                       specified location
	#
	# => This method takes in three parameteres( 2 system variables and 1 string)
	#    the system variables helps the getXpath method return the string representing
	#    xpath of the item in question. Then it calls the Capybara find method which uses the 
	#    xpath to located the field that will be tested
	#
	# => example - is_text_correct?(:signInPage, :firstName, 'Otto')
	#
	def is_text_correct?(page, id_name, expected_text)
		expect(find(:xpath, getXpath(page, id_name)).text).to eq expected_text
	end

	## => check_checkbox
	# => page    - system variable representing the keyname in the II_Map
	#              The nameing convention represents the current page you are 
	#              trying to test
	# => id_name - system variable representing the itemname in the II_Map
	#              The nameing convention represents the item on the current page
	#              you are trying to test
	# 
	# => This method takes in two system variables that helps getXpath locate
	#    the saved String that represnts the xpath of the item in question. 
	#    Then it calls the Capybara find meethod which uses the xpath 
	#    to locate the checkbox and select it 
	#
	# => example - check_checkbox(:planPage, :planOneRaidoButton)
	#
	def check_checkbox(page, id_name)
		find(:xpath, getXpath(page, id_name)).set(true)
	end


	## => is_PGS_active?
	#
	# => Tries to find a an item specific to the PGS form. If the find 
	#    returns a valid object then the method retuns true. If the find 
	#    method triggers an exception the method captures it and retruns 
	#    false 
	#

	def is_PGS_active?
		begin 
			find(:xpath, getXpath(:billingPage, :pgsEnterCreditCard))
			return true
		rescue
			return false 
		end
	end

	## => is_User_Logged_In_With_A_Subscription?
	#
	# => If a test set fails before being able to log out properly
	#    the next test that launches will be redirected to the Dashboard
	#    This method is used to determine if the new test that started is on the
	#    landing page or the Dashboard then you can make the test act accordingly. 
	#
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

	##
	# => If a test user does not have the credentials to run the tests this will accept the browser
	# => error message page
	#
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
		if ENV['REAL_PRINTER'] == 'true'
			find(:xpath, getXpath(:printerPage, :claimCode)).set(ENV['CLAIM_CODE'])
			find(:xpath, getXpath(:printerPage, :add)).click()
		else
			find(:xpath, getXpath(:printerPage, :cancel)).click()
			sleep 1
			find(:xpath, getXpath(:printerPage, :localPrinter)).click()
			find(:xpath, getRailsXpath(:printerCreation, :serialNumber)).set(rand(10000).to_s+'OTTOTEST'+rand(10000).to_s)
			find(:xpath, getRailsXpath(:printerCreation, :deviceImmutableId)).set(rand(10000).to_s+'OTTOTEST'+rand(10000).to_s)
			find(:xpath, getRailsXpath(:printerCreation, :cloudPrinterIdentifier)).set(rand(10000).to_s+'OTTOTEST'+rand(10000).to_s)
			find(:xpath, getRailsXpath(:printerCreation, :addPrinter)).click()
		end
	end

	# select the given item from the drop down list
	def select_item_from_dropdown(page, dropdown, name_id)
		find(:xpath, getXpath(page, dropdown)).click()
		find(:xpath, getXpath(page, name_id)).click()
	end
	
	# Work In Progress
	def has_page_finished_loading?(page, name_id)
		@i = 0
		while @i < 60 do
			begin
				sleep 10
				is_css_visible?(page,name_id )
				return true
			rescue
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
			rescue
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
		admin_sign_in(ENV['AGENA_ADMIN'] + URL_AGENA_ROUTES[:sign_in], :agenaAdmin)
	end

	def gemini_Sign_In
		admin_sign_in(ENV['GEMINI_ADMIN'] + URL_GEMINI_ROUTES[:sign_in], :geminiAdmin)
	end

	def unRedeem_Enrollment_Key
		visit(ENV['AGENA_ADMIN'] + URL_AGENA_ROUTES[:enrollmentKey] + ENV['ENROLLMENT_KEY_ID'])
		find(:xpath, getRailsXpath(:redeemEK, :unRedeem)).click()
		puts find(:xpath, getRailsXpath(:redeemEK, :unRedeemResult)).text
	end

	def obsolete_Subscription(sub_number)
		visit(ENV['GEMINI_ADMIN'] + URL_GEMINI_ROUTES[:obsoleteSub] + sub_number)
		find(:xpath, getRailsXpath(:obsoleteSub, :obsolete)).click()
		puts find(:xpath, getRailsXpath(:obsoleteSub, :status)).text
	end

	def find_Subscription_ID_via_Account_number(account_number)
		visit(URI.encode(ENV['GEMINI_ADMIN'] + URL_GEMINI_ROUTES[:sub_via_Acc_num] + account_number))
		$sub_id = find(:xpath, getRailsXpath(:subscription_query, :id_link)).text
	end

	###############################
	###    EDIT SUBSCRIPTION    ###
	###############################
	def edit_subscription
		visit(ENV['GEMINI_ADMIN'] + URL_GEMINI_ROUTES[:edit_sub])
	end

	def printer_first_contact_page_count_is(page_count=0)
	end

	def event_shift_by(event_shift=0)
	end

	def transition_sub_state_to(state)
	end

	def save_edited_subscription
		find(:spath, getRailsXpath(:subscription_edit, :save_and_exit)).click()
	end

end