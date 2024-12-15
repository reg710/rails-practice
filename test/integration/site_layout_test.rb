require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest


  def setup
    @user = users(:michael)
  end
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test "signup page" do
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "users layout links for logged in user" do
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", users_path
  end

  test "no users layout links for user not logged in" do
    get root_path
    assert_select "a[href=?]", users_path, count: 0
  end
end
