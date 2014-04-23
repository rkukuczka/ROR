class Author < ActiveRecord::Base
  attr_accessible :age, :name

  has_one :avatar
  accepts_nested_attributes_for :avatar, :reject_if => proc { |attributes| attributes['name'].blank? }
end
