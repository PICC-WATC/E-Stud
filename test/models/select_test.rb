require "test_helper"

describe Select do
  let(:select) { Select.new }

  it "must be valid" do
    value(select).must_be :valid?
  end
end
