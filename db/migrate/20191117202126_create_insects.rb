class CreateInsects < ActiveRecord::Migration[5.2]
  def change
    create_table :insects do |t|
      t.bigint :category_id
      t.string :name
      t.text :details

      t.timestamps
    end
  end
end
