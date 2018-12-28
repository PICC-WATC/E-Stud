require "test_helper"

describe Quiz do
  let(:quiz) { Quiz.new }

  it "must be valid" do
    value(quiz).must_be :valid?
  end
end
