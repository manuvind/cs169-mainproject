class RotationsController < ApplicationController
  # GET /rotations
  # GET /rotations.json
  def index
    @event = Event.find_by_id(params[:event_id])
    @rotations = @event.rotations
  end

  # GET /rotations/1
  # GET /rotations/1.json
  def show
    @rotation = Rotation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rotation }
    end
  end

  # GET /rotations/1/edit
  def edit
    @rotation = Rotation.find(params[:id])
  end

  # POST /rotations
  # POST /rotations.json
  def create
    @event = Event.find_by_id(params[:event_id])
    @rotation = Rotation.new(params[:rotation])
    @rotation.number = @event.rotations.count + 1

    if @rotation.save
      flash[:notice] = "Rotation was successfully created."
      redirect_to event_rotations_path(@event)
    else
      flash[:notice] = "Rotation was not successfully created."
      redirect_to event_rotations_path(@event)
    end
  end

  # DELETE /rotations/1
  # DELETE /rotations/1.json
  def destroy
    @event = Event.find_by_id(params[:event_id])
    if @event.rotations.length <= 1
      flash[:warning] = "Can't delete the last rotation"
    else 
      @rotation = Rotation.find(params[:id])
      @rotation.destroy
      flash[:notice] = "Deleted the rotation."
    end
    redirect_to event_rotations_path(@event)
  end

  def create_rotation
    @event = Event.find_by_id(params[:event_id])
    @rotation = @event.rotations.new(params[:rotation])
    @rotation.number = @event.rotations.count + 1
    
    @event.rotations.first.shifts.each do |s|
      att = s.attributes
      att.delete "volunteer_id"
      att.delete 'id'
      att.delete 'uniq_id'
      att.delete 'available'
      new_shift = @rotation.shifts.new att
      new_shift.save
    end

    if @rotation.save
      flash[:notice] = "Rotation was successfully created."
      redirect_to event_rotations_path(@event)
    else
      flash[:notice] = "Rotation was not successfully created."
      redirect_to event_rotations_path(@event)
    end
  end
end
