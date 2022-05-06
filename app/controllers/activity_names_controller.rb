class ActivityNamesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities/new
  def new
    @activity = ActivityName.new
    @activity.name = session[:activity]['name'] if !session[:activity].blank?
  end

  # GET /activities/1/edit
  def edit
    @activity.name = session[:activity]['name'] if !session[:activity].blank?
  end

  # POST /activities or /activities.json
  def create
    @activity = ActivityName.new(activity_params)

    if  session[:activity].blank?
      session[:activity] = {
        'name' => @activity.name
      }
    else
      session[:activity] = {
        'name' => @activity.name,
        'address' => session[:activity]['address'],
        'starts_at' => session[:activity]['starts_at'],
        'ends_at' => session[:activity]['ends_at']
      }
    end
    redirect_to new_activity_address_path
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity_name).permit(:name)
    end
end
