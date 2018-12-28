require "test_helper"

describe History do
  let(:history) { History.new }

  it "must be valid" do
    value(history).must_be :valid?
  end
end
