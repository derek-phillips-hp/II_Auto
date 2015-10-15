require 'spec_helper'
require './support/support.rb'

include Support

##
# => ONLY WORKS ON PIE1 and TEST1
# => This Smoke Test simply tests the enrollment flow to see if is possible
# => to complete an enrollment flow, then test certian parts of the Dashboard 
#

describe 'Testing Instant Ink' , :type => :feature do
  
  ##
  # =>             user_name: Creates the User Email address that will be used through out all the tests
  # => subscription_complete: All tests after the Smoke tests are dependent on the fact that 
  #                           the subscription was completed or not
  # =>        account_number: Used in the deconstruction test to obsolete the subscription
  #                           (If Rails admin access is given)

  user_name = new_User_Name
  subscription_complete = false
  account_number = ''



  ##
  # => Launches the landing page 
  #
  before :all do
  	launch_Landing_Page
  end



  ##
  # => Prints out info gathered through out the test if aviable 
  #
  after :all do
    puts ''
    puts "Smoke Test on stack: #{ENV['STACK']}" 
    puts "Test Ran at :" + Time.now.asctime
    puts 'User Email: ' + user_name
    puts 'Account Number: ' + account_number
    puts "Enrollment Key: #{ENV['ENROLLMENT_KEY']}"
  end
  
  it "Preforming the Smoke Test for user: " + user_name do
   	pgs = true

    puts '#########################################'
    puts '####### Testing the Landing Page  #######'
    ##
    # Landing page test. Only sees if the Sign up button is aviable 
    # then clicks it.  

    click_Button(:landingPage, :signUpBlueButton)




    puts '#########################################'
    puts '### Testing the Create Account Page  ####'
    ##
    # => Creates a user and tests if the fields are editable
    #

    fill_In(:signInPage, :signupEmail,     user_name)
    fill_In(:signInPage, :firstName,       'Otto')
    fill_In(:signInPage, :lastName,        'Tester')
    fill_In(:signInPage, :password,        'aio1test')
    fill_In(:signInPage, :confirmPassword, 'aio1test')
    create_User_Terms_Checkbox

    click_Button(:signInPage, :signupSubmit)
    click_Button(:signInPage, :yesItsCorrect)




    puts '#########################################'
    puts '####### Testing Pick a Plan Page ########'
    ##
    # => Enters an enrollment Key and verifys that it selects the correct plan
    #

    fill_In(:planPage,                  :enrollCode, ENV['ENROLLMENT_KEY'])
    click_Button(:planPage,             :apply)
    is_Correct_Plan_Selected?(:planPage, :planOneRaidoButton)
    click_Button(:planPage,             :continue)




    puts '#########################################'
    puts '###### Testing Add a Printer Page #######'
    ##
    # => Uses the Local Printer Button to add a virtual printer to the test
    # => and verifys that the printer was added correctly
    #

    add_Local_Printer

    is_css_visible?(:printerPage, :printerAdded)
    click_Button(:printerPage,     :continue)



    puts '#########################################'
    puts '### Testing Add Shipping Address Page ###'
    ##
    # => Enteres the Shipping address to the fileds given
    # => Special notice to the drop downs. they are built off of
    # => javascript and needed to click on the script diretly in order 
    # => to activate the drop down
    #

    within_frame(find(:xpath, '//*[@id="edit-billing-inline-frame"]')) do
      fill_In(:shippingPage,:streetAddress,"16399 West Bernardo Drive")
      fill_In(:shippingPage,:city,'San Diego')
      select_item_from_dropdown(:shippingPage, :stateDropDpwn, :california)
      fill_In(:shippingPage, :zipCode, '92127')
      click_Button(:shippingPage, :continue)
    end




    ##
    # => Tests the Billing page
    # => Deteremins which billing page is active
    # => PGS or Snapfish
    #
    sleep 3
    if is_PGS_active?
      

      puts '#########################################'
      puts '####### Testing Billing with PGS ########'
      ##
      # => PGS was Turned on thus was sent to a new url 
      # => valid billing information was added to the account
      #

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



      puts '#########################################'
      puts '##### Testing Billing with Snapfish #####'
      ##
      # =>  PGS was Turned Off and was not sent to a new url
      # => valid billing inforamtion was added to the account

      pgs = false
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

    sleep 10
    



    puts '#########################################'
    puts '########## Testing Review Page ##########'
    ##
    # => Tests if all inforamtion that was entered in the past pages was 
    # => correctly saved
    #


    has_page_finished_loading?(:reviewPage, :planText)

    is_text_correct?(:reviewPage, :planText, 
                     '$2.99 per month for 50 pages, +$1.00 for each additional set of 15 pages' )

    is_text_correct?(:reviewPage, :shippingText, 
                     'Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801' )

    if pgs
      is_text_correct?(:reviewPage, :billingCCText, 
                       'Visa Card Otto Tester xxxx-xxxx-xxxx-4113' )
    else
      is_text_correct?(:reviewPage, :billingCCText,
                       'Visa Card Otto xxxx-xxxx-xxxx-1111' )
    end

    is_text_correct?(:reviewPage, :billingAddressText, 
                     '16399 West Bernardo Drive San Diego, CA 92127-1801 (619) 555-5555' )

    fill_In(:reviewPage, :promoCode, 'ALLREGIONS')
    click_Button(:reviewPage, :promoApply)

    is_text_correct?(:reviewPage, :promoAccepted, 
                     'ALLREGIONS Promotion code applied' )
    
    is_text_correct?(:reviewPage, :enrollmentKeyInfo, 
                     'Enrollment key 1 month - 50 pages per month' )
    
    is_text_correct?(:reviewPage, :promoCodeInfo, 
                     'Promotion code (ALLREGIONS) 1 month - 50 pages per month free' )

    check_checkbox(:reviewPage, :tosCheckBox)
    click_Button(:reviewPage, :enroll)




    puts '#########################################'
    puts '######## Testing Thank You Page #########'
    ##
    # => Verifying that the progress bar has finshed and click the 
    # => View Account PAge button
    #

    sleep 10
    has_ThankYou_Page_Progress_Bar_Finished?
    click_Button(:thankyouPage, :viewAccountPage)

    


    puts '#########################################'
    puts '########### Testing Dashboard ###########'
    ##
    # => Testing that the Dash Board is convaying all the 
    # => correct information that was given in the 
    # => enrollment process
    #

    subscription_complete = true

    has_page_finished_loading?(:dashboard, :shippingBilling)

    account_number = find_Text(:dashboard, :accountNumber)
    account_number = account_number[9, account_number.size]


    is_text_correct?(:dashboard, :enrolledPlan,
                     'Enrolled in $2.99 plan')

    click_Button(:dashboard, :shippingBilling)

    is_text_correct?(:dashboard, :shippingInfo,
                     'Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801')

    if pgs
      is_text_correct?(:dashboard, :billingInfo, 
                     'Credit Card Visa xxxx-4113 Otto Tester 16399 West Bernardo Drive San Diego, CA 92127-1801 (619) 555-5555 Edit')
    else
      is_text_correct?(:dashboard, :billingInfo, 
                     'Credit Card Visa xxxx-1111 Otto 16399 West Bernardo Drive San Diego, CA 92127-1801 (619) 555-5555 Edit')
    end
    click_Button(:dashboard, :shippingBilling)

    sleep 1

    click_Button(:dashboard, :myPlan)

    sleep 1

    is_text_correct?(:dashboard, :planInfo,
                     'Monthly pages 50 Rollover Pages Up to 50 Additional pages Set of 15 pages for $1.00 2 months remaining with no charge for regular pages')
    
    sleep 1

    click_Button(:dashboard, :myPlan)

    sleep 1

    click_Button(:dashboard, :activity)

    is_text_correct?(:dashboard, :firstEntryDescription,
                     'Promotion (50 pages per month free for 1 month)')
    
    sleep 1
    
    click_Button(:dashboard, :activity)
   
    sleep 1
    
    click_Button(:dashboard, :signOut)

    sleep 2

    is_css_visible?(:landingPage, :signUpBlueButton)

  end




  ##
  # =>  IF the Subscription was completed we can Do more Detailed tests on the dash board
  # => This test edits the shipping address and verifys that it was saved correctly 
  #
  it "Can I edit the Shipping Address" do
    if subscription_complete
      
      puts '#########################################'
      puts '######### Edit Shipping Address #########'

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

      is_text_correct?(:dashboard, :shippingInfo, 
           'Autto Mation 500 Sea World Dr San Diego, CA 92109-7904')
      
      click_Button(:dashboard, :shippingBilling)
      click_Button(:dashboard, :signOut)
      has_page_finished_loading?(:landingPage, :signUpBlueButton)
    end
  end



  ##
  # => Deconstruction Test
  # => Redeems the Enrollment Key and obsoletes the subscription 
  #
  it 'Cleaning up the Smoke Test' do
    if subscription_complete \

      puts '#########################################'
      puts '###### UNREDEEMING ENROLLMENT KEY #######'
      agena_Sign_In
      unRedeem_Enrollment_Key

      puts '#########################################'
      puts '######  OBSOLETING SUBSCRIPTION   #######'
      puts '#########################################'
      gemini_Sign_In
      obsolete_Subscription(account_number)
    
    end
  end
end