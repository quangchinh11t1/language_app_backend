class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :nullify
end
