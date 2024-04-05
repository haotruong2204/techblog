class AddSlugHtmlToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :slug_html, :string
  end
end
