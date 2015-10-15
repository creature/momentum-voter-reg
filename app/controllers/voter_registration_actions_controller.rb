class VoterRegistrationActionsController < ApplicationController
  def index
    if params[:location]
      @voter_registration_actions = VoterRegistrationAction.published.near(params[:location])
    else
      @voter_registration_actions = []
    end
  end

  def show
    @voter_registration_action = VoterRegistrationAction.published.find(params[:id])
  end

  def new
    @voter_registration_action = VoterRegistrationAction.new
  end

  def create
    @voter_registration_action = VoterRegistrationAction.create(voter_registration_action_params)
    redirect_to action: :index
  end

  private
  def voter_registration_action_params
    params.require(:voter_registration_action).permit(:name, :latitude, :longitude, :meeting_point, :time, :organiser_name, :organiser_phone, :organiser_email, :organiser_address, :fb_event_page, :url)
  end
end
