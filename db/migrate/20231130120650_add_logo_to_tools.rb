class AddLogoToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :logo_path, :string
  end
end
