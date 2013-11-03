class ShiftsController < ApplicationController
  def index # GET /events/:event_id/shifts
    @shifts = Shift.where params[:event_id]
  end

  def show

  end

  def create

  end
  def new

  end

  def edit

  end
  def update

  end

  def destroy

  end
end