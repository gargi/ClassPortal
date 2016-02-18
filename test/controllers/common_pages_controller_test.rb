require 'test_helper'

class CommonPagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get references" do
    get :references
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
