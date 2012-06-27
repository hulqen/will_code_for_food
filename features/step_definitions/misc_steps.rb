Then /^show me the page$/ do
  save_and_open_page
end

Given /^I am on the "(.*?)" page$/ do |page_name|
  visit('/' + page_name.gsub(" ", "_"))
end

When /^I view "(.*?)"$/ do |link_name|
  click_link(link_name)
end

Then /^I should see "(.*?)"$/ do |what_to_see|
  page.should have_content(what_to_see)
end

