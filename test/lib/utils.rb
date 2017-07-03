class Utils
  def retry_until_true(tries=5, delay=2)
      begin
        result = yield
        raise if result == false
        true
      rescue
        tries -= 1
        sleep(delay.to_i)
        retry if tries > 0 # restarts the 'begin' block
        false
      end
    end

  def wait_for(seconds=3)
    set_implicit_timeout(0)
    el = Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
    restablish_implicit_timeout_to_default
    el
  rescue
    restablish_implicit_timeout_to_default
    false
  end
end