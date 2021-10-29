require 'rails_helper'

RSpec.describe Annotation, type: :model do
  context "validades presence and relationship" do
    it 'shold presence true' do
      should validate_presence_of :title
      should validate_presence_of :annotation
    end
  end
  
end
