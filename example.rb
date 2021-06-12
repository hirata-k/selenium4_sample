require "./spec_helper.rb"
  
describe "Google's Search Functionality" do
  it "can find search results" do
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "http://www.google.com"
  
    raise "Unable to load Google." unless @driver.title.include? "Google"
  
    query = @driver.find_element :name, "q"
    query.send_keys "シャノン"
    query.submit
  
    puts @driver.title
  end
end
