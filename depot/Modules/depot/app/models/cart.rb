class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items

  validate do

    items = line_items.group(:product_id).having("count(*)>?", 0)

    errors[:base] = "Cart contains duplicate products" if items.to_a.count > 0
  end

  def add_product(pid)
    current_item = line_items.where(product_id: pid).first


    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new
      current_item.product_id = pid
      current_item.price =  current_item.product.price
      current_item.quantity=1
      line_items << current_item
    end
    current_item
  end

  def total_prize
    line_items.to_a.sum{|item| item.product.price}
  end

end
