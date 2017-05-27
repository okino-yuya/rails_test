require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get create" do
    get pages_create_url
    assert_response :success
  end

  test "should get post" do
    get pages_post_url
    assert_response :success
  end

  test "should get login" do
    get pages_login_url
    assert_response :success
  end

  test "should get logout" do
    get pages_logout_url
    assert_response :success
  end

end
