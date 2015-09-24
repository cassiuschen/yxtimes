require 'rails_helper'

RSpec.describe "votes/new", type: :view do
  before(:each) do
    assign(:vote, Vote.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input#vote_title[name=?]", "vote[title]"

      assert_select "textarea#vote_content[name=?]", "vote[content]"
    end
  end
end
