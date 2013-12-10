class ShiftsController < ApplicationController
  before_filter :authenticate_user!
  
  def index # GET /events/:id/shifts
    @event = Event.find_by_id(params[:event_id])
    @shifts = @event.shifts
  end

  def show
    @event = Event.find_by_id(params[:event_id])
    @shift = Shift.find params[:id]
  end

  def new # GET /events/:id/shifts/new
    @event = Event.find_by_id(params[:event_id])
    @rotation = Rotation.find_by_id(params[:rotation_id])
    @shift = @event.shifts.new()
  end

  def create # POST /events/:id/shifts
    @event = Event.find_by_id(params[:event_id])
    @rotation = Rotation.find_by_id(params[:rotation_id])
    @shift = @rotation.shifts.new params[:shift]
    shift_copy = @shift.dup

    @shift.volunteer = save_volunteer

    if @shift.save
      if !!@shift.volunteer
        @shift.uniq_id = Digest::MD5.hexdigest(@shift.created_at.to_s + @shift.id.to_s)
        @shift.save
        Shift.delay_notify(@shift)
        ShiftNotifier.shift_notify(@shift).deliver
      end

      # Copy shift w/o volunteer to all other rotations
      @event.rotations.each do |r|
        if r != @rotation
          other_shift = r.shifts.new shift_copy.attributes
          other_shift.save
          other_shift.uniq_id = Digest::MD5.hexdigest(other_shift.created_at.to_s + other_shift.id.to_s)
          other_shift.save
          Shift.delay_notify(other_shift)
          ShiftNotifier.shift_notify(other_shift).deliver
        end
      end

      flash[:success] = @shift.title + ' was successfully created.'
      redirect_to event_rotations_path(@event)
    else
      flash[:error] = @shift.title + ' was not created because of an error.'
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

    new_email_job = false
    if params[:shift_volunteer_id] != @shift.volunteer_id
      new_email_job = true
    end

    volunteer = save_volunteer
    if volunteer != false
      @shift.volunteer = volunteer
    end

    if @shift.update_attributes params[:shift]
      if new_email_job
        Shift.delay_notify(@shift)
        ShiftNotifier.shift_notify(@shift).deliver
      end
      flash[:success] = @shift.title + ' was successfully updated.'
      redirect_to event_rotations_path(@event)
    else
      flash[:error] = '#{@shift.title} was not updated.'
      render action: 'edit'
    end
  end

  def destroy # DELETE /events/:id/shifts/:shift_id
    @event = Event.find_by_id(params[:event_id])
    Shift.find(params[:id]).destroy
    redirect_to event_rotations_path(@event)
  end

  def notify
    shift = Shift.find(params[:shift_id])
    volunteer = Volunteer.find_by_id(shift.volunteer)
    ShiftNotifier.shift_notify(volunteer, shift)
    redirect_to event_rotations_path(Event.find_by_id(params[:event_id]))
  end

  def save_volunteer
    if params[:shift_volunteer_id] == ''
      if params[:shift_volunteer_name] == '' && params[:shift_volunteer_email] == ''
        return false
      end
      name = params[:shift_volunteer_name]
      email = params[:shift_volunteer_email]
      phone = params[:shift_volunteer_phone]
      temp = !params[:shift_volunteer_temp]
      vol = Volunteer.new({:name => name, :email => email, :phone => phone, :temp => temp})
      if vol.save
        return vol
      else
        flash[:error] = 'Error in volunteer information'
        return false
      end
    else
      return Volunteer.find_by_id params[:shift_volunteer_id]
    end
  end

end
