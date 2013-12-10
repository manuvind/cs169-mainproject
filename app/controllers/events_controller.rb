class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def index # GET /events
    events_sort = params[:events_sort]
    events_filter = params[:events_filter]

    refresh = !(events_sort and events_filter)
    
    events_sort = events_sort ? events_sort : 'title'
    events_filter = events_filter ? events_filter : 'none'

    if refresh
      redirect_to events_path(:events_sort => events_sort, :events_filter => events_filter) and return
    end

    if not Event.updateActive()
      flash[:error] = 'Could not retrieve events properly. Please try again.'
    end

    if events_filter == 'none'
      @events = Event.find_all_by_active(true, :order => events_sort)
    else
      repeating = events_filter == 'one_time' ? false : true
      @events = Event.where({:active => true, :repeating => repeating}, :order => events_sort)
    end

    reminders = Reminder.where(user_id: current_user.id)
    @notifies = reminders.map{ |r| r.event_id }
  end

  def show # GET /events/:id
    @event = Event.find_by_id(params[:id])
    redirect_to event_rotations_path(@event)
  end

  def new # GET /events/new
    @event = Event.new
  end
  def create # POST /events
    @event = Event.new params[:event]

    if @event.save
      @event.rotations.create(:number => 1)
      @event.reminders.create({:user_id => current_user.id})

      # if @event.repeating
      #   #EventsController.delay(run_at: (DateTime.now + 604800)).repeat(@event)
      # end

      flash[:success] = 'Event was successfully created.'
      redirect_to @event
    else
      flash[:error] = 'Uh-oh. Something went wrong. Please try again.'
      redirect_to :back
    end
  end
  
  def edit # GET /events/:id/edit
    @event = Event.find params[:id]
  end
  def update # PUT /events/:id
    @event = Event.find params[:id]

    if @event.update_attributes params[:event]
      flash[:success] = 'Event was successfully updated.'
      redirect_to events_path
    else
      flash[:error] = 'Uh-oh. Something went wrong. Please try again.'
      render action: 'edit'
    end
  end

  def destroy # DELETE /events/:id
    Event.find(params[:id]).destroy
    redirect_to events_url
  end

  def old
    if not Event.updateActive()
      flash[:error] = 'Could not retrieve events properly. Please try again.'
    end
    @events = Event.find_all_by_active(false)
    render action: 'old', layout: 'application'
  end

  def create_reminder
    @event = Event.find_by_id(params[:event_id])
    if !@event.reminders.find_by_user_id(current_user.id)
      @event.reminders.create({:user_id => current_user.id})
      flash[:notice] = 'You will now be reminded of volunteer staffing concerning this event.'
    else
      flash[:notice] = 'You are already reminded of volunteer staffing concerning this event.'
    end
    redirect_to events_url
  end

  # def repeat(event)
  #   if event.repeat_to < Date.today
  #     return
  #   end
  #   event.time += 604800 #Add a week
  #   if event.current_rotation == event.rotations.length
  #     event.current_rotation = 1
  #   else
  #     event.current_rotation += 1
  #   end
  #   event.shifts.each do |s|
  #     s.time += 604800
  #     s.reminder += 604800
  #     s.save
  #   end
  #   event.rotations[current_rotation].shifts do |s|
  #     Shift.delay_notify(s)
  #   end
  #   event.save
  #   delay(run_at: (DateTime.now + 604800)).repeat(@event)
  # end
end
