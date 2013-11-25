class ShiftsController < ApplicationController
  before_filter :authenticate_user!
  
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

    save_volunteer

    if @shift.save
      Shift.delay_notify(@shift)
      flash[:success] = '#{@shift.title} was successfully created.'
      redirect_to event_shifts_path(@event)
    else
      #flash[:error] = '#{@shift.title} was not created.'
      #render action: 'new'
    end
  end

  def edit # GET /events/:id/shifts/:shift_id/edit
    @event = Event.find_by_id(params[:event_id])
    @shift = Shift.find params[:id]
  end

  def update # PUT /events/:id/shifts/:shift_id
    @event = Event.find_by_id(params[:event_id])
    @shift = Shift.find params[:id]

    save_volunteer

    if @shift.update_attributes params[:shift]
      flash[:success] = '#{@shift.title} was successfully updated.'
      redirect_to event_shifts_path(@event)
    else
      #flash[:error] = '#{@shift.title} was not updated.'
      #render action: 'edit'
    end
  end

  def destroy # DELETE /events/:id/shifts/:shift_id
    @event = Event.find_by_id(params[:event_id])
    Shift.find(params[:id]).destroy
    redirect_to event_shifts_path(@event)
  end

  def notify
    shift = Shift.find(params[:shift_id])
    volunteer = Volunteer.find_by_id(shift.volunteer)
    ShiftNotifier.shift_notify(volunteer, shift)
    redirect_to event_shifts_path(Event.find_by_id(params[:event_id]))
  end

  def save_volunteer
    if params[:shift_volunteers] == nil
      name = params[:volunteer_name]
      email = params[:volunteer_email]
      phone = params[:volunteer_phone]
      temp = !params[:volunteer_temp]
      vol = Volunteer.new {:name => name, :email => email, :phone => phone, :temp => temp}

      if vol.save
        @shift.update_attributes {:volunteer_id => vol.id}
      else
        flash[:error] = 'Error in volunteer information'
        return false
    else
      @shift.volunteer_id = params[:shift_volunteers]
    end
    return true
  end
  
end