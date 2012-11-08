require "active_support/concern"
require "markup_model/config"
require "markup_model/model_file"
require "markup_model/version"

require "markup_model/engine" if defined?(Rails)

module MarkupModel
  extend ActiveSupport::Concern

  @@config = Config.new

  def self.config
    @@config
  end

  module ClassMethods
    def markup_model_cleanup
      ids = Set.new markup_model_files.map(&:id)

      all.each do |model|
        model.destroy unless ids.include?(model.id.to_s)
      end
    end

    def markup_model_files
      Dir.glob("#{MarkupModel.config.content_directory}/#{model_name.plural}/*.md").map do |file|
        ModelFile.new(file)
      end
    end

    def markup_model_reload
      markup_model_cleanup
      markup_model_update
    end

    def markup_model_update
      markup_model_files.each do |file|
        model = find_by_id(file.id) || new.tap { |m| m.id = file.id }
        model.id = file.id
        model.content = file.content
        file.attributes.each do |k,v|
          model.public_send("#{k}=", v)
        end
        model.save!
      end
    end
  end
end
