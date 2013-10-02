class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type, :id, :created_at, :updated_at

  has_many :line_items, dependent: :destroy

  PAYMENTS_TYPES = %w{cash, paypal, check}

  validates :email, :presence =>true
  validates :pay_type, :inclusion => Order::PAYMENTS_TYPES

  def add_order_from_cart(cart)
      cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
      end
  end
end
