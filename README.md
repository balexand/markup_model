# MarkupModel

Loads ActiveModel records from Markdown files (with YAML headers). This allows you to keep records in your git repository then load them into your DB for querying as a deploy task.

## Installation

Add this line to your application's Gemfile and run `bundle install`:

    gem 'markup_model'

## Usage

Create a model like this:

```ruby
class Post < ActiveRecord::Base
  include MarkupModel

  validates :content, :published_at, :title, presence: true

  def self.default_yaml_header
    {
      published_at: Time.zone.now,
      title: "New Post",
    }
  end
end
```

Then generate a Markdown file for the model by running:

```
rails g markup_model:model Post
```

After you finish editing the file, update the records in your DB:

```
rake markup_model:reload CLASS=Post
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
