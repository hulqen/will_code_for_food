class CustomProduct < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user

  validates_presence_of :name
  # validates_uniqueness_of :name

end
