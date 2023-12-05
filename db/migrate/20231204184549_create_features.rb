class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.text :description
      t.references :tool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
