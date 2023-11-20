require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get root" do
    get home_path
    assert_response :success
    assert_select "title", "Test Pioneer"
  end
  
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Test Pioneer"
  end

  test "should get interview" do
    get interview_path
    assert_response :success
    assert_select "title", "Interview | Test Pioneer"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Test Pioneer"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Test Pioneer"
  end

end