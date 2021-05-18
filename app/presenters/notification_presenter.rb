class NotificationPresenter < BasePresenter
  SNIPPET_SIZE = 40

  def snippet
    content.body.to_plain_text.truncate(SNIPPET_SIZE)
  end
end
