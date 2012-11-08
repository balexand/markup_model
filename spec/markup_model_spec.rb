require 'spec_helper'

class Post < SuperModel::Base
  include MarkupModel
end

describe MarkupModel do
  before(:each) do
    Post.delete_all
  end

  it "should cleanup models" do
    ["1", 2, 3].each { |id| Post.create id: id }
    Post.all.map(&:id).should == ["1", 2, 3]
    Post.markup_model_cleanup
    Post.all.map(&:id).should == ["1", 2]
  end

  it "should update models" do
    Post.markup_model_update
    Post.count.should == 2

    first = Post.first
    first.id.should == "1"
    first.content.should == "Content for number 1"
    first.title.should == "Foo Bar"

    second = Post.last
    second.id.should == "2"
    second.content.should == "Content for number 2"
  end

  it "should not define a config method on the model" do
    expect do
      Post.config
    end.to raise_exception(NoMethodError)
  end
end