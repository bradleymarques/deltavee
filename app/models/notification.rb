class Notification < ApplicationRecord
  has_rich_text :content

  belongs_to :sender, class_name: User.name, required: true
  belongs_to :recipient, class_name: User.name, required: true
end
