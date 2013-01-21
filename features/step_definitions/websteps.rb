require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
include NavigationHelpers

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end

Then /^I pause for (\d+) sec$/ do |time|
  sleep time.to_i
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, value, selector|
  with_scope(selector) do
    fill_in(field, :with => value)
  end
end

When /^(?:|I )press "([^"]*)"(?: within "([^"]*)")?$/ do |button, selector|
  with_scope(selector) do
    click_button(button)
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  query = URI.parse(current_url).query
  current_path = URI.parse(current_url).path
  path_with_query = current_path +"?" +query if query
  if path_with_query.respond_to? :should
    path_with_query.should == path_to(page_name)
  else
    assert_equal path_to(page_name), path_with_query
  end
end

Then /^show me the page$/ do
  save_and_open_page
end