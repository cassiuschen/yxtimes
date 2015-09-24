require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :title => "Title",
        :author => "Author",
        :uploader => "Uploader",
        :des => "Des",
        :content => "MyText"
      ),
      Article.create!(
        :title => "Title",
        :author => "Author",
        :uploader => "Uploader",
        :des => "Des",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Uploader".to_s, :count => 2
    assert_select "tr>td", :text => "Des".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
