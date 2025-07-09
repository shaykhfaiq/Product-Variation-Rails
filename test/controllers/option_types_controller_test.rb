require "test_helper"

class OptionTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get option_types_index_url
    assert_response :success
  end

  test "should get new" do
    get option_types_new_url
    assert_response :success
  end

  test "should get create" do
    get option_types_create_url
    assert_response :success
  end

  test "should get edit" do
    get option_types_edit_url
    assert_response :success
  end

  test "should get update" do
    get option_types_update_url
    assert_response :success
  end

  test "should get destroy" do
    get option_types_destroy_url
    assert_response :success
  end
end
