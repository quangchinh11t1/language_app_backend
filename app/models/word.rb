class Word < ApplicationRecord
  belongs_to :lesson

  WORD_PARAMS = %i(word phonetic mean level).freeze

  validates :word, presence: true,
    length: {minimum: 0,
             maximum: 50}
  validates :phonetic, presence: true,
    length: {minimum: 0,
             maximum: 50}
  validates :mean, presence: true,
    length: {minimum: 0,
             maximum: 50}
  validates :level, presence: true,
    length: {minimum: 1,
             maximum: 5}
end
