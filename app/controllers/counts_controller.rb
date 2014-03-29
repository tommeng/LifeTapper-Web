class CountsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_count, only: [:show, :edit, :update, :destroy]

  # GET /counts
  # GET /counts.json
  def index
    activity_id = flash[:activity]
    @counts = Count.find(:all, :conditions => { :activity_id => activity_id })
  end

  # GET /counts/1
  # GET /counts/1.json
  def show
  end

  # GET /counts/new
  def new
    @count = Count.new

    @count.date = Time.now
  end

  # GET /counts/1/edit
  def edit
  end

  # POST /counts
  # POST /counts.json
  def create
    @count = Count.new(count_params)

    respond_to do |format|
      if @count.save
        format.html { redirect_to @count, notice: 'Count was successfully created.' }
        format.json { render action: 'show', status: :created, location: @count }
      else
        format.html { render action: 'new' }
        format.json { render json: @count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counts/1
  # PATCH/PUT /counts/1.json
  def update
    respond_to do |format|
      if @count.update(count_params)
        format.html { redirect_to @count, notice: 'Count was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counts/1
  # DELETE /counts/1.json
  def destroy
    @count.destroy
    respond_to do |format|
      format.html { redirect_to counts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_count
      @count = Count.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def count_params
      params.require(:count).permit(:activity_id, :date)
    end
end
