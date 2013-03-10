require 'rails/generators'

module MarkupModel
  module Generators
    class ModelGenerator < Rails::Generators::Base
      argument :class_name, :type => :string

      def method_name
        klass = class_name.constantize
        id = (klass.markup_model_files.map(&:id).map(&:to_i).max || 0) + 1
        path = "#{MarkupModel.config.content_directory}/#{klass.model_name.plural}/%03d.md" % id

        create_file path,
          "#{YAML.dump(klass.default_yaml_header.stringify_keys)}---\n\nType content here using *Markdown* or <em>HTML</em>."
      end
    end
  end
end