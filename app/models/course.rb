class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :nullify

  COURSE_PARAMS = %i(name desc).freeze

  validates :name, presence: true,
    length: {minimum: 1,
             maximum: 25}
  validates :desc, presence: true,
    length: {minimum: 1,
             maximum: 25}
end
