class User < ActiveRecord::Base
  # validates_presence_of :name
  validates :username, presence: true
  validates :password, presence: true, length: { in: 6..20 }
  # attribute :role_id, :integer, default: 0
  before_create :set_role_id
  has_secure_password

  def admin?
    role_id == 1
  end

  private

  def set_role_id
    self.role_id ||= 0
  end

end
