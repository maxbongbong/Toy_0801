class Contact < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :nullify
end
