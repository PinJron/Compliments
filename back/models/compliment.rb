class Compliment < ActiveRecord::Base
  # validates_presence_of :name
  validates :name, presence: true, length: { minimum: 10 }
  # attribute :is_used, :boolean, default: false
  before_create :set_is_used

  private

  def set_is_used
    self.is_used ||= false
  end
end
