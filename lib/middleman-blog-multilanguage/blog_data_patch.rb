module Middleman
  module Blog
    module Multilanguage
      module BlogDataPatch
        def manipulate_resource_list(resources)
          super
          # TODO: make multiblog compatible
          # FIXME: needs refactoring
          blog = @app.extensions[:blog].first[1].data
          has_same_title =  @app.extensions[:multilanguage_blog].try_same_title?
          blog.articles.each do |article|
            articles = @app.extensions[:multilanguage_blog].articles
            key = article.title.parameterize.to_sym
            if resource_has_same_title?(key, articles) and has_same_title
              articles[key] = [articles[key]] << article
            else
              articles[key] = article
            end
          end
        end

        def resource_has_same_title?(title_key, articles)
          not articles[title_key].nil?
        end
      end
    end
  end
end
