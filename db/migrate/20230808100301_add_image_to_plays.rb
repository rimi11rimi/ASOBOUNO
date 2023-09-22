class AddImageToPlays < ActiveRecord::Migration[6.1]
  def change
    add_column :plays, :image, :string
  end
end
