require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing the Landing Page' , :type => :feature do
  
  before :all do
  	launch_Landing_Page
  end
  
  it "Preforming the Smoke Test" do
   	
   	puts "Testing the Landing Page"
   	find(:xpath, '/html/body/div[6]/div/div[3]/div[2]/div[4]/div/a').click()


   	puts "Testing the Create Account Page"
   	fill_in 'signupEmail',     :with => new_User_Name
   	fill_in 'firstName',       :with => 'Otto'
   	fill_in 'lastName',        :with => 'Tester'
   	fill_in 'password',        :with => 'aio1test'
   	fill_in 'confirmPassword', :with => 'aio1test'

   	create_User_Terms_Checkbox

   	click_button 'signupSubmit'

   	find(:xpath, '/html/body/div[5]/div[2]/a').click()

   	puts "Testing Pick a Plan Page"
   	fill_in 'code', :with => ENV['ENROLLMENT_KEY']
   	find(:xpath, '//*[@id="code-form"]/div[1]/input[2]').click()
   	find(:xpath, '//*[@id="signup-step-one"]/div[3]/div[2]/a[2]').click()

   	puts "Testing Add a Printer Page"
   	
  end

end