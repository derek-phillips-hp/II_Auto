require 'spec_helper'

describe 'Testing the Landing Page' , :type => :feature do
  
  before :each do
    visit(ENV['LANDING_PAGE'])
    if ENV['BROWSER_TYPE'] == 'ie'
   		page.driver.execute_script("document.getElementById('overridelink').click()")
    end
  end
  
  it "i can fine the homepage Sign Up button" do
  	#sleep 3
   	#click_button 'login'
   	#find(:xpath, "//*[@id='login']").click()
   	find_link('login').click()
   	fill_in 'signinEmail', :with => 'example@admin.com'


  end  
end