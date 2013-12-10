class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def index # GET /events
    if not Event.updateActive()
      flash[:error] = 'Could not retrieve events properly. Please try again.'
    end
    @events = Event.find_all_by_active(true)
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
      flash[:success] = 'Event was successfully created.'
      redirect_to @event
    else
      flash[:error] = 'Uh-oh. Something went wrong. Please try again.'
      render action: 'new'
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
end
