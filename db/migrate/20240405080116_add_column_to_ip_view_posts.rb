class AddColumnToIpViewPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :ip_view_posts, :ip_address, :string
    add_column :ip_view_posts, :post_id, :integer
  end
end
