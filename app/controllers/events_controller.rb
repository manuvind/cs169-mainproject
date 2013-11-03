class EventsController < ApplicationController
  def index # GET /events
    @events = Event.all
  end

  def show # GET /events/:id
    redirect_to shift_event_path(Event.find(params[:id]))
  end

  def new # GET /events/new
    @event = Event.new
  end
  def create # POST /events
    @event = Event.new params[:event]

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def edit # GET /events/:id/edit
    @event = Event.find(params[:id])
  end
  def update # PUT /events/:id
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy # DELETE /events/:id
    Event.find(params[:id]).destroy
    redirect_to events_url
  end
end
