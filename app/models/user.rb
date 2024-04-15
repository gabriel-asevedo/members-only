class User < ApplicationRecord

  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, format: {
    with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/,
    message: "must be at least 6 characters long, contain at least one uppercase letter, one lowercase letter, one number and one symbol"
  }

  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 25 }

end
