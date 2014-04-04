class SessionsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    activity_id = flash[:activity]
    @sessions = Session.find(:all, :conditions => { :activity_id => activity_id })
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
    @activity = Activity.find(params[:activity])

    @session.start_date = Time.now
    @session.end_date = Time.now
    @session.activity = @activity
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render action: 'show', status: :created, location: @session }
      else
        format.html { render action: 'new' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:activity_id, :start_date, :end_date)
    end
end
