require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get root" do
    get static_pages_home_url
    assert_response :success
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | Test Pioneer"
  end

  test "should get interview" do
    get static_pages_interview_url
    assert_response :success
    assert_select "title", "Interview | Test Pioneer"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | Test Pioneer"
  end

end