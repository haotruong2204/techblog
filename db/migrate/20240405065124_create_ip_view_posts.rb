class CreateIpViewPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :ip_view_posts do |t|

      t.timestamps
    end
  end
end
