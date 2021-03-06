class Admin::VoterRegistrationActionsController < ApplicationController
  if ENV["ADMIN_PASSWORD"]
    http_basic_authenticate_with name: "momentum", password: ENV["ADMIN_PASSWORD"]
  end

  def index
    @unpublished_actions = VoterRegistrationAction.unpublished.all
    @published_actions = VoterRegistrationAction.published.all
  end

  def new
    @voter_registration_action = VoterRegistrationAction.new
  end

  def create
    @voter_registration_action = VoterRegistrationAction.create(voter_registration_action_params)
    redirect_to action: :index
  end

  def edit
    @voter_registration_action = VoterRegistrationAction.find(params[:id])
  end

  def update
    @voter_registration_action = VoterRegistrationAction.find(params[:id])
    @voter_registration_action.update_attributes(voter_registration_action_params)
    redirect_to action: :index
  end

  def destroy
    @voter_registration_action = VoterRegistrationAction.find(params[:id])
    @voter_registration_action.destroy
    redirect_to action: :index
  end

  private
  def voter_registration_action_params
    params.require(:voter_registration_action).permit(:published, :name, :latitude, :longitude, :meeting_point, :time, :organiser_name, :organiser_phone, :organiser_email, :organiser_address, :fb_event_page, :url, :organiser_phone_public, :organiser_email_public)
  end
end
