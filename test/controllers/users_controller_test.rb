require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = User.create(name: "Test User", email: "test@example.com",
                     password: "test123", password_confirmation: "test123", type: "student")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should show" do
    get :show, id: @user
    assert_response :success
  end

  test "should make new" do
    get :new
    assert_response :success
  end

end
