#require '../config/environment.rb'
require File.expand_path('../../config/environment', __FILE__)

Product.transaction do
  (1..100).each do |i|
    Product.create!(title: "Title title2 #{i}", description: "#{i} Main Street",
                 image_url: "rails.png", price: 2)
  end
end

