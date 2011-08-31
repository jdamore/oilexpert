When /^I logout$/ do
  on WelcomePage do |page|
    page.logout
  end
end