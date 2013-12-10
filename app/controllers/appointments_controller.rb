class AppointmentsController < ApplicationController
  def availability
  	if params['uniq_id']
  		@shift = Shift.find_by_uniq_id(params['uniq_id'])
      if !!@shift
  		  available = false
  		  if !!(params['available'].match('true'))
  			  flash[:notice] = "Thank you for comfirming that you are coming."  			 
          @shift.available = true
  			  available = true
  		  else
  			  flash[:notice] = "Sorry to hear that you can't come."
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
