require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def new_product(image_url)
    p = Product.new
    p.title = "New Prod"
    p.price = 12
    p.image_url = image_url
    return p
  end

  test "product atts not empty" do
    p = Product.new
    assert p.invalid?
  end

  test "product formats are valid" do
    okay =  %w{image.png, image.gif, image.jpg}

    okay.each do  |name|
      assert new_product(name).valid?, "Product was invalid on a valid format"
    end
  end
end
