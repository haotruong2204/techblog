# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://haotruong.dev"

SitemapGenerator::Sitemap.create do
  add root_path
  add posts_path
end
