require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing the Landing Page' , :type => :feature do
  
  before :each do
  	launch_Landing_Page
  end
  
  it "i can fine the homepage Sign Up button" do
   	click_Button(:landingPage, :signInNavBar)

   	within_frame 'webauthPanelIFrame' do
		fill_In(:landingPage, :signInEmail, 'test.gemini.p+v11210@gmail.com')
		fill_In(:landingPage, :signInPassword, 'aio1test')
		click_Button(:landingPage, :signInSubmit)
	end

	click_Button(:landingPage, :signUpBlueButton)
	sleep 1
	click_Button(:planPage, :continue)
	sleep 1
	click_Button(:printerPage, :continue)
	sleep 1

	within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
		fill_In(:shippingPage,:streetAddress,"16399 West Bernardo Drive")
		fill_In(:shippingPage,:city,'San Diego')
		select_item_from_dropdown(:shippingPage, :stateDropDpwn, :california)
		fill_In(:shippingPage, :zipCode, '92127')
		click_Button(:shippingPage, :continue)
	end

	sleep 3
	if is_PGS_active?
		click_Button(:billingPage, :pgsEnterCreditCard)
		sleep 2
		accept_auth_override
		fill_In(:billingPage, :pgsFirstName, 'Otto' )
		fill_In(:billingPage, :pgsLastName, 'Tester' )
		fill_In(:billingPage, :pgsCardNumber, '4112344112344113')
		select_item_from_dropdown(:billingPage, :pgsExpirationDropDown, :pgs_12th_month)
		select_item_from_dropdown(:billingPage, :pgsYearDropDown, :pgs_Year_2030)
		fill_In(:billingPage, :pgsCVV, '150')
		fill_In(:billingPage, :pgsPhoneNumber, '6195555555')
		click_Button(:billingPage, :pgsContinue)
	else
		within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
			fill_In(:billingPage, :sfNameOnCard, 'Otto')
			fill_In(:billingPage, :sfCardNumber, '4111111111111111')
			select_item_from_dropdown(:billingPage, :sfExpirationDropDown ,:sf_12th_month)
			select_item_from_dropdown(:billingPage, :sfYearDropDown ,:sf_Year_2034)
			fill_In(:billingPage, :sfCVV ,'150')
		end
	end
	sleep 1


  	
  end  
end