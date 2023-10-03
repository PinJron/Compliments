class Compliment < ApplicationRecord
  belongs_to :user

  scope :unused, -> { where(is_used: false) }
  scope :random_order, -> { order('RANDOM()') }

  validates :compliment_text, presence: true, length: { minimum: 10 }
  # attribute :is_used, :boolean, default: false
  before_create :set_defaults

  private

  def set_defaults
    self.is_used ||= false
    self.dislikes ||= 0
    self.likes ||= 0
  end
end
