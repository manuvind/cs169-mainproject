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

  # GET /rotations/new
  # GET /rotations/new.json
  def new
    create
    redirect_to event_rotations_path(@event)
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

  # PUT /rotations/1
  # PUT /rotations/1.json
  def update
    @rotation = Rotation.find(params[:id])

    respond_to do |format|
      if @rotation.update_attributes(params[:rotation])
        format.html { redirect_to @rotation, notice: 'Rotation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rotations/1
  # DELETE /rotations/1.json
  def destroy
    @rotation = Rotation.find(params[:id])
    @rotation.destroy

    respond_to do |format|
      format.html { redirect_to rotations_url }
      format.json { head :no_content }
    end
  end

  def create_rotation
    @event = Event.find_by_id(params[:event_id])
    @rotation = @event.rotations.new(params[:rotation])
    @rotation.number = @event.rotations.count + 1
    #debugger
    if @rotation.save
      flash[:notice] = "Rotation was successfully created."
      redirect_to event_rotations_path(@event)
    else
      flash[:notice] = "Rotation was not successfully created."
      redirect_to event_rotations_path(@event)
    end
  end
end
