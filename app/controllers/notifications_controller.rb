class NotificationsController < PlayerController
  def inbox
    @pagy, notification_records = pagy(
      policy_scope(
        Notification,
        policy_scope_class: ReceivedNotificationPolicy::Scope
      )
    )

    @notifications = NotificationPresenter.collection(notification_records)
  end

  def outbox
    @pagy, notification_records = pagy(
      policy_scope(
        Notification,
        policy_scope_class: SentNotificationPolicy::Scope
      )
    )

    @notifications = NotificationPresenter.collection(notification_records)
  end

  def show
    @notification = Notification.find(params.require(:id))
    authorize(@notification)
    @notification.update!(read: true) if current_user == @notification.recipient
  end

  def new
    @notification = Notification.new
  end

  def create
    recipient = User.find_by(username: create_params[:recipient])

    @notification = Notification.new(
      sender: current_user,
      recipient: recipient,
      subject: create_params[:subject],
      content: create_params[:content]
    )

    if @notification.save
      flash[:success] = I18n.t("notifications.sent")
      redirect_to(outbox_path)
    else
      flash[:alert] = @notification.errors.full_messages.to_sentence
      render(:new)
    end
  end

  private

  def create_params
    params.require(:notification).permit(:recipient, :subject, :content)
  end
end
