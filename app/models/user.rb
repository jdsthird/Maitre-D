class User < ActiveRecord::Base
  has_many :events, foreign_key: :host_id

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_hash

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(raw_password)
    @password = BCrypt::Password.create(raw_password)
    self.password_hash = @password
  end

  def authenticate(raw_password)
    password == raw_password
  end
end
