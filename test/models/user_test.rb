require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test User", email: "test@ncsu.edu",
                 password: "test123", password_confirmation: "test123")
end
test "name should be present" do
  @user.name = "     "
  assert_not @user.valid?
end
