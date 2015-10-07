require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing the Landing Page' , :type => :feature do

	it "Can I edit the Shipping Address" do

		launch_Landing_Page
		
		click_Button(:landingPage, :signInNavBar)

		within_frame 'webauthPanelIFrame' do
			fill_In(:landingPage, :signInEmail, 'ot1to.smoketest+64.test1.4411@gmail.com')
			fill_In(:landingPage, :signInPassword, 'aio1test')
			click_Button(:landingPage, :signInSubmit)
		end

		click_Button(:dashboard, :shippingBilling)
		
		puts 'Shipping info:          '.concat(is_text_correct?(:dashboard, :shippingInfo, 
             'Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801').to_s)

		click_Button(:dashboard, :editShipping)
		within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
			fill_In(:dashboard, :editFirstName, 'Autto')
			fill_In(:dashboard, :editLastName, 'Mation')
			fill_In(:shippingPage, :streetAddress, '500 Sea World Dr')
			fill_In(:shippingPage, :city, 'San Diego')
			fill_In(:shippingPage, :zipCode, '92109')

			click_Button(:dashboard, :editShippingSave)
			sleep 10
		end

        has_page_finished_loading?(:dashboard, :shippingBilling)
		click_Button(:dashboard, :shippingBilling)

		puts 'Shipping info Updated: '.concat(is_text_correct?(:dashboard, :shippingInfo, 
             'Autto Mation 500 Sea World Dr San Diego, CA 92109-7904').to_s)

	end
end