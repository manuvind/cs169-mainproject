class VolunteersController < ApplicationController
  # GET /volunteers
  # GET /volunteers.json
  before_filter :authenticate_user!
  
  def index
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volunteers }
    end
  end

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
    @volunteer = Volunteer.find(params[:id])
    redirect_to volunteers_path
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @volunteer }
    #end
  end

  # GET /volunteers/new
  # GET /volunteers/new.json
  def new
    @volunteer = Volunteer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volunteer }
    end
  end

  # GET /volunteers/1/edit
  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(params[:volunteer])
    @volunteer.temp = false;

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to volunteer_path(@volunteer), notice: 'Volunteer was successfully created.' }
        format.json { render json: volunteers_path, status: :created, location: volunteers_path }
      else
        format.html { render :action => 'new' }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volunteers/1
  # PUT /volunteers/1.json
  def update
    @volunteer = Volunteer.find(params[:id])

    if @volunteer.update_attributes(params[:volunteer])
      redirect_to volunteers_path, notice: 'Volunteer was successfully updated.'
    else
      format.html { render :action => 'edit' }
      render json: @volunteer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy

    shift_list = Shift.where("volunteer_id = ?", @volunteer)
    shift_list.each{|shift| shift.update_attributes(:volunteer_id => nil)}

    respond_to do |format|
      format.html { redirect_to volunteers_url }
      format.json { head :no_content }
    end
  end
end
