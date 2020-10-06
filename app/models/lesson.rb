class Lesson < ApplicationRecord
  belongs_to :course
  has_many :logs, dependent: :nullify
end
