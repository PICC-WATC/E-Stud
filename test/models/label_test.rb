require "test_helper"

describe Label do
  let(:label) { Label.new }

  it "must be valid" do
    value(label).must_be :valid?
  end
end
