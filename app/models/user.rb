class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :username, uniqueness: true, length: { in: 5..128 }
  validates :email, uniqueness: true

  validates_inclusion_of :has_signed_in_at_least_once, in: [true, false]

  has_many :sent_notifications, class_name: Notification.name, foreign_key: :sender
  has_many :received_notifications, class_name: Notification.name, foreign_key: :recipient

  has_many :fleets, foreign_key: :owned_by
  has_many :spaceships, foreign_key: :owned_by

  enum role: {
    player: 0,
    admin: 10
  }
end
