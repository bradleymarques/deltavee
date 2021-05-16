class FirstTimeUserSetup
  def initialize(user)
    @user = user
    @sol = System.find_by!(name: System::SOL)
  end

  def call
    send_user_welcome_notification
    setup_user_fleet
    @user.update!(has_signed_in_at_least_once: true)
  end

  private

  def send_user_welcome_notification
    Notification.create!(
      sender: SystemUser.new.system_user,
      recipient: @user,
      content: "content",
      subject: "subject"
    )
  end

  def setup_user_fleet
    Fleet.create!(
      name: "Starting Fleet",
      owned_by: @user,
      system: @sol,
      spaceships: [
        Spaceship.new(name: "Scout", owned_by: @user),
        Spaceship.new(name: "Miner", owned_by: @user)
      ]
    )
  end
end
