class Article < ActiveRecord::Base
  attr_accessible :desc, :title

  belongs_to  :author, :foreign_key => :author_long_id
end
