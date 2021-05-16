class SystemUser
  USERNAME = Rails.application.credentials.system_user[:username]
  EMAIL = Rails.application.credentials.system_user[:email]
  PASSWORD = Rails.application.credentials.system_user[:password]

  attr_reader :system_user

  def initialize
    @system_user = find_or_create_system_user!
  end

  private

  def find_or_create_system_user!
    user = User.find_by(username: USERNAME)
    return user if user

    User.create!(
      username: USERNAME,
      email: EMAIL,
      password: PASSWORD,
      password_confirmation: PASSWORD
    )
  end
end
