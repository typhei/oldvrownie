class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :number
      t.string :title
      t.string :url
      t.string :image
      t.string :body

      t.timestamps null: false
    end
  end
end
