class Compliment < ActiveRecord::Base
  # validates_presence_of :name
  validates :name, presence: true, length: { minimum: 10 }
  # attribute :is_used, :boolean, default: false
end
