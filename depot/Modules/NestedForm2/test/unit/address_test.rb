require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "address belongs to person" do
     p = Person.new(name: "Misio")
     3.times { p.addresses.build(street: "rybna", kind: "N")}
     p.save!
  end


end
