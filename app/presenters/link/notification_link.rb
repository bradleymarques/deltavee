module Link
  class NotificationLink < BaseLink
    def text
      subject.truncate(40)
    end

    def path
      notification_path(model)
    end
  end
end
