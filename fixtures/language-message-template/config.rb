activate :blog do |blog|
  blog.permalink = "{title}.html"
  blog.sources = "articles/{title}.html"
end

activate :multilanguage_blog do |m|
  m.templates[:pt_br] = 'Deseja ler em portugues do brasil?'
end

