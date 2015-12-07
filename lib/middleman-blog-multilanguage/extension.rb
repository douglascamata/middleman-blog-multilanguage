require 'middleman-blog-multilanguage/blog_data_patch'
require 'middleman-blog-multilanguage/resource_patch'

module Middleman
  module Blog
    module Multilanguage
      class Extension < ::Middleman::Extension
        option :templates, {}, 'Hash of link to translated versions'
        option :try_same_title, false, 'When fontmatter translated titles are not provided, look for articles with same title'

        attr_reader :templates
        attr_accessor :articles

        def initialize(app, options_hash={}, &block)
          super
          @articles = {}
          @templates = YAML.load_file(File.join(File.dirname(__FILE__), 'templates.yml'))
          @templates.merge!(options.templates)
          @try_same_title = options.try_same_title
        end

        def after_configuration
          patch_blog_data
          patch_resource
        end

        def try_same_title?
          @try_same_title
        end

        private
        def patch_blog_data
          ::Middleman::Blog::BlogData.prepend ::Middleman::Blog::Multilanguage::BlogDataPatch
        end

        def patch_resource
          ::Middleman::Sitemap::Resource.prepend ::Middleman::Blog::Multilanguage::ResourcePatch
        end
      end
    end
  end
end
