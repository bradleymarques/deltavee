class NotificationPresenter < BasePresenter
  def snippet
    content.body.to_plain_text.truncate(40)
  end
end
