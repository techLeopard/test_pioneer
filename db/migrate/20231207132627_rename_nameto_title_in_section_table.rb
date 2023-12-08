class RenameNametoTitleInSectionTable < ActiveRecord::Migration[7.0]

  def change
    rename_column :sections, :name, :title
  end
end
