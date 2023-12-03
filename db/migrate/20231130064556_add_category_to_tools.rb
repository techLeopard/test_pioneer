class AddCategoryToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :category, :string
  end
end
