class Person < ActiveRecord::Base
  attr_accessible :name, :addresses_attributes

  has_many :addresses
  accepts_nested_attributes_for :addresses, :allow_destroy => true
end
