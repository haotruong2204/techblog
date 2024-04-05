class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :content
      t.text :image_url
      t.string :seo_title
      t.text :seo_description
      t.string :slug

      t.timestamps
    end

    add_index :categories, :slug,                unique: true
  end
end
