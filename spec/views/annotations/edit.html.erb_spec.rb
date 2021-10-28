require 'rails_helper'

RSpec.describe "annotations/edit", type: :view do
  before(:each) do
    @annotation = assign(:annotation, Annotation.create!(
      title: "MyString",
      annotation: "MyText",
      priority: 1
    ))
  end

  it "renders the edit annotation form" do
    render

    assert_select "form[action=?][method=?]", annotation_path(@annotation), "post" do

      assert_select "input[name=?]", "annotation[title]"

      assert_select "textarea[name=?]", "annotation[annotation]"

      assert_select "input[name=?]", "annotation[priority]"
    end
  end
end
