class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :authorname
      t.string :publicationname
      t.integer :quantity
      t.integer :price
    end
  end
end