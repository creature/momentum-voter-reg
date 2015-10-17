class VoterRegistrationActionsController < ApplicationController
  def index
    @all_voter_registration_actions = VoterRegistrationAction.published
    if params[:location]
      @search_location = Geocoder.search(params[:location]).first
      render text: "We're having trouble finding that location" and return unless @search_location.present?
      @search_results = VoterRegistrationAction.published.near(@search_location.coordinates)
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
    flash[:success] = true
    redirect_to action: :index
  end

  private
  def voter_registration_action_params
    params.require(:voter_registration_action).permit(:name, :latitude, :longitude, :meeting_point, :time, :organiser_name, :organiser_phone, :organiser_email, :organiser_address, :fb_event_page, :url, :organiser_phone_public, :organiser_email_public)
  end
end
