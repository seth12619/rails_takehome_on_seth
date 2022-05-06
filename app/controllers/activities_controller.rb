class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
    session.delete(:activity)
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    if activity_params.include?("name")
      if session[:activity].blank?
        @activity.name = activity_params["name"]
        session[:activity] = {
          'name' => activity_params["name"],
          'address' => @activity.address,
          'starts_at' => @activity.starts_at,
          'ends_at' => @activity.ends_at
        }
      else
        @activity.name = activity_params["name"]
        session[:activity] = {
          'name' => activity_params["name"],
          'address' => session[:activity]['address'],
          'starts_at' => session[:activity]['starts_at'],
          'ends_at' => session[:activity]['ends_at']
        }
      end
      redirect_to edit_activity_address_path, id: @activity.id
    elsif activity_params.include?("address")
      @activity.address = activity_params["address"]
      session[:activity] = {
        'name' => session[:activity]['name'],
        'address' => activity_params["address"],
        'starts_at' => session[:activity]['starts_at'],
        'ends_at' => session[:activity]['ends_at']
      }
      if params[:commit] == "Next"
        redirect_to edit_activity_date_path, id: @activity.id
      elsif params[:commit] == "Back"
        redirect_to edit_activity_name_path, id: @activity.id
      end
    elsif activity_params.include?("starts_at") && activity_params.include?("ends_at")
      session[:activity] = {
        'name' => session[:activity]['name'],
        'address' => session[:activity]['address'],
        'starts_at' => activity_params["starts_at"],
        'ends_at' => activity_params["ends_at"]
      }
      @activity.name = session[:activity]['name']
      @activity.address = session[:activity]['address']
      @activity.starts_at = session[:activity]['starts_at']
      @activity.ends_at = session[:activity]['ends_at']
      if params[:commit] == "Save"
        respond_to do |format|
          if @activity.save!
            format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
            format.json { render :show, status: :ok, location: @activity }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @activity.errors, status: :unprocessable_entity }
          end
        end
      elsif params[:commit] == "Back"
        redirect_to edit_activity_address_path, id: @activity.id
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :address, :starts_at, :ends_at)
    end
end
