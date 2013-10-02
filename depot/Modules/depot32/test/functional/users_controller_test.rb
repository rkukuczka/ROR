require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @input_attributes_good = {
        name: "sam",
        password: 'secret',
        password_confirmation: 'secret'
    }

    @input_attributes_bad = {
        name: "sam",
        password: 'secret',
        password_confirmation: 'secret'
    }

    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @input_attributes_good
    end

    assert_redirected_to users_path
  end

  test "should not create user" do
    assert_difference('User.count', 0) do
      post :create, user: @input_attributes_bad
    end

    assert_redirected_to new_user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: @input_attributes_good

    assert_redirected_to users_path
  end

  test "should not update user" do

    assert_difference 'User.count', 0, "Should not be added" do
      put :update, id: @user, user: @input_attributes_bad
    end

    assert_redirected_to new_user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
