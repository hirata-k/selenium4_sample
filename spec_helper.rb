require "rspec"
require_relative "example_driver"
  
RSpec.configure do |config|
  config.around(:example) do |example|
    @driver = ExampleDriver.new_driver
    begin
      example.run
    ensure
      @driver.quit
    end
  end
end
