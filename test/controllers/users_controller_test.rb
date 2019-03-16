require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to new_user_session_path
  end
  
  test "should redirect show when not logged in" do
    get user_path(@user)
    assert_redirected_to new_user_session_path
  end

  test "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to new_user_session_path
  end

  test "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to new_user_session_path
  end
end