PROJECT_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))
require 'middleman-core'
require "middleman-blog"
require 'middleman-core/step_definitions'
require 'pry'
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-blog-multilanguage')
