require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end



  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product1" do
    assert_difference('Product.count') do
      post :create, product: { description: @product1.description, image_url: @product1.image_url, price: @product1.price, title: @product1.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product1
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product1, product: { description: @product1.description, image_url: @product1.image_url, price: @product1.price, title: @product1.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    product3 = Product.create!(:title => "t", :image_url => "Rails.png", :price => 1)
    assert_difference('Product.count', -1) do
      delete :destroy, id: product3.id
    end

    assert_redirected_to products_path
  end
end
