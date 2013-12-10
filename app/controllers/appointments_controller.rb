class AppointmentsController < ApplicationController
  def availability
  	if params['uniq_id']
  		@shift = Shift.find_by_uniq_id(params['uniq_id'])
  		available = false
  		if !!(params['available'].match('true'))
  			flash[:notice] = "You are coming dawg!"
  			@shift.available = true
  			available = true
  		else
  			flash[:notice] = "You are no longer coming you are not my dawg!"
  			@shift.available = false
  		end
  		@shift.save
  		@shift.event.users.each do |user|
  			ShiftNotifier.coordinator_notify(user, @shift, available).deliver
  		end
  	end
  end
end
