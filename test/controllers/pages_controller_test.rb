require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get aide" do
    get root_url
    assert_response :success
  end
  test "should get contact" do     
    get root_url
    assert_response :success
  end
end
