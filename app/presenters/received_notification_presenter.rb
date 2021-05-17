class ReceivedNotificationPresenter < BasePresenter
  def link_klass
    read? ? "text-muted" : "fw-bold"
  end

  def snippet
    content.body.to_plain_text.truncate(40)
  end
end
