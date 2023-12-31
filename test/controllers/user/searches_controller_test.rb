require "test_helper"

class User::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get user_searches_search_url
    assert_response :success
  end

  test "should get index" do
    get user_searches_index_url
    assert_response :success
  end
end
