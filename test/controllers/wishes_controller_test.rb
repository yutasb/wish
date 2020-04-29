require 'test_helper'

class WishesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wishes_new_url
    assert_response :success
  end

  test "should get index" do
    get wishes_index_url
    assert_response :success
  end

  test "should get show" do
    get wishes_show_url
    assert_response :success
  end

  test "should get edit" do
    get wishes_edit_url
    assert_response :success
  end

end
