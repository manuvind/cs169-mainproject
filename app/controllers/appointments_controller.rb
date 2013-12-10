class AppointmentsController < ApplicationController
  def availability
  	if params['uniq_id']
      debugger
  		@shift = Shift.find_by_uniq_id(params['uniq_id'])
      if !!@shift
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
  		  @shift.rotation.event.users.each do |user|
  			  ShiftNotifier.coordinator_notify(user, @shift, available).deliver
  		  end
  	  end
    end
  end
end
