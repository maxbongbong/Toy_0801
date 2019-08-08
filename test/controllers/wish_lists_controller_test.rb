require 'test_helper'

class WishListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wish_lists_index_url
    assert_response :success
  end

  test "should get create" do
    get wish_lists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wish_lists_destroy_url
    assert_response :success
  end

end
