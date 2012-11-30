class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  before_create :create_username

  has_many :characters

  def to_param
    username
  end

  private
    def create_username
      self.username = email.gsub(/@\w{1,}\.\D{1,4}/, '')
    end
end
