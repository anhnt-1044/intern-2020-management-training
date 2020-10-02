class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.unviewed.leatest.limit 5

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def notify_params
    params.require(:notification).permit Notification::PERMITTED_CREATE_ATTRS
  end
end
