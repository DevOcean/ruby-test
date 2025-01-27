class CreateOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :options do |t|
      t.string :name
      t.integer :stock
      t.references :part, null: false, foreign_key: true

      t.timestamps
    end
  end
end
