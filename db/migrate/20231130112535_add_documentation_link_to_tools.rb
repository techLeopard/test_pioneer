class AddDocumentationLinkToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :documentation_link, :string
  end
end
