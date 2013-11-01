require 'bcrypt'

class User
  include Mongoid::Document

  # stores password, but then forgets it
  attr_accessor :password, :password_confirmation

  field :name, type: String
  field :email, type: String
  field :salt, type: String
  field :hashed_password, type: String

  # has_many :questions
  # has_many :tags
  # has_many :answers


  # This will tell us what regions to show on the map
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  # validates_length_of :password, in: 6..20, on: :create

  # before sent to database, save a hash of the password
  before_save :hash_password

  def authenticate(password)
    self.hashed_password ==
     BCrypt::Engine.hash_secret(password, self.salt)
  end

  private
  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password =
       BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end
end
