class WelcomePage < BasePage

  expected_element :table, {:id => 'welcome'}, 3

  button :logout, :id => 'logout'

end