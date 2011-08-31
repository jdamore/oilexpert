
Before do |scenario|
  Browser::browser.clear_cookies
end

After do |scenario|
  handle_failed_scenario(scenario)
  delete_test_data
end

at_exit do
  Browser.close?
end


private
def handle_failed_scenario(scenario)
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  Browser.browser.driver.save_screenshot("./screenshots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png") if scenario.failed?
  Browser.keep_open = true if scenario.status == :pending or scenario.status == :undefined or scenario.status == :failed
end

private
def delete_test_data
  Fixtures::delete_users
end