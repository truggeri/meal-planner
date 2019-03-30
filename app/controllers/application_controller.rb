class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    # TODO-truggeri-20190330
    #   Statically set to only user for now, more to come later
    @current_user = User.find_by(id: 1)
  end
end
