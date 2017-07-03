class BasePage
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def find_element_by_id(id)
    driver.find_element(:id, "com.redbooth.staging:id/#{id}")
  end

  def get_footer
    find_element_by_id('footer_container')
    footer_menu = nil
    Utils.new.retry_until_true{
      footer_menu = find_element_by_id('footer_container')
      !footer_menu.nil?
    }
  end
end