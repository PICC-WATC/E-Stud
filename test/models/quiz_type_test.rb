require "test_helper"

describe QuizType do
  let(:quiz_type) { QuizType.new }

  it "must be valid" do
    value(quiz_type).must_be :valid?
  end
end
