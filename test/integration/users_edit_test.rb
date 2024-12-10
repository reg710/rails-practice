require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
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
end
