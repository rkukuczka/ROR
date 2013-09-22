require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @p1 = products(:one)
    @p2 = products(:two)
    Cart.delete_all()
  end

  test "can create carts" do

    assert_difference('Cart.count') do
      cart = Cart.create
      li1 = LineItem.create
      li1.product = @p1
      li1.cart = cart
      li2 = LineItem.create
      li2.product = @p2
      li2.cart = cart
      @p2.delete
    end

  end

  test "cannot create carts with duplicate records" do

    assert_raise ActiveRecord::RecordInvalid do

      cart = Cart.create
      li = LineItem.new(:product => @p1)
      cart.line_items << li
      li = LineItem.new(:product => @p2)
      cart.line_items << li
      cart.save!

    end

  end

  test "cannot create carts with non-unique product" do

      cart = Cart.create
      li = LineItem.new(:product => @p1)
      cart.line_items << li
      li = LineItem.new(:product => @p1)
      cart.line_items << li

      assert !cart.valid?

      assert !cart.errors.full_messages.join.match(/.*duplicate/).nil?

  end

end
