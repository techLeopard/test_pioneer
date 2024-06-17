require "test_helper"

class FlowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flows_index_url
    assert_response :success
  end

  test "should get new" do
    get flows_new_url
    assert_response :success
  end

  test "should get show" do
    get flows_show_url
    assert_response :success
  end

  test "should get edit" do
    get flows_edit_url
    assert_response :success
  end
end
