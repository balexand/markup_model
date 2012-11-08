module MarkupModel
  class ModelFile
    attr_reader :path

    def initialize(path)
      @attributes = nil
      @path = path
    end

    def attributes
      read_attributes
      @attributes
    end

    def content
      read_attributes
      @content
    end

    def id
      File.basename(path).sub(/\.md$/i, "").sub(/^0*/, "")
    end

  private
    def read_attributes
      unless @attributes
        if File.read(path) =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
          @content = $'
          @attributes = YAML.load($1) || {}
        else
          raise "File '#{path}' has the wrong format. It should contain Markdown with a YAML header."
        end
      end
    end
  end
end