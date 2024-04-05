class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :slug
      t.integer :category_id
      t.string :cover_image
      t.integer :status, default: 1
      t.integer :view_count, default: 0
      t.integer :readtime
      t.string :seo_title
      t.text :seo_description
      t.integer :admin_id
      t.datetime :published_at
      
      t.timestamps
    end

    add_index :posts, :slug,                unique: true
  end
end
