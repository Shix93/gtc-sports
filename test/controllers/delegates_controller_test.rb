require 'test_helper'

class DelegatesControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get delegates_:index_url
    assert_response :success
  end

end
