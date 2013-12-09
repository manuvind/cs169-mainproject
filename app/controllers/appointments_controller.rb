class AppointmentsController < ApplicationController
  def availability
  	debugger
  	if params['uniq_id']
  		@shift = Shift.find_by_uniq_id(params['uniq_id'])
  		debugger
  		if !!(params['available'].match('true'))
  			flash[:notice] = "You are coming dawg!"
  			@shift.available = true
  			@shift.event.users.each do |user|
  				ShiftNotifier.coordinator_notify(user, @shift).deliver
  			end
  		else
  			flash[:notice] = "You are no longer coming you are not my dawg!"
  			@shift.available = false
  		end
  		@shift.save
  	end
  end
end
