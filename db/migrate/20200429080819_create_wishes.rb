class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :description
      t.text :description_link1
      t.text :description_link2
      t.text :description_link3
      t.text :description_img1
      t.text :description_img2
      t.text :description_img3

      t.timestamps
    end
  end
end
