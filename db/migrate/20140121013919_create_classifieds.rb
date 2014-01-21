class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :name
      t.string :description
      t.string :phone
      t.string :seller
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
