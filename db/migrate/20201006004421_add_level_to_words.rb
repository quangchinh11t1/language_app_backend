class AddLevelToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :level, :string
  end
end
