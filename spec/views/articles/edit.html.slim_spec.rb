require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :title => "MyString",
      :author => "MyString",
      :uploader => "MyString",
      :des => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_author[name=?]", "article[author]"

      assert_select "input#article_uploader[name=?]", "article[uploader]"

      assert_select "input#article_des[name=?]", "article[des]"

      assert_select "textarea#article_content[name=?]", "article[content]"
    end
  end
end
