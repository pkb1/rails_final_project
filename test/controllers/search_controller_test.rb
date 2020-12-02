require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search_student" do
    get search_search_student_url
    assert_response :success
  end

end
