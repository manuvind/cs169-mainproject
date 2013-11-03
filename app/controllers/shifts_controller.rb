class ShiftsController < ApplicationController
  def index # GET /events/:id/shifts
    @event_id = params[:id]
    @shifts = Shift.where params[:id]
  end

  def new # GET /events/:id/shifts/new
    @event_id = params[:id]
    @shift = Shift.new
  end
  def create # POST /events/:id/shifts
    @event_id = params[:id]
    @shift = Shift.new params[:shift]

    if @shift.save
      flash[:success] = '#{@shift.title} was successfully created.'
      redirect_to shift_event_path @event_id
    else
      flash[:error] = '#{@shift.title} was not created.'
      render action: 'new'
    end
  end

  def edit # GET /events/:id/shifts/:shift_id/edit
    @event_id = params[:id]
    @shift = Shift.find params[:shift_id]
  end
  def update # PUT /events/:id/shifts/:shift_id
    @event_id = params[:id]
    @shift = Shift.find params[:shift_id]

    if @shift.update_attributes params[:shift]
      flash[:success] = '#{@shift.title} was successfully updated.'
      redirect_to shift_event_path @event_id
    else
      flash[:error] = '#{@shift.title} was not updated.'
      render action: 'edit'
    end
  end

  def destroy # DELETE /events/:id/shifts/:shift_id
    @event_id = params[:id]
    Shift.find(params[:shift_id]).destroy
    redirect_to shift_event_path @event_id
  end
end