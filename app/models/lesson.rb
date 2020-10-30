class Lesson < ApplicationRecord
  belongs_to :course
  has_many :logs, dependent: :nullify
  has_many :words, dependent: :nullify

  LESSON_PARAMS = %i(name desc).freeze

  validates :name, presence: true,
    length: {minimum: 1,
             maximum: 25}
  validates :desc, presence: true,
    length: {minimum: 1,
             maximum: 25}
end
