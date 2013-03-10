namespace :markup_model do
  desc "Reloads a markup model. Needs the CLASS environment variable."
  task :reload => :environment do
    raise "CLASS environment variable not set" unless ENV['CLASS'].present?
    klass = ENV['CLASS'].constantize
    klass.markup_model_reload
  end
end