##
# Override of Devise's default SessionsController
#
class SessionsController < Devise::SessionsController
  def create
    super

    return unless first_time_player_setup?

    FirstTimeUserSetup.new(current_user).call
  end

  private

  def first_time_player_setup?
    !current_user.has_signed_in_at_least_once? && current_user.player?
  end
end
