require "test_helper"
require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "a user can visit the root path and see the app's name" do
    visit(root_path)
    assert_selector("h1", text: I18n.t("app.app_name"))
  end

  test "a user can visit the root path and see the app's long name" do
    visit(root_path)
    assert_selector("h2", text: I18n.t("app.app_name_long"))
  end

  test "a user can visit the root path and see the app's description" do
    visit(root_path)
    assert_selector("p", text: I18n.t("home.app_description"))
  end

  test "a user can visit the root path and see a link to GitHub" do
    visit(root_path)
    assert_selector("a", text: I18n.t("home.github"))
  end

  test "a user can visit the root path and see a link to login" do
    visit(root_path)
    assert_selector("a", text: I18n.t("navigation.login"))
  end

  test "a user can visit the root path and see a link to register" do
    visit(root_path)
    assert_selector("a", text: I18n.t("navigation.register"))
  end
end
