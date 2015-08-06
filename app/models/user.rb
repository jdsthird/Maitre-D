class User < ActiveRecord::Base
  has_many :events, foreign_key: :host_id

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :password_hash
end
