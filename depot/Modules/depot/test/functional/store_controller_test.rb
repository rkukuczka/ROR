require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should have for links" do
    get :index
    assert_response :success
    assert_select "#store #columns #side a", :minimum => 4
  end

  test "should have price formated" do
    get :index
    assert_response :success
    assert_select ".prize", /\$[,\d]+\.\d\d/
  end

end
