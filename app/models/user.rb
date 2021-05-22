class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :username, uniqueness: true, length: { in: 5..128 }
  validates :email, uniqueness: true

  validates_inclusion_of :has_signed_in_at_least_once, in: [true, false]

  enum role: {
    player: 0,
    admin: 10
  }
end
