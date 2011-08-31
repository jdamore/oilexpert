When /^I click on Register$/ do
  on LoginPage do |page|
    page.register
  end
end

When /^I register with username "(.*)" and password "(.*)" and email "(.*)"$/ do |username, password, email|
  on RegisterPage do |page|
    page.name = username
    page.password = password
    page.confirm_password = password
    page.email = email
    page.register
  end
end

When /^I register with (.*) user$/ do |fixture_user_id|
  user = Fixtures::get_user fixture_user_id
  Given 'I am on the HomePage page'
  When 'I click on Register'
  Then 'I should see the RegisterPage page'
  And "I register with username \"#{user[:username]}\" and password \"#{user[:password]}\" and email \"#{user[:email]}\""
end

Then /^I should see the registration error messages for field (.*):$/ do |field_name, exp_error|
  on RegisterPage do |page|
    page.error_message_for(field_name).should == exp_error
  end
end

When /^I go back to the Login screen$/ do
  on RegisterPage do |page|
    page.login
  end
end

Then /^I should not see any registration error messages for fields:$/ do |field_names_table|
  on RegisterPage do |page|
    field_names_table.raw.each do |field_name|
      page.error_div_for(field_name).exists?.should_not be_true
    end
  end
end