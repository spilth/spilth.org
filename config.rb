activate :directory_indexes

activate :blog do |blog|
  blog.prefix = "blog"
end

configure :build do

end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'spilth.org'
  s3_sync.acl    = 'public-read'
end
