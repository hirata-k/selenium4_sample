require "selenium/webdriver"
  
module ExampleDriver
  class << self
    def endpoint
      "http://localhost:4444/wd/hub"
    end

    def browser
      :firefox
    end

    def options
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('start-maximized')
      options.add_argument('disable-infobars')
      options.add_argument('disable-gpu')
      options.add_argument('privileged')
      options.add_argument('ignore-certificate-errors')
      options.add_argument('no-default-browser-check')
      options
    end

    def caps
      caps = Selenium::WebDriver::Remote::Capabilities.chrome
      caps
    end
  
    def new_driver
      if browser == :firefox
        driver = Selenium::WebDriver.for :remote, url: endpoint, capabilities: :firefox
      else
        driver = Selenium::WebDriver.for :remote, url: endpoint, capabilities: [caps, options]
      end

    end
  end
end

