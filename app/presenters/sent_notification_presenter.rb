class SentNotificationPresenter < BasePresenter
  def link_klass
    "link-secondary"
  end

  def snippet
    content.body.to_plain_text.truncate(40)
  end
end
