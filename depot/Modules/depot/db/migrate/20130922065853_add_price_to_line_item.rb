class AddPriceToLineItem < ActiveRecord::Migration

  def up
    add_column :line_items, :price, :decimal

    LineItem.transaction do

      LineItem.all.each do |lineitem|
        lineitem.price = lineitem.product.price
        lineitem.save!
      end

    end

  end

  def down
    remove_column :line_items, :price
  end

end
