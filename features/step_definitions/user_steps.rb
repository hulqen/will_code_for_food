When /^the user logs in$/ do
  login(@user.email, @user.password)
end

Given /^the user "(.*?)" has an account$/ do |email|
  @user = User.create!(:email => email, :password => 'abcd1234', :password_confirmation => 'abcd1234')
end

Then /^the user should see "(.*?)"$/ do |message|
  page.should have_content(message)
end

Given /^the user "(.*?)" is logged in$/ do |email|
  @user = User.create!(:email => email, :password => 'abcd1234', :password_confirmation => 'abcd1234')
  login(@user.email, @user.password)
end

Given /^the user logs out$/ do
  click_link('log_out')
end