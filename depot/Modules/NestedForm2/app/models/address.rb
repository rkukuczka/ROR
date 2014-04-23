class Address < ActiveRecord::Base
  attr_accessible :kind, :street

  belongs_to :person
end
