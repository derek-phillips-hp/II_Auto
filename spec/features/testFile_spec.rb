require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing the Landing Page' , :type => :feature do

	it "Can I edit the Shipping Address" do

		launch_Landing_Page
		
		click_Button(:landingPage, :signInNavBar)

		within_frame 'webauthPanelIFrame' do
			fill_In(:landingPage, :signInEmail, 'test.gemini.p+v135635460@gmail.com')
			fill_In(:landingPage, :signInPassword, 'aio1test')
			click_Button(:landingPage, :signInSubmit)
		end
		sleep 1

	  puts '#########################################'
      puts '######### Edit Shipping Address #########'

      launch_Landing_Page
      sleep 5

      # if !is_User_Logged_In_With_A_Subscription?
      #   click_Button(:landingPage, :signInNavBar)

      #   within_frame 'webauthPanelIFrame' do
      #     fill_In(:landingPage, :signInEmail, user_name)
      #     fill_In(:landingPage, :signInPassword, 'aio1test')
      #     click_Button(:landingPage, :signInSubmit)
      #   end
      # end

      click_Button(:dashboard, :shippingBilling)

      is_text_correct?(:dashboard, :shippingInfo, 
           'Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801')

      click_Button(:dashboard, :editShipping)

      within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
        fill_In(:dashboard, :editFirstName, 'Autto')
        fill_In(:dashboard, :editLastName, 'Mation')
        fill_In(:shippingPage, :streetAddress, '500 Sea World Dr')
        fill_In(:shippingPage, :city, 'San Diego')
        fill_In(:shippingPage, :zipCode, '92109')
        click_Button(:dashboard, :editShippingSave)
      end

      has_page_finished_loading?(:dashboard, :shippingBilling)
      # click_Button(:dashboard, :shippingBilling)

      is_text_correct?(:dashboard, :shippingInfo, 
           'Autto Mation 500 Sea World Dr San Diego, CA 92109-7904')

      click_Button(:dashboard, :signOut)
      has_page_finished_loading?(:landingPage, :signUpBlueButton)


	end
end