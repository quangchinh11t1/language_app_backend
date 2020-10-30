class AddLessonRefToWords < ActiveRecord::Migration[6.0]
  def change
    add_reference :words, :lesson, foreign_key: true
  end
end
