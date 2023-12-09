class AddPositionIdToSection < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :position_id, :integer, null: false
  end
end
