class Author < ActiveRecord::Base
  attr_accessible :age, :name

  has_many :aticles

end
