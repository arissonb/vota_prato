require 'test_helper'

class RestaurantesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurantes_index_url
    assert_response :success
  end

end
