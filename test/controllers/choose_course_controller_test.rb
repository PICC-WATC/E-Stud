require "test_helper"

describe ChooseCourseController do
  it "should get top" do
    get choose_course_top_url
    value(response).must_be :success?
  end

end
