require 'rails_helper'

RSpec.describe "annotations/new", type: :view do
  before(:each) do
    assign(:annotation, Annotation.new(
      title: "MyString",
      annotation: "MyText",
      priority: 1
    ))
  end

  it "renders new annotation form" do
    render

    assert_select "form[action=?][method=?]", annotations_path, "post" do

      assert_select "input[name=?]", "annotation[title]"

      assert_select "textarea[name=?]", "annotation[annotation]"

      assert_select "input[name=?]", "annotation[priority]"
    end
  end
end
