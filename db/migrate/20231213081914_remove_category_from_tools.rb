class RemoveCategoryFromTools < ActiveRecord::Migration[7.0]
  def change
    remove_column :tools, :category, :string
  end
end
