class CreateAnnotations < ActiveRecord::Migration[6.0]
  def change
    create_table :annotations do |t|
      t.string :title, null: false
      t.text :annotation, null: false
      t.date :date, null: false
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
