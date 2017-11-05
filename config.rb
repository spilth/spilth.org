activate :directory_indexes
activate :syntax

activate :blog do |blog|
  blog.prefix = 'blog'
  blog.layout = 'blog'
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'spilth.org'
  s3_sync.acl    = 'public-read'
end

ignore 'source/stylesheets/site.css.erb.scss'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

page 'presentations/*', layout: :presentation

