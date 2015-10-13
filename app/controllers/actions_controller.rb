class ActionsController < ApplicationController
  def index
    if params[:location]
      @actions = Action.near(params[:location])
    else
      @actions = []
    end
  end
end
