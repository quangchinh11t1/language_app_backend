class LessonSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc

  belongs_to :course
end
