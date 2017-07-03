



# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # Include the needed gems
require 'rubygems'

require 'appium_lib'

require 'byebug'

Dir["./page_objects/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }

# Configure call to Appium Server

config.before(:all){
      desired_caps = {
         caps:  {
              platformName:    'Android',
              platformVersion:   '5.0',
              deviceName:      'Samsung',
              #browserName:     'Chrome',
              appActivity: 'com.redbooth.presentation.startup.StartupActivity',
              appPackage: 'com.redbooth.staging',
          }
      }

      # Create a new Appium specific driver with helpers availabe
      @appium_driver = Appium::Driver.new(desired_caps)

      # Standard Selenium driver without any Appium methods.
      # Need to convert to Selenium driver to make "get" call
      # since Appium doesn't support "get" method.
      @driver = @appium_driver.start_driver

      # Promote appium method to class instance methods
      # Without promoting we would need to make all calls with the @appium_driver, example:
      #   @appium_driver.find_element(:id, 'lst-ib')
      # After promoting to a class instance method we can the method directly, example:
      #   find_element(:id, 'lst-ib')
      Appium.promote_appium_methods Object
    }

    config.after(:all){
      @driver.quit
    }
end
