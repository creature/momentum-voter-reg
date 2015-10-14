class VoterRegistrationActionsController < ApplicationController
  def index
    if params[:location]
      @voter_registration_actions = VoterRegistrationAction.near(params[:location])
    else
      @voter_registration_actions = []
    end
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

  private
  def voter_registration_action_params
    params.require(:voter_registration_action).permit(:name, :latitude, :longitude, :meeting_point, :time, :organiser)
  end
end
