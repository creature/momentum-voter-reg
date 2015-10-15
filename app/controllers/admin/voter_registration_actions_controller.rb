class Admin::VoterRegistrationActionsController < ApplicationController
  def index
    @voter_registration_actions = VoterRegistrationAction.all
  end

  def edit
    @voter_registration_action = VoterRegistrationAction.find(params[:id])
  end

  def update
    @voter_registration_action = VoterRegistrationAction.find(params[:id])
    @voter_registration_action.update_attributes(voter_registration_action_params)
    redirect_to action: :index
  end

  private
  def voter_registration_action_params
    params.require(:voter_registration_action).permit(:name, :latitude, :longitude, :meeting_point, :time, :organiser_name, :organiser_phone, :organiser_email, :organiser_address, :fb_event_page, :url)
  end
end