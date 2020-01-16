class Refill < ApplicationRecord
  belongs_to :user
  attr_accessor :current_user

  def initialize(params)
    super

    @current_user = params[:user]
    chromedriver_path = File.join(File.absolute_path(File.dirname(__FILE__)), "chromedriver")
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    @driver ||= Selenium::WebDriver.for :chrome, options: options
  end

  def default_refill_amounts
    [5, 10, 15, 20]
  end

  def execute
    # navigate to start page
    @driver.navigate.to 'https://charliecard.mbta.com/CharlieCardWebProgram/pages/charlieCardCenter.jsf'
    # go to login form
    @driver.find_element(:id, 'main_form:_idJsp70').click
    username = @driver.find_element(:id, 'main_form:Email')
    password = @driver.find_element(:id, 'main_form:Password')

    # # add creds for login
    if username && password
      username.send_keys(@current_user.email)
      password.send_keys(@current_user.charlie_card_password)
    end

    # # submit login form
    @driver.find_element(:id, 'main_form:_idJsp78').click

    # # # select add stored value button
    @driver.find_element(:id, 'contentMenu_form:_idJsp68').click
    charlie_cards = @driver.find_elements(:css, 'select.listBox option')
    charlie_cards[0].click

    # resize the window and take a screenshot
    @driver.manage.window.resize_to(800, 800)
    @driver.save_screenshot 'test-screenshot.png'
  end

end
