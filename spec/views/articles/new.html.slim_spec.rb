require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :title => "MyString",
      :author => "MyString",
      :uploader => "MyString",
      :des => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_author[name=?]", "article[author]"

      assert_select "input#article_uploader[name=?]", "article[uploader]"

      assert_select "input#article_des[name=?]", "article[des]"

      assert_select "textarea#article_content[name=?]", "article[content]"
    end
  end
end
