class AddListcourseToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :listcourse, :string
  end
end
