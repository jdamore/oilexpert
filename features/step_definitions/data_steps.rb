
Given /^There is a (.*) user$/ do |fixture_user_id|
  Fixtures::create_user fixture_user_id
end