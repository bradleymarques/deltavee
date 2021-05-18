require "test_helper"

class NotificationPresenterTest < ActiveSupport::TestCase
  test "#snippet returns the plain text content" do
    content = "This is a short mail"

    notification = FactoryBot.create(
      :notification,
      content: content
    )

    presenter = NotificationPresenter.new(notification)

    assert_equal(content, presenter.snippet)
  end

  test "#snippet returns a truncated version of a long content" do
    content = "Beginning #{Faker::Lorem.characters(number: 200)}"

    notification = FactoryBot.create(
      :notification,
      content: content
    )

    presenter = NotificationPresenter.new(notification)

    snippet = presenter.snippet

    refute_equal(content, snippet)
    assert_includes(snippet, "Beginning")
    assert_equal(NotificationPresenter::SNIPPET_SIZE, snippet.size)
  end
end
