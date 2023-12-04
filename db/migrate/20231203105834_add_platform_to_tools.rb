class AddPlatformToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :platform, :string
  end
end
