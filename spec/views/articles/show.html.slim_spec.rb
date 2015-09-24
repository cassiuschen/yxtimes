require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :title => "Title",
      :author => "Author",
      :uploader => "Uploader",
      :des => "Des",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Uploader/)
    expect(rendered).to match(/Des/)
    expect(rendered).to match(/MyText/)
  end
end
