require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "a user can visit the root path" do
    get(root_path)
    assert_response(:ok)
    assert_template(:home)
  end

  test "a user can visit the home page" do
    get(home_path)
    assert_response(:ok)
    assert_template(:home)
  end

  test "a user can visit the about page" do
    get(about_path)
    assert_response(:ok)
    assert_template(:about)
  end
end
