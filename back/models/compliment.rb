class Compliment < ActiveRecord::Base
  # validates_presence_of :name
  validates :name, presence: true
  # attribute :is_used, :boolean, default: false
end
