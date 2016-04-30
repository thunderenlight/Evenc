class EventsController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user, only: :destroy

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		flash[:success] = "Event removed"
		redirect_to users_url
	end

	private

	def event_params
		params.require(:event).permit(:description, :location, :date, :cost, :picture)
	end
	 def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end
