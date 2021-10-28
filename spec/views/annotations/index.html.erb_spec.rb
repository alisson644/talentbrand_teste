require 'rails_helper'

RSpec.describe "annotations/index", type: :view do
  before(:each) do
    assign(:annotations, [
      Annotation.create!(
        title: "Title",
        annotation: "MyText",
        priority: 2
      ),
      Annotation.create!(
        title: "Title",
        annotation: "MyText",
        priority: 2
      )
    ])
  end

  it "renders a list of annotations" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
