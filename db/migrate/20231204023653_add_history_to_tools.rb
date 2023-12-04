class AddHistoryToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :history, :text
  end
end
