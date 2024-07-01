require "test_helper"

class SdetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sdet_index_url
    assert_response :success
  end
end
