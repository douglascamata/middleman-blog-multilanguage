require "middleman-core"
require "middleman-blog-multilanguage/version"

::Middleman::Extensions.register(:multilanguage_blog) do
    require "middleman-blog-multilanguage/extension"
    require "middleman-blog"
      ::Middleman::Blog::Multilanguage::Extension
end
