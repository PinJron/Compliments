class User < ActiveRecord::Base
  # validates_presence_of :name
  validates :username, presence: true
  validates :password, length: { in: 6..20 }
  # attribute :role_id, :integer, default: 0
  before_create :set_role_id
  has_secure_password

  private

  def set_role_id
    self.role_id ||= 0
  end
end
