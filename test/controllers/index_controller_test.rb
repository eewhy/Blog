require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get index_users_url
    assert_response :success
  end

end
