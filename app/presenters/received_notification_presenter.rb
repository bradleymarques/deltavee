class ReceivedNotificationPresenter < BasePresenter
  def link_klass
    read? ? "link-secondary" : "link-primary fw-bold"
  end

  def snippet
    content.body.to_plain_text.truncate(40)
  end
end
