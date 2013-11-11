class ShiftsController < ApplicationController
  def index # GET /events/:id/shifts
    @event = Event.find_by_id(params[:event_id])
    @shifts = @event.shifts
  end

  def show
  end

  def new # GET /events/:id/shifts/new
    @event = Event.find_by_id(params[:event_id])
    @shift = @event.shifts.new()
  end

  def create # POST /events/:id/shifts
    @event = Event.find_by_id(params[:event_id])
    @shift = @event.shifts.new params[:shift]

    if @shift.save
      flash[:success] = '#{@shift.title} was successfully created.'
      user = User.first
      ShiftNotifier.shift_notify(user, @shift)
      redirect_to event_shifts_path(@event)
    else
      flash[:error] = '#{@shift.title} was not created.'
      render action: 'new'
    end
  end

  def edit # GET /events/:id/shifts/:shift_id/edit
    @event = Event.find_by_id(params[:event_id])
    @shift = Shift.find params[:id]
  end
  def update # PUT /events/:id/shifts/:shift_id
    @event = Event.find_by_id(params[:event_id])
    @shift = Shift.find params[:id]

    if @shift.update_attributes params[:shift]
      flash[:success] = '#{@shift.title} was successfully updated.'
      redirect_to event_shifts_path(@event)
    else
      flash[:error] = '#{@shift.title} was not updated.'
      render action: 'edit'
    end
  end

  def destroy # DELETE /events/:id/shifts/:shift_id
    @event = Event.find_by_id(params[:event_id])
    Shift.find(params[:id]).destroy
    redirect_to event_shifts_path(@event)
  end
end