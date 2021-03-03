class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :trackable


  has_one :address

  before_create :autofill_username

  private
  def autofill_username
    self.username = SecureRandom.alphanumeric(10)
  end
end
