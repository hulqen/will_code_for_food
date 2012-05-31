When /^he logs in$/ do
  visit('/log_in')
  fill_in('email', :with => @user.email)
  fill_in('password', :with => @user.password)
  click_button('login')
end

Given /^the user "(.*?)" has an account$/ do |email|
  @user = User.create(:email => email, :password => 'abcd1234')
end

Then /^he should see "(.*?)"$/ do |welcome_message|
  page.has_content?('welcome_message')
end