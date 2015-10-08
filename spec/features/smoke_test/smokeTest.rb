require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing Instant Ink' , :type => :feature do
  
  user_name = new_User_Name
  subscription_complete = false
  account_number = ''

  before :all do
  	launch_Landing_Page
    puts 'Creating a Smoke test for user: ' + user_name
  end

  # after do
  #   # after each test navigate away before Capybara tries to so that we can appropriately handle the onbeforeunload dialog
  #   if @browser
  #     begin
  #       @browser.navigate.to("about:blank")
  #       @browser.switch_to.alert.accept
  #     rescue Selenium::WebDriver::Error::NoAlertPresentError
  #       # No alert was present. Don't need to do anything
  #     end
  #   end
  # end
  
  it "Preforming the Smoke Test for user: " + user_name do
   	pgs = true

    puts '### Testing the Landing Page ###'

    click_Button(:landingPage, :signUpBlueButton)

    puts '### Testing the Create Account Page ###'

    fill_In(:signInPage, :signupEmail,     user_name)
    fill_In(:signInPage, :firstName,       'Otto')
    fill_In(:signInPage, :lastName,        'Tester')
    fill_In(:signInPage, :password,        'aio1test')
    fill_In(:signInPage, :confirmPassword, 'aio1test')
    create_User_Terms_Checkbox

    click_Button(:signInPage, :signupSubmit)
    click_Button(:signInPage, :yesItsCorrect)

    puts '### Testing Pick a Plan Page ###'

    fill_In(:planPage,                  :enrollCode, ENV['ENROLLMENT_KEY'])
    click_Button(:planPage,             :apply)
    puts 'IS correct plan selected?: '.concat(is_Correct_Plan_Selected(:planPage, :planOneRaidoButton).to_s)
    click_Button(:planPage,             :continue)

    puts '### Testing Add a Printer Page ###'

    add_Local_Printer


    puts 'Was Printer added? - '.concat(is_css_visible?(:printerPage, :printerAdded).to_s)
    click_Button(:printerPage,     :continue)

    puts '### Testing Add Shipping Address Page ###'

    within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
      fill_In(:shippingPage,:streetAddress,"16399 West Bernardo Drive")
      fill_In(:shippingPage,:city,'San Diego')
      select_item_from_dropdown(:shippingPage, :stateDropDpwn, :california)
      fill_In(:shippingPage, :zipCode, '92127')
      click_Button(:shippingPage, :continue)
    end

    sleep 3
    
    if is_PGS_active?
      puts'### Testing Billing with PGS ###'
      pgs = true 
      click_Button(:billingPage, :pgsEnterCreditCard)
      sleep 2
      fill_In(:billingPage, :pgsFirstName, 'Otto' )
      fill_In(:billingPage, :pgsLastName, 'Tester' )
      fill_In(:billingPage, :pgsCardNumber, '4112344112344113')
      select_item_from_dropdown(:billingPage, :pgsExpirationDropDown, :pgs_12th_month)
      select_item_from_dropdown(:billingPage, :pgsYearDropDown, :pgs_Year_2030)
      fill_In(:billingPage, :pgsCVV, '150')
      fill_In(:billingPage, :pgsPhoneNumber, '6195555555')
      click_Button(:billingPage, :pgsContinue)
    else
      puts '### Testing billing with Snapfish - pgs was turned off ###'
      pgs = false
      within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
        fill_In(:billingPage, :sfNameOnCard, 'Otto')
        fill_In(:billingPage, :sfCardNumber, '4111111111111111')
        select_item_from_dropdown(:billingPage, :sfExpirationDropDown ,:sf_12th_month)
        select_item_from_dropdown(:billingPage, :sfYearDropDown ,:sf_Year_2034)
        fill_In(:billingPage, :sfCVV ,'150')
      end
    end
   
    sleep 10
    has_page_finished_loading?(:reviewPage, :planText)

    puts '### Testing Review Page ###'

    puts 'Plan Text:              '.concat(is_text_correct?(:reviewPage, :planText, 
         '$2.99 per month for 50 pages, +$1.00 for each additional set of 15 pages' ).to_s)

    puts 'Shipping Text:          '.concat(is_text_correct?(:reviewPage, :shippingText, 
         'Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801' ).to_s)

    if pgs
      puts 'Billing CC Text:        '.concat(is_text_correct?(:reviewPage, :billingCCText, 
           'Visa Card Otto Tester xxxx-xxxx-xxxx-4113' ).to_s)
    else
      puts 'Billing CC Text:        '.concat(is_text_correct?(:reviewPage, :billingCCText, 
           'Visa Card Otto Tester xxxx-xxxx-xxxx-1111' ).to_s)
    end

    puts 'Billing Address Text:   '.concat(is_text_correct?(:reviewPage, :billingAddressText, 
         '16399 West Bernardo Drive San Diego, CA 92127-1801 (619) 555-5555' ).to_s)

    fill_In(:reviewPage, :promoCode, 'ALLREGIONS')
    click_Button(:reviewPage, :promoApply)

    puts 'Promo Accepted:         '.concat(is_text_correct?(:reviewPage, :promoAccepted, 
         'ALLREGIONS Promotion code applied' ).to_s)
    
    puts 'Enrollment Key Info:    '.concat(is_text_correct?(:reviewPage, :enrollmentKeyInfo, 
         'Enrollment key 1 month - 50 pages per month' ).to_s)
    
    puts 'PromoCode Info:         '.concat(is_text_correct?(:reviewPage, :promoCodeInfo, 
         'Promotion code (ALLREGIONS) 1 month - 50 pages per month free' ).to_s)

    check_checkbox(:reviewPage, :tosCheckBox)
    click_Button(:reviewPage, :enroll)

    sleep 10
    has_ThankYou_Page_Progress_Bar_Finished?

    click_Button(:thankyouPage, :viewAccountPage)

    subscription_complete = true

    has_page_finished_loading?(:dashboard, :shippingBilling)
    puts '### Testing Dashboard ###'

    account_number = find_Text(:dashboard, :accountNumber)
    account_number = account_number[9, account_number.size]

    puts 'Enrolled Plan:          '.concat(is_text_correct?(:dashboard, :enrolledPlan, 
         'Enrolled in $2.99 plan').to_s)

    click_Button(:dashboard, :shippingBilling)

    puts 'Shipping info:          '.concat(is_text_correct?(:dashboard, :shippingInfo, 
         'Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801').to_s)

    puts 'Billing info:           '.concat(is_text_correct?(:dashboard, :billingInfo, 
         'Credit Card Visa xxxx-4113 Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801 (619) 555-5555 Edit').to_s)
    
    click_Button(:dashboard, :myPlan)
    sleep 1
    puts 'Plan info:              '.concat(is_text_correct?(:dashboard, :planInfo, 
         'Monthly pages 50 Rollover Pages Up to 50 Additional pages Set of 15 pages for $1.00 2 months remaining with no charge for regular pages').to_s)
    
    click_Button(:dashboard, :activity)
    
    puts 'First Activity entry:   '.concat(is_text_correct?(:dashboard, :firstEntryDescription, 
         'Promotion (50 pages per month free for 1 month)').to_s)
    
    subscription_complete = true

    click_Button(:dashboard, :signOut)
    sleep 2
    is_css_visible?(:landingPage, :signUpBlueButton)

  end

  it "Can I edit the Shipping Address" do
    if subscription_complete
      
      puts '### Edit Shipping Address ###'

      launch_Landing_Page
      sleep 5

      if !is_User_Logged_In_With_A_Subscription?
        click_Button(:landingPage, :signInNavBar)

        within_frame 'webauthPanelIFrame' do
          fill_In(:landingPage, :signInEmail, user_name)
          fill_In(:landingPage, :signInPassword, 'aio1test')
          click_Button(:landingPage, :signInSubmit)
        end
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
      end

      has_page_finished_loading?(:dashboard, :shippingBilling)
      click_Button(:dashboard, :shippingBilling)

      puts 'Shipping info Updated: '.concat(is_text_correct?(:dashboard, :shippingInfo, 
           'Autto Mation 500 Sea World Dr San Diego, CA 92109-7904').to_s)

      click_Button(:dashboard, :signOut)
      has_page_finished_loading?(:landingPage, :signUpBlueButton)
    end
  end

  it 'Cleaning up the Smoke Test' do
    if subscription_complete 
      puts '### UNREDEEMING ENROLLMENT KEY ###'
      agena_Sign_In
      unRedeem_Enrollment_Key
      puts '###  OBSOLETING SUBSCRIPTION   ###'
      gemini_Sign_In
      obsolete_Subscription(account_number)
    end
  end

end