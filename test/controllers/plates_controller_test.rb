require 'test_helper'

class PlatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plates_index_url
    assert_response :success
  end

  test "should get show" do
    get plates_show_url
    assert_response :success
  end

end
