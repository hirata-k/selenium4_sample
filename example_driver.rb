require "selenium/webdriver"
  
module ExampleDriver
  class << self
    def endpoint
      "http://localhost:4444/wd/hub"
    end

    def browser
      (ENV['browser'] || 'chrome').to_sym
    end

    def options
      browser_str = browser.to_s
      self.send("#{browser_str}_options")
    end

    def chrome_options
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('start-maximized')
      options.add_argument('disable-infobars')
      options.add_argument('disable-gpu')
      options.add_argument('privileged')
      options.add_argument('ignore-certificate-errors')
      options.add_argument('no-default-browser-check')
      options
    end

    def edge_options
      options = Selenium::WebDriver::Edge::Options.new
      options.add_argument('start-maximized')
      options.add_argument('disable-infobars')
      options.add_argument('disable-gpu')
      options.add_argument('privileged')
      options.add_argument('ignore-certificate-errors')
      options.add_argument('no-default-browser-check')
      options
    end

    def firefox_options
      options = Selenium::WebDriver::Firefox::Options.new
      options
    end

    def caps
      browser_str = browser.to_s
      caps = Selenium::WebDriver::Remote::Capabilities.send(browser_str)
      caps
    end
  
    def new_driver
      driver = Selenium::WebDriver.for :remote, url: endpoint, capabilities: [caps, options]
    end
  end
end

