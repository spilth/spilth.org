activate :directory_indexes

activate :syntax
ignore 'source/stylesheets/site.css.erb.scss'

activate :blog do |blog|
  blog.prefix = "blog"
  blog.layout = "post"
end

activate :middleman_simple_thumbnailer

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'spilth.org'
  s3_sync.acl    = 'public-read'
end

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

page "presentations/*", :layout => :presentation

