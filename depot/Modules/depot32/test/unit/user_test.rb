require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "There is one user" do
    assert  1 < User.count, "The was no users defined"
  end
end
