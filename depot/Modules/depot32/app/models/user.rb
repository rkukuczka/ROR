class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  validates :name, presence: true, uniqueness: true
  has_secure_password

  after_destroy :ensure_admin_remains

  def ensure_admin_remains
    if User.count.zero?
      raise "Can't delete the last user"
    end
  end

end
