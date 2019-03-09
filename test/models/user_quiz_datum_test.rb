require "test_helper"

describe UserQuizDatum do
  let(:user_quiz_datum) { UserQuizDatum.new }

  it "must be valid" do
    value(user_quiz_datum).must_be :valid?
  end
end
