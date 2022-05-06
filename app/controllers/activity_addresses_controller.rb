class ActivityAddressesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities/new
  def new
    @activity = ActivityAddress.new
    @activity.address = session[:activity]['address'] if !session[:activity].blank?
  end

  # GET /activities/1/edit
  def edit
    @activity.address = session[:activity]['address'] if !session[:activity].blank?
  end

  # POST /activities or /activities.json
  def create
    @activity = ActivityAddress.new(activity_params)

    session[:activity] = {
      'name' => session[:activity]['name'],
      'address' => @activity.address,
      'starts_at' => session[:activity]['starts_at'],
      'ends_at' => session[:activity]['ends_at']
    }
    if params[:commit] == "Next"
      redirect_to new_activity_date_path
    elsif params[:commit] == "Back"
      redirect_to new_activity_name_path
    end
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
      params.require(:activity_address).permit(:address, :next, :back)
    end
end
