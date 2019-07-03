class ChatsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@messages = ChatMessage.where('project_id = ?', params[:id])
		@idUser = 1
		@idProject = params[:id]
		@project = Project.find(params[:id])
    	@participants = Join.where('project_id = ?', params[:id]).where('accepted = ?', 1)
    	if current_user.present?
	      @member = Join.where('project_id = ?', params[:id]).where('user_id = ?', current_user.id).where('accepted = ?', 1)
	      if @member.present?
	        @isMember = true
	      else
	        @isMemeber = false
	      end
	    else
	      @isMemeber = false
	    end
	end

	def newMessage
		@msg = ChatMessage.new
		@msg.user = User.find(params[:user])
		@msg.project = Project.find(params[:id])
		@msg.body = params[:body]

		respond_to do |format|
			if @msg.save
				format.html
    		format.json { render :text => "Success" }
			else
				format.html
    		format.json { render :text => "There was an error" }
			end
		end
	end
end
