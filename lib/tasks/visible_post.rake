namespace :visible_post do
  desc "Visible Post"

  task execute: :environment do
    Post.where("published_at < ? AND status = ?", Time.zone.now, 1).update_all(status: :visible)
  end
end
