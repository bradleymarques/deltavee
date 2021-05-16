class PlayerController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_player!

  private

  def authenticate_player!
    raise Pundit::NotAuthorizedError unless current_user.player?
  end
end
