class RegisterPage < BasePage

  expected_element :td, {:text =>'Register'}, 3

  text_field :name, :id => 'user_name'
  text_field :email, :id => 'user_email'
  text_field :password, :id => 'user_password'
  text_field :confirm_password, :id => 'user_password_confirmation'
  button :register, :id =>'register'
  link :login, :id =>'login'
  div :user_name_errors, :id => 'name_errors'

  def error_message_for field_name
    error_div_for(field_name).when_present(5).text
  end

  def error_div_for field_name
    @browser.div(:id => "#{field_name}-errors")
  end

end