require "json"
require "selenium-webdriver"
require "test/unit"

class BookStoreTest < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:3000/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end

  def test_book_store
    @driver.get(@base_url + "/login")
    @driver.find_element(:id, "name").clear
    @driver.find_element(:id, "name").send_keys "admin"
    @driver.find_element(:id, "password").clear
    @driver.find_element(:id, "password").send_keys "admin"
    @driver.find_element(:xpath, "(//input[@name='commit'])[2]").click
    @driver.find_element(:link, "Orders").click
    @driver.find_element(:link, "Users").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
