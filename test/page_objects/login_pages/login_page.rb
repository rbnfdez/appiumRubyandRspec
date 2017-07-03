
class LoginPage < BasePage

# Elements

  def first_page
    go_to_login_button = nil
    Utils.new.retry_until_true{
      go_to_login_button = find_element_by_id('go_to_login')
      !go_to_login_button.nil?
    }
    raise "button is not present" if go_to_login_button == false
    go_to_login_button.click 
  end

  def login_input
    find_element_by_id('email')
  end

  def password_input
    find_element_by_id('password')
  end

  def login_button
    find_element_by_id('login')
  end

  def do_login(email,password)
    first_page
    login_input.send_keys email
    password_input.send_keys password
    login_button.click
  end

end  
