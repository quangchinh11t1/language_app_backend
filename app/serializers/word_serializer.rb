class WordSerializer < ActiveModel::Serializer
  attributes :id, :word, :phonetic, :phonetic, :mean, :note, :level

  belongs_to :lesson
end
