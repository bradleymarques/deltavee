class NotificationsController < RestrictedAccessController
  def inbox
    @notifications = policy_scope(
      Notification,
      policy_scope_class: ReceivedNotificationPolicy::Scope
    )
  end

  def outbox
    @notifications = policy_scope(
      Notification,
      policy_scope_class: SentNotificationPolicy::Scope
    )
  end

  def show
    @notification = Notification.find(params.require(:id))
    authorize(@notification)
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
      flash[:success] = "Sent"
      redirect_to(outbox_path)
    else
      flash[:alert] = @notification.errors.full_messages.to_sentence
      render(:new)
    end
  end

  def create_params
    params.require(:notification).permit(:recipient, :subject, :content)
  end
end
