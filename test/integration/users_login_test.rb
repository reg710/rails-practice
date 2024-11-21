require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "Login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {
      session: {
        email: "",
        password: ""
      }
    }
    assert_response :unprocessable_entity
    assert_not flash.empty?
    assert_select 'div.alert'

    get root_path
    assert flash.empty?
  end
end