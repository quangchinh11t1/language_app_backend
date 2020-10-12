class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :phonetic
      t.string :mean
      t.string :note

      t.timestamps
    end
  end
end
