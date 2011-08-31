

Given /^I am on the (.*) page$/ do |page_class|
  visit Kernel.const_get(page_class)
end

Then /^I should see the (.*) page$/ do |page_class|
  on Kernel.const_get(page_class) do
  end
end
