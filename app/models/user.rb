class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :username, uniqueness: true, length: { in: 5..128 }
  validates :email, uniqueness: true

  has_many :sent_notifications, class_name: Notification.name, foreign_key: :sender
  has_many :received_notifications, class_name: Notification.name, foreign_key: :recipient
end
