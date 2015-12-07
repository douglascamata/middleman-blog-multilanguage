activate :i18n

activate :blog do |blog|
  blog.permalink = "{title}.html"
  blog.sources = "articles/{title}.html"
end

activate :multilanguage_blog

