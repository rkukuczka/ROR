class Product < ActiveRecord::Base
  default_scope :order => :title

  has_many :line_items

  before_destroy :ensure_not_referenced_by_line_items

  attr_accessible :description, :image_url, :price, :title

  validates :title, :image_url, :presence => true
  validates :price, :numericality => {:greater_than => 0}
  validates :image_url, :format => {:with => %r{\.(gif|png|jpg)}i, :message => "Gif or Jpg or Png" }

  def ensure_not_referenced_by_line_items
          if line_items.count.zero?
            errors[:base] = "Cannot delete product referenced by items"
            return false
          else
            return true
          end
  end

end
