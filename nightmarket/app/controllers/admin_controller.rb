class AdminController < ApplicationController
	def dashboard
		if not current_user
			flash[:error] = "logged_out"
			redirect_to controller: "visit", action: "index"
			return
		end

		@authorizedUsers = AuthorizedStudent.all
	end

	def add_new_authorized_user
		if not current_user
			flash[:error] = "logged_out"
			redirect_to controller: "visit", action: "index"
			return
		end
		
		student = AuthorizedStudent.new
		student.email = params[:authorized_student][:email].downcase
		student.role = "member"
		student.save!

		redirect_to action: "dashboard"
	end

	private
	def current_user
  	return current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
