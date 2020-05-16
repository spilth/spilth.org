# frozen_string_literal: true

activate :directory_indexes
activate :syntax

activate :blog do |blog|
  blog.prefix = 'blog'
  blog.layout = 'blog'
end

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

page 'presentations/*', layout: :presentation
