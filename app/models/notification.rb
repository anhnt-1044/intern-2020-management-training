class Notification < ApplicationRecord
  PERMITTED_CREATE_ATTRS = %i(content viewed user_id).freeze

  belongs_to :user

  after_create_commit :notify

  scope :leatest, ->{order created_at: :desc}
  scope :unviewed, ->{where viewed: false}

  private

  def notify
    html = ApplicationController.render partial: "shared/notification",
                                        locals: {notification: self},
                                        formats: [:html]
    trainer_ids = User.role_trainer.pluck :id
    trainer_ids.each do |trainer_id|
      new_notifications = Notification.unviewed
      ActionCable.server.broadcast "notifications_#{trainer_id}",
                                   html: html, notification: self,
                                   num_of_notifies: new_notifications.count
    end
  end
end
