module MarkupModel
  class Engine < Rails::Engine
    initializer "markup_model.config" do
      MarkupModel.config.content_directory ||= Rails.root + "content"
    end
  end
end