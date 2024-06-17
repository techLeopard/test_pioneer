class AddDescriptionToFlows < ActiveRecord::Migration[7.0]
  def change
    add_column :flows, :description, :text
  end
end
