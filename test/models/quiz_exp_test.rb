require "test_helper"

describe QuizExp do
  let(:quiz_exp) { QuizExp.new }

  it "must be valid" do
    value(quiz_exp).must_be :valid?
  end
end
