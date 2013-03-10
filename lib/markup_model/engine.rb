module MarkupModel
  class Engine < Rails::Engine
    initializer "markup_model.config" do
      MarkupModel.config.content_directory ||= Rails.root + "content"
    end

    rake_tasks do
      load "markup_model/tasks.rake"
    end
  end
end