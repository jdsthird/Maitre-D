class User < ActiveRecord::Base
  has_many :events, foreign_key: :host_id

  validates_presence_of :first_name, message: "-- Please be sure to provide your given name."
  validates_presence_of :last_name, message: "-- Please provide your sir name."
  validates_presence_of :email, message: "-- If you don\'t mind\, we require your email address as well."
  validates_presence_of :username, message: "-- Please provide a username so you may revisit and update your information."
  validates_uniqueness_of :username, message: "-- We're terribly sorry, but that username is spoken for."
  validates_presence_of :password_hash, message: "-- Please provide a password so for future access to the site."

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

  def full_name
    "#{first_name} #{last_name}"
  end
end
