module Middleman
  module Blog
    module Multilanguage
      module ResourcePatch
        def link_to_translated(lang)
          translated_post = get_post_in(lang)
          translated_link_message(translated_post, lang) if translated_post
        end

        private
        def get_post_in(lang)
          translations = metadata[:page]['translation']
          if translations
            translated_title = translations[lang.to_s] or ''
            translated_post = translated_article(translated_title)
          elsif @app.extensions[:multilanguage_blog].try_same_title?
            translated_post = try_same_title
          end
        end

        def translated_link_message(translated_post, lang)
          link_template = "<a href=\"%{url}\">%{message}</a>"
          message = @app.extensions[:multilanguage_blog].templates[lang]
          return link_template % { url: translated_post.url, message: message }
        end

        def translated_article(translated_title)
          articles = @app.extensions[:multilanguage_blog].articles
          articles[translated_title.parameterize.to_sym]
        end

        def try_same_title
          articles = @app.extensions[:multilanguage_blog].articles
          key = title.parameterize.to_sym
          return if not articles[key].is_a? Array
          articles[key].select {|article| article.lang != lang}[0]
        end
      end
    end
  end
end
