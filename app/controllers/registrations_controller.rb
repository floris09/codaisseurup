class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registered_event = current_user.registered_events.create(registration_params)

    redirect_to @registered_event.event, notice: "Thank you for your registration!"
  end

  private

  def registration_params
    params.require(:registered_event).permit(:status, :price, :guest_count, :event_id)
  end
end
