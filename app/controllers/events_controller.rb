class EventsController < ApplicationController


  

  private def property_params
    params.require(:event).permit(:start_time,:end_time)
  end

end
