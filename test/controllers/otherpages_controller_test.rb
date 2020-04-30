require 'test_helper'

class OtherpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get otherpages_show_url
    assert_response :success
  end

end
