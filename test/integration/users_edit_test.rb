require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        name: "",
        email: "email@invalid",
        password: "test",
        password_confirmation: "invalid"
      }
    }
    assert_template 'users/edit'
    assert_select 'div.alert', text: "The form contains 4 errors."
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    assert_equal session[:forwarding_url], edit_user_url
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Dougie Jones"
    email = "dj@example.com"
    patch user_path(@user), params: {
      user: {
        name: name,
        email: email,
        password: "",
        password_confirmation: ""
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
