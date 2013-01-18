require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
include NavigationHelpers

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end