class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc

  belongs_to :user
end
