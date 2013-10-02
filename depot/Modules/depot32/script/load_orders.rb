#require '../config/environment.rb'
require File.expand_path('../../config/environment', __FILE__)

Order.transaction do
  (1..100).each do |i|
    Order.create!(name: "Customer #{i}", address: "#{i} Main Street",
                 email: "customer-#{i}@example.com", pay_type: "check")
  end
end

