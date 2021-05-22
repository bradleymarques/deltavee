require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "#toast_klass returns appropriate bootstrap classes" do
    assert_equal("toast align-items-center bg-danger border-0", toast_klass("alert"))
    assert_equal("toast align-items-center bg-primary border-0", toast_klass("something-else"))
  end

  test "#nav_link_klass returns an active nav-link if the current_page is one
        of the paths" do
    stubs("current_page?").returns(true)
    paths = ["path/1", "path/2"]
    assert_equal("nav-link active", nav_link_klass(paths))
  end

  test "#nav_link_klass returns an inactive nav-link if the current_page is one
        of the paths" do
    stubs("current_page?").returns(false)
    paths = ["path/1", "path/2"]
    assert_equal("nav-link", nav_link_klass(paths))
  end
end
