require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing Instant Ink' , :type => :feature do
  
  before :all do
  	launch_Landing_Page
  end

  after :all do 
  	page.execute_script "window.close()"
  end
  
  it "Preforming the Smoke Test" do
   	
   	puts "Testing the Landing Page"

  	click_Button(:landingPage, :signUpBlueButton)

  	puts "Testing the Create Account Page"

  	fill_In(:signInPage, :signupEmail,     new_User_Name)
	fill_In(:signInPage, :firstName,       'Otto')
	fill_In(:signInPage, :lastName,        'Tester')
	fill_In(:signInPage, :password,        'aio1test')
	fill_In(:signInPage, :confirmPassword, 'aio1test')
	create_User_Terms_Checkbox

	click_Button(:signInPage, :signupSubmit)
	click_Button(:signInPage, :yesItsCorrect)

	puts "Testing Pick a Plan Page"
   	
   	fill_In(:planPage,                  :enrollCode, ENV['ENROLLMENT_KEY'])
   	click_Button(:planPage,             :apply)
   	is_Correct_Plan_Selected(:planPage, :planOneRaidoButton)
   	click_Button(:planPage,             :continue)

   	puts "Testing Add a Printer Page"

   	add_Local_Printer

   	# for stage 1
   	# fill_In(:printerPage,          :claimCode, '')
   	# click_Button(:printerPage,     :add)

   	is_Printer_Added(:printerPage, :printerAdded)
	click_Button(:printerPage,     :continue)

	puts "Testing Add Shipping Address Page"

	within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
		fill_In(:shippingPage,:streetAddress,"16399 West Bernardo Drive")
		fill_In(:shippingPage,:city,'San Diego')
		select_State(:shippingPage, :california)
		fill_In(:shippingPage, :zipCode, '92127')
		click_Button(:shippingPage, :continue)
	end

  end

end