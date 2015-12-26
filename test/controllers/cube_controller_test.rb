require 'test_helper'

class CubeControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get load" do
    get :load
    assert_response :success
  end

end
