class LoginPage < BasePage

  expected_element :td, {:text =>'Login'}, 3

  link :register, :id => 'register'

end