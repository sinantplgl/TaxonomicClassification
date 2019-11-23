class AddImageToInsects < ActiveRecord::Migration[5.2]
  def change
    add_column :insects, :image, :string
  end
end
