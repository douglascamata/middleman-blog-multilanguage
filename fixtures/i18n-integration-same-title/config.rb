activate :i18n, lang_map: {
  en: ''
}

activate :blog do |blog|
  blog.permalink = "{lang}/{title}.html"
  blog.sources = "articles/{title}.{lang}.html"
end

activate :multilanguage_blog do |m|
  m.try_same_title = true
end
