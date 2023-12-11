class AddToolSectionIdToTools < ActiveRecord::Migration[7.0]
  def change
    # add_reference :tools, :tool_section, null: false, foreign_key: true
  end
end
