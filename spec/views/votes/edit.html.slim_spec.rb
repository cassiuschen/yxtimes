require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input#vote_title[name=?]", "vote[title]"

      assert_select "textarea#vote_content[name=?]", "vote[content]"
    end
  end
end
