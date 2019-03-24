require "test_helper"

describe Info do
  let(:info) { Info.new }

  it "must be valid" do
    value(info).must_be :valid?
  end
end
