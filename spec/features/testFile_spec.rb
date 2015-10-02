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
		select_State(:shippingPage, :california)
		fill_In(:shippingPage, :zipCode, '92127')
	end

  end  
end