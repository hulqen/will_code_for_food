require 'test_helper'

class SlProductRowControllerTest < ActionController::TestCase
  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
