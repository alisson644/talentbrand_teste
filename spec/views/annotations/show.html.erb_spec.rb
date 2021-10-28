require 'rails_helper'

RSpec.describe "annotations/show", type: :view do
  before(:each) do
    @annotation = assign(:annotation, Annotation.create!(
      title: "Title",
      annotation: "MyText",
      priority: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
