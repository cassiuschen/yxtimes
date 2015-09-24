require 'rails_helper'

RSpec.describe "votes/index", type: :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Vote.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
