class CreatePracticalTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :practical_tasks do |t|
      t.string :title
      t.text :content
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
