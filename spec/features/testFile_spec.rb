require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing the Landing Page' , :type => :feature do

	it "Can I edit the Shipping Address" do

		launch_Landing_Page
		
		click_Button(:landingPage, :signInNavBar)

		within_frame 'webauthPanelIFrame' do
			fill_In(:landingPage, :signInEmail, 'test.gemini.p+v1rest110@gmail.com')
			fill_In(:landingPage, :signInPassword, 'aio1test')
			click_Button(:landingPage, :signInSubmit)
		end
		sleep 1

		#click_Button(:landingPage, :signUpBlueButton )
		sleep 1
		click_Button(:planPage, :continue )
		sleep 1
		click_Button(:printerPage, :continue)
		sleep 1
		within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
			click_Button(:shippingPage, :continue)
		end
		sleep 5

		
		within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
	        fill_In(:billingPage, :sfNameOnCard, 'Otto')
	        fill_In(:billingPage, :sfCardNumber, '4111111111111111')
	        select_item_from_dropdown(:billingPage, :sfExpirationDropDown ,:sf_12th_month)
	        select_item_from_dropdown(:billingPage, :sfYearDropDown ,:sf_Year_2034)
	        fill_In(:billingPage, :sfCVV ,'150')
	        click_Button(:billingPage, :sfSameAsShipping)
	        fill_In(:billingPage, :sfPhoneNumber, '6195555555')
	        click_Button(:billingPage, :sfSaveAndContinue)
      	end


	end
end