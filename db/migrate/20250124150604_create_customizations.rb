class CreateCustomizations < ActiveRecord::Migration[7.2]
  def change
    create_table :customizations do |t|
      t.references :product, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
