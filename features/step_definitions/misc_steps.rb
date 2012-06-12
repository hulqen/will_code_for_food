Then /^show me the page$/ do
  save_and_open_page
end

Given /^I am on the "(.*?)" page$/ do |page_name|
  # page_name = page_name.to_param

  visit('/' + page_name.gsub(" ", "_"))
end

When /^I view "(.*?)"$/ do |link_name|
  click_link(link_name)
end

