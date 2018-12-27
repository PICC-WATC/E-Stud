require "test_helper"

describe CourseController do
  it "should get top" do
    get course_top_url
    value(response).must_be :success?
  end

end
