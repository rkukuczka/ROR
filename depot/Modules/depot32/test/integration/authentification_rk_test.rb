require 'test_helper'

class AuthentificationRkTest < ActionDispatch::IntegrationTest
  test "logging in with valid username and password" do
    User.create!(:name => "user1", :password => "user1")
    visit login_url
    fill_in "name", :with => "user1"
    fill_in "password", :with => "user1"
    click_button "Login"
    assert_contain "Welcome"
  end
end
