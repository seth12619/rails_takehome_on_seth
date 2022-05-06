class ActivityDatesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities/new
  def new
    @activity = ActivityDate.new
    @activity.starts_at = session[:activity]['starts_at'] if !session[:starts_at].blank?
    @activity.ends_at = session[:activity]['ends_at'] if !session[:ends_at].blank?
  end

  # GET /activities/1/edit
  def edit
    @activity.starts_at = session[:activity]['starts_at'] if !session[:starts_at].blank?
    @activity.ends_at = session[:activity]['ends_at'] if !session[:ends_at].blank?
  end

  # POST /activities or /activities.json
  def create
    @activity = ActivityDate.new(activity_params)

    session[:activity] = {
      'name' => session[:activity]['name'],
      'address' => session[:activity]['address'],
      'starts_at' => @activity.starts_at,
      'ends_at' => @activity.ends_at
    }
    if params[:commit] == "Save"
      respond_to do |format|
        @new_activity = Activity.new
        @new_activity.name = session[:activity]['name']
        @new_activity.address = session[:activity]['address']
        @new_activity.starts_at = session[:activity]['starts_at']
        @new_activity.ends_at = session[:activity]['ends_at']
        if @new_activity.save
          format.html { redirect_to activity_url(@new_activity), notice: "Activity was successfully created." }
          format.json { render :show, status: :created, location: @new_activity }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @new_activity.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:commit] == "Back"
      redirect_to new_activity_address_path
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
      params.require(:activity_date).permit(:starts_at, :ends_at, :next, :back, :save)
    end
end
