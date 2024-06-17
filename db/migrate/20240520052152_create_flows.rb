class CreateFlows < ActiveRecord::Migration[7.0]
  def change
    create_table :flows do |t|
      t.string :title
      t.boolean :completed

      t.timestamps
    end
  end
end
