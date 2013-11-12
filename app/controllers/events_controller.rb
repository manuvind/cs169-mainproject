class EventsController < ApplicationController
  def index # GET /events
    @events = Event.all
  end

  def show # GET /events/:id
    @event = Event.find_by_id(params[:id])
    redirect_to event_shifts_path(@event)
  end

  def new # GET /events/new
    @event = Event.new
  end
  def create # POST /events
    @event = Event.new params[:event]

    if @event.save
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
end