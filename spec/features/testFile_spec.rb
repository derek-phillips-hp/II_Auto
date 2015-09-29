require 'spec_helper'
require './support/support.rb'

include Support

describe 'Testing the Landing Page' , :type => :feature do
  
  before :each do
  	launch_Landing_Page
  end
  
  it "i can fine the homepage Sign Up button" do
   	find('#login').click()

   	within_frame 'webauthPanelIFrame' do
		page.find('#signinEmail')
	end
  end  
end