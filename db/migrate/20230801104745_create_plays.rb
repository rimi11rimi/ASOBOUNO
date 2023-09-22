class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.string :title
      t.text :body
      t.string :scene
      t.string :time
      t.string :price
      t.string :address

      t.timestamps
    end
  end
end
