class User < ActiveRecord::Base
  # validates_presence_of :name
  validates :username, presence: true
end
