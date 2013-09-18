class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :title, :image_url, :presence => true
  validates :price, :numericality => {:greater_than => 0}
  validates :image_url, :format => {:with => %r{\.(gif|png|jpg)}i, :message => "Gif or Jpg or Png" }
end
