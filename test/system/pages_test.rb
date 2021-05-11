require "test_helper"
require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "a user can visit the root path and see the app's name" do
    visit(root_path)
    assert_selector("h1", text: I18n.t("app.app_name"))
  end

  test "a user can visit the root path and see a link to login" do
    visit(root_path)
    assert_selector("a", text: I18n.t("navigation.login"))
  end

  test "a user can visit the root path and see a link to register" do
    visit(root_path)
    assert_selector("a", text: I18n.t("navigation.register"))
  end

  test "a user can visit the root path and see a link to the about page, follow
        this link and read about the game" do
    visit(root_path)
    assert_selector("a", text: I18n.t("navigation.about"))
    click_on(I18n.t("navigation.about"))
    assert_selector("h1", text: I18n.t("navigation.about"))
  end
end
