class User <  ApplicationRecord
  has_many :compliments
  # validates_presence_of :name
  validates :name, presence: true
  validates :password, presence: true, length: { in: 6..20 }
  # attribute :role_id, :integer, default: 0
  before_create :set_role_id
  # before_create :maybe_assign_id
  has_secure_password

  # def maybe_assign_id
  #   self.id = SecureRandom.uuid if self.id.blank?
  # end

  def admin?
    role_id == 1
  end

  private

  def set_role_id
    self.role_id ||= 0
  end

end
