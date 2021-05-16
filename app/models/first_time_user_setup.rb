class FirstTimeUserSetup
  def initialize(user)
    raise NotImplementedError
    @user = user
    @sol = System.sol
  end

  def call
    send_user_welcome_notification
    setup_user_fleet
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
