When /^I log in$/ do
  login(@user.email, @user.password)
end

Given /^I am logged in$/ do
  @user = User.create!(:email => 'hej@test.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')
  login(@user.email, @user.password)
end

Given /^I, "(.*?)", is logged in$/ do |email|
  @user = User.create!(:email => email, :password => 'abcd1234', :password_confirmation => 'abcd1234')
  login(@user.email, @user.password)
end

Given /^I, "(.*?)", have an account$/ do |email|
  @user = User.create!(:email => email, :password => 'abcd1234', :password_confirmation => 'abcd1234')
end

Then /^I should get the message "(.*?)"$/ do |message|
  page.should have_content(message)
end

Given /^I log out$/ do
  click_link('log_out')
end