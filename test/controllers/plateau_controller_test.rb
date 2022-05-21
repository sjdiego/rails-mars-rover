require "test_helper"

class PlateauControllerTest < ActionDispatch::IntegrationTest
  test "should create a new plateau" do
    post plateau_create_url, params: {x: 5, y: 5}
    
    assert_response :success
  end
  
  test "should fail when no params are sent" do
    post plateau_create_url
    
    assert_response :unprocessable_entity
  end
  
  test "should fail when sent params are invalid" do
    post plateau_create_url, params: {x: "a", z: "0"}
    
    assert_response :unprocessable_entity
  end
end
