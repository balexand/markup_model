require 'pry'
require 'markup_model'
require 'rspec'
require 'supermodel'

RSpec.configure do |config|
  config.before(:each) do
    MarkupModel.config.content_directory = File.expand_path("../content", __FILE__)
  end
end