class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.bigint :category_id
      t.string :name
      t.text :details

      t.timestamps
    end
  end
end
