class Invitation < ActiveRecord::Base
	belongs_to :event
	belongs_to :invitee, class_name: "User"
	
end
