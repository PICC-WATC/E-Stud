require "test_helper"

describe Choice do
  let(:choice) { Choice.new }

  it "must be valid" do
    value(choice).must_be :valid?
  end
end
