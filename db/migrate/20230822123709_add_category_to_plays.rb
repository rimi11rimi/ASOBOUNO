class AddCategoryToPlays < ActiveRecord::Migration[6.1]
  def change
    add_column :plays, :category, :string
  end
end
